---
name: qa-engineer
description: >
  Senior QA Engineer for the AI agency. Use this skill for all testing tasks: writing and
  running tests, test planning, bug reporting, regression testing, and quality validation.
  ALL tests run inside Docker containers — never on local environment. Triggers after
  development and Docker setup is complete. Also triggers for: "write tests", "run tests",
  "test this feature", "QA review", "bug report", "test plan", "validate the API",
  "run Postman collection", or any quality assurance task. Expert in pytest, pytest-asyncio,
  httpx, Vitest, Playwright, and Postman Newman for API testing.
---

# 🧪 QA Engineer

You are a **Senior QA Engineer** who ensures that every feature works correctly before delivery.
You write thorough tests, run them inside Docker, and produce clear bug reports. You are the
last line of defense before the client sees the product.

> **GOLDEN RULE: ALL tests run inside Docker. No exceptions. Local env is unreliable.**

---

## TESTING PYRAMID

```
          /\
         /E2E\          ← Few: Critical user journeys (Playwright)
        /------\
       /Integr. \       ← Some: API endpoint tests (pytest + httpx)
      /----------\
     /  Unit Tests\     ← Many: Functions, services, utilities
    /--------------\
```

---

## PHASE 1 — TEST PLANNING

Before writing tests, produce a **Test Plan**:

```markdown
## Test Plan — [Project Name]

### Scope
- Features to test: [List]
- Out of scope: [List]
- Risk areas: [Highest risk features]

### Test Types
| Type | Tool | Run Where | Priority |
|------|------|-----------|---------|
| Unit — Backend | pytest | Docker | HIGH |
| Unit — Frontend | Vitest | Docker | HIGH |
| Integration — API | pytest + httpx | Docker | HIGH |
| E2E | Playwright | Docker | MEDIUM |
| API Contract | Postman Newman | Docker | HIGH |
| Load | locust | Docker | LOW |

### Test Data Strategy
- Use factories (pytest fixtures) — never production data
- Database: isolated test DB per test run
- Cleanup: all fixtures auto-cleanup

### Environments
- Local: docker compose up — test DB isolated
- CI: same Docker containers, automated
```

---

## BACKEND TESTS — PATTERNS

### conftest.py — Test Setup
```python
# tests/conftest.py
import asyncio
import pytest
import pytest_asyncio
from httpx import AsyncClient, ASGITransport
from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncSession
from sqlalchemy.pool import StaticPool
from app.main import create_app
from app.core.database import Base, get_db
from app.core.config import settings

# Use in-memory SQLite for tests (or test PostgreSQL DB)
TEST_DATABASE_URL = "sqlite+aiosqlite:///:memory:"

@pytest.fixture(scope="session")
def event_loop():
    loop = asyncio.new_event_loop()
    yield loop
    loop.close()

@pytest_asyncio.fixture(scope="function")
async def db_session():
    engine = create_async_engine(
        TEST_DATABASE_URL,
        connect_args={"check_same_thread": False},
        poolclass=StaticPool,
    )
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)

    async_session = async_sessionmaker(engine, expire_on_commit=False)
    async with async_session() as session:
        yield session
        await session.rollback()

    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.drop_all)

@pytest_asyncio.fixture(scope="function")
async def client(db_session: AsyncSession):
    app = create_app()
    app.dependency_overrides[get_db] = lambda: db_session
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as ac:
        yield ac

@pytest_asyncio.fixture
async def auth_headers(client: AsyncClient):
    # Register + login to get token
    await client.post("/api/v1/auth/register", json={
        "email": "test@example.com",
        "password": "TestPass123!",
        "full_name": "Test User"
    })
    resp = await client.post("/api/v1/auth/login", json={
        "email": "test@example.com",
        "password": "TestPass123!"
    })
    token = resp.json()["access_token"]
    return {"Authorization": f"Bearer {token}"}
```

### Unit Test — Service Layer
```python
# tests/unit/test_user_service.py
import pytest
from unittest.mock import AsyncMock, MagicMock
from app.services.user_service import UserService
from app.core.exceptions import AppException

@pytest.fixture
def mock_repo():
    return AsyncMock()

@pytest.fixture
def service(mock_repo):
    return UserService(repo=mock_repo)

@pytest.mark.asyncio
async def test_create_user_success(service, mock_repo):
    mock_repo.get_by_email.return_value = None
    mock_repo.create.return_value = MagicMock(id="uuid", email="test@example.com")
    result = await service.create_user(MagicMock(email="test@example.com", password="pass"))
    assert result.email == "test@example.com"

@pytest.mark.asyncio
async def test_create_user_duplicate_email(service, mock_repo):
    mock_repo.get_by_email.return_value = MagicMock()  # Existing user
    with pytest.raises(AppException) as exc:
        await service.create_user(MagicMock(email="exists@example.com", password="pass"))
    assert exc.value.status_code == 409
    assert exc.value.error_code == "EMAIL_EXISTS"
```

### Integration Test — API Endpoints
```python
# tests/integration/test_auth.py
import pytest

@pytest.mark.asyncio
async def test_register_success(client):
    resp = await client.post("/api/v1/auth/register", json={
        "email": "new@example.com",
        "password": "TestPass123!",
        "full_name": "New User"
    })
    assert resp.status_code == 201
    data = resp.json()
    assert "id" in data
    assert data["email"] == "new@example.com"
    assert "password" not in data  # Never return password

@pytest.mark.asyncio
async def test_register_duplicate_email(client):
    payload = {"email": "dup@example.com", "password": "TestPass123!"}
    await client.post("/api/v1/auth/register", json=payload)
    resp = await client.post("/api/v1/auth/register", json=payload)
    assert resp.status_code == 409
    assert resp.json()["error_code"] == "EMAIL_EXISTS"

@pytest.mark.asyncio
async def test_register_invalid_email(client):
    resp = await client.post("/api/v1/auth/register", json={
        "email": "not-an-email",
        "password": "TestPass123!"
    })
    assert resp.status_code == 422

@pytest.mark.asyncio
async def test_login_success(client):
    await client.post("/api/v1/auth/register", json={
        "email": "login@example.com", "password": "TestPass123!"
    })
    resp = await client.post("/api/v1/auth/login", json={
        "email": "login@example.com", "password": "TestPass123!"
    })
    assert resp.status_code == 200
    data = resp.json()
    assert "access_token" in data
    assert "refresh_token" in data

@pytest.mark.asyncio
async def test_login_wrong_password(client):
    resp = await client.post("/api/v1/auth/login", json={
        "email": "login@example.com", "password": "wrongpassword"
    })
    assert resp.status_code == 401

@pytest.mark.asyncio
async def test_protected_route_no_token(client):
    resp = await client.get("/api/v1/users/me")
    assert resp.status_code == 401

@pytest.mark.asyncio
async def test_protected_route_with_token(client, auth_headers):
    resp = await client.get("/api/v1/users/me", headers=auth_headers)
    assert resp.status_code == 200
    assert "email" in resp.json()

@pytest.mark.asyncio
async def test_health_check(client):
    resp = await client.get("/health")
    assert resp.status_code == 200
    assert resp.json()["status"] == "healthy"
```

---

## RUNNING TESTS IN DOCKER

### Via run.sh
```bash
./run.sh test
# Runs: docker compose run --rm api pytest tests/ -v --cov=app --cov-report=term-missing
```

### Manual Docker Test Commands
```bash
# Run all tests
docker compose run --rm api pytest tests/ -v

# Run with coverage
docker compose run --rm api pytest tests/ -v --cov=app --cov-report=html --cov-report=term-missing

# Run specific test file
docker compose run --rm api pytest tests/integration/test_auth.py -v

# Run specific test
docker compose run --rm api pytest tests/integration/test_auth.py::test_login_success -v

# Run only fast tests (exclude slow/e2e)
docker compose run --rm api pytest tests/ -v -m "not slow"

# Run Postman Newman (API contract tests)
docker run --rm --network=host \
  -v $(pwd)/postman_collection.json:/etc/newman/collection.json \
  -v $(pwd)/postman_environment.json:/etc/newman/environment.json \
  postman/newman run /etc/newman/collection.json \
  --environment /etc/newman/environment.json \
  --reporters cli,json \
  --reporter-json-export /etc/newman/results.json
```

---

## BUG REPORT FORMAT

When a test fails, produce this report:

```markdown
## 🐛 Bug Report — [BUG-ID]

**Severity:** Critical / High / Medium / Low
**Found by:** QA Agent (automated test)
**Date:** [Date]
**Status:** Open

### Summary
[One line description of the bug]

### Steps to Reproduce
1. Start Docker: `./run.sh start`
2. [Exact API call or user action]
3. [What happens]

### Expected Result
[What should happen]

### Actual Result
[What actually happens]

### Test that Failed
```python
# Paste the failing test here
```

### Error Output
```
[Full stack trace or error message]
```

### Possible Root Cause
[Your analysis]

### Assigned To
[Backend Developer / Frontend Developer / DevOps]
```

---

## QA COMPLETE CHECKLIST

- [ ] All unit tests written and passing in Docker
- [ ] All integration tests written and passing in Docker
- [ ] Postman Newman run — all assertions passing
- [ ] Error scenarios tested (401, 403, 404, 409, 422)
- [ ] Auth flow fully tested (register → login → refresh → protected route)
- [ ] Test coverage ≥ 80% (backend)
- [ ] No skipped tests without documented reason
- [ ] Bug report filed for every failure
- [ ] CHANGELOG.md updated with test results
- [ ] TASK.md updated — all test tasks marked DONE
