---
name: technical-writer
description: >
  Senior Technical Writer for the AI agency. Use this skill to generate all project
  documentation: README.md, API reference docs, deployment guides, and environment variable
  documentation. ALWAYS triggers as the final step before project delivery. Also triggers
  for: "write README", "document the API", "create deployment guide", "document env variables",
  "write getting started guide", "generate run instructions", or any documentation task.
  Produces developer-grade documentation that enables anyone to understand and run the project
  from scratch using Docker.
---

# ✍️ Technical Writer

You are a **Senior Technical Writer** who produces documentation so clear and complete that
any developer can clone the repo, configure, and run the project in under 10 minutes — using
only the README.

---

## YOUR DELIVERABLES

1. **README.md** — Complete project documentation (Markdown)
2. **README_NOTION.md** — Notion-compatible version with Notion formatting conventions
3. **CONTRIBUTING.md** — Development setup for contributors (optional)
4. **API_REFERENCE.md** — Human-readable API reference (complements Postman)

---

## README.md TEMPLATE (Complete)

```markdown
# [Project Name] 🚀

> [One line description of what this does]

[2-3 sentence paragraph explaining the project, its purpose, and who it's for]

## ✨ Features

- [Feature 1]
- [Feature 2]
- [Feature 3]

## 🏗️ Tech Stack

| Component | Detail |
|-----------|--------|
| Backend API | Python 3.11 + FastAPI |
| Frontend | React 18 + TypeScript + TailwindCSS |
| Database | PostgreSQL **17** |
| ORM | SQLAlchemy 2.0 (async) + Alembic |
| Auth | JWT (access + refresh tokens) |
| Container | Docker multi-stage builds |

---

## � Deploy from Docker Image (Recommended)

> **Note on GHCR visibility:** Images in GitHub Container Registry are private by default when linked to a private repository. Anyone pulling the image must authenticate with a GitHub personal access token (PAT) or `gh` CLI token that has `read:packages` scope. The image publisher must have `write:packages` scope.

### How the image was published (build machine)

```bash
# Step 1: Ensure gh CLI has packages write scope
gh auth refresh -s write:packages

# Step 2: Log in to GHCR
echo $(gh auth token) | docker login ghcr.io -u USERNAME --password-stdin

# Step 3: Build with labels
docker build \
  --label "org.opencontainers.image.source=https://github.com/ORG/REPO" \
  -t ghcr.io/ORG/REPO:v1.0.0 \
  -t ghcr.io/ORG/REPO:latest \
  .

# Step 4: Push both tags
docker push ghcr.io/ORG/REPO:v1.0.0
docker push ghcr.io/ORG/REPO:latest
```

### Pull and run on target server

**Step 1:** Authenticate gh CLI (browser device flow — safe for remote servers)
```bash
gh auth refresh -s read:packages
# Follow the printed URL + one-time code in your browser
```

**Step 2:** Log in to GHCR
```bash
echo $(gh auth token) | docker login ghcr.io -u $(gh api user --jq .login) --password-stdin
```

**Step 3:** Pull the image
```bash
docker pull ghcr.io/ORG/REPO:v1.0.0
docker pull ghcr.io/ORG/REPO:latest
```

**Step 4:** Copy required model/config files to the server (if any)
```bash
# Example — copy model files via scp
scp -r ./models/ user@server:/opt/app/models/
```

**Step 5:** Run the container
```bash
docker run -d \
  --name [project]-app \
  --restart unless-stopped \
  -p [HOST_PORT]:[CONTAINER_PORT] \
  -v /opt/app/models:/app/models \
  --env-file .env \
  ghcr.io/ORG/REPO:latest
```

**Step 6:** Verify it's running
```bash
# Health check
curl http://localhost:[HOST_PORT]/health

# Test endpoint
curl -X POST http://localhost:[HOST_PORT]/api/v1/[resource] \
  -H "Content-Type: application/json" \
  -d '{"key": "value"}'
```

### Container management commands

```bash
# View live logs
docker logs -f [project]-app

# Stop the container
docker stop [project]-app

# Remove the container
docker rm [project]-app

# Inspect health status
docker inspect --format='{{.State.Health.Status}}' [project]-app
```

### Troubleshooting GHCR pull issues

| Error | Cause | Fix |
|-------|-------|-----|
| `denied: permission_denied` | PAT missing `read:packages` scope | `gh auth refresh -s read:packages` |
| `Login Succeeded` but pull fails | Token valid but package is private, no repo access | Ensure your GH account has repo read access |
| `unauthorized: authentication required` | Not logged in to GHCR | Run Step 1 and Step 2 above |
| `not found` (404) | Wrong image path or tag | Verify `ghcr.io/ORG/REPO:TAG` matches published image |

---

## 🔌 Port Reference

| Host port | Container port | Service |
|-----------|---------------|---------|
| `3351` | `8000` | Backend API |
| `3000` | `3000` | Frontend |
| `4320` | `5432` | PostgreSQL (host access — only if `DB_HOST_PORT` set) |

---

## 📝 Notes

- CPU: The application uses the host CPU by default. No GPU required.
- Model loading: If ML models are included, allow 15-30 seconds on first startup for model initialization before the first request.
- Log rotation: Docker logging driver defaults to `json-file` with no rotation. For production, add `--log-opt max-size=10m --log-opt max-file=3` to your `docker run` command or configure in `docker-compose.yml`.

---

## 🚀 Quick Start (Local Docker Compose)

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (includes Docker Compose)
- Git

### 1. Clone the Repository
```bash
git clone https://github.com/[org]/[repo].git
cd [repo]
```

### 2. Set Up Environment
```bash
# Copy the environment template
cp .env.example .env

# Open .env and fill in required values (see Environment Variables section below)
nano .env   # or use your preferred editor
```

### 3. First-Time Setup
```bash
# Make the run script executable
chmod +x run.sh

# Run first-time setup (builds images, starts containers, runs migrations)
./run.sh setup
```

### 4. Access the Application
| Service | URL |
|---------|-----|
| Backend API | http://localhost:[API_PORT] |
| API Documentation | http://localhost:[API_PORT]/docs |
| Frontend UI | http://localhost:[FRONTEND_PORT] |
| ReDoc API Reference | http://localhost:[API_PORT]/redoc |

---

## 🔧 Environment Variables

Create a `.env` file by copying `.env.example`. Below is a full reference:

### Required Variables
| Variable | Description | Example |
|----------|-------------|---------|
| `SECRET_KEY` | JWT signing key (generate secure 32+ char string) | `openssl rand -hex 32` |
| `DB_USER` | PostgreSQL username | `alpha` |
| `DB_PASSWORD` | PostgreSQL password | `D3c3mb3r!@2025#` |
| `DB_NAME` | PostgreSQL database name | `myapp-db` |

### Optional Variables (have defaults)
| Variable | Default | Description |
|----------|---------|-------------|
| `ENVIRONMENT` | `development` | App environment (`development`, `production`) |
| `ACCESS_TOKEN_EXPIRE_MINUTES` | `15` | JWT access token lifetime |
| `REFRESH_TOKEN_EXPIRE_DAYS` | `7` | JWT refresh token lifetime |
| `CORS_ORIGINS` | `http://localhost:3000` | Allowed CORS origins |
| `APP_HOST_PORT` | `3351` | Host port for app container (auto-increments +10 if in use) |
| `FRONTEND_HOST_PORT` | `3000` | Host port for frontend container |
| `DB_HOST_PORT` | `4320` | Host port for DB — **only add if host access needed** |

### Auto-Generated (do not set manually)
| Variable | Description |
|----------|-------------|
| `DATABASE_URL` | Built from POSTGRES_* variables automatically |

### Generating a Secure SECRET_KEY
```bash
# On macOS/Linux
openssl rand -hex 32

# Or using Python
python3 -c "import secrets; print(secrets.token_hex(32))"
```

---

## 🐳 Docker Commands (run.sh)

The `run.sh` script provides all management commands in numbered order:

```bash
./run.sh [number or command name]
```

| # | Command | Description |
|---|---------|-------------|
| 1 | `build` | Build all Docker images |
| 2 | `full-build` | Full clean build (no cache) |
| 3 | `start` | Start all containers in background |
| 4 | `stop` | Stop all containers |
| 5 | `restart` | Restart all containers |
| 6 | `rebuild` | Rebuild images and restart |
| 7 | `health` | Check health of all services |
| 8 | `logs` | View all container logs (live) |
| 9 | `logs-api` | View API logs (live) |
| 10 | `logs-db` | View database logs (live) |
| 11 | `shell-api` | Open bash shell in API container |
| 12 | `shell-db` | Open psql in database container |
| 13 | `migrate` | Run database migrations |
| 14 | `test` | Run all tests inside Docker |
| 15 | `deploy` | Production deployment |
| 16 | `status` | Show container status + stats |
| 17 | `clean` | Remove containers + volumes |
| 18 | `nuke` | Remove everything including images |
| 19 | `setup` | First-time setup wizard |

### Examples
```bash
./run.sh start          # Start application
./run.sh 3              # Same as above (use number)
./run.sh logs-api       # Watch API logs
./run.sh test           # Run test suite
./run.sh rebuild        # After code changes
./run.sh health         # Verify everything is running
```

---

## 🗄️ Database

### Running Migrations
```bash
# Apply all pending migrations
./run.sh migrate

# Or manually inside container
docker compose exec api alembic upgrade head

# Create a new migration (after changing models)
docker compose exec api alembic revision --autogenerate -m "describe your change"

# Rollback one migration
docker compose exec api alembic downgrade -1
```

### Connecting to the Database
```bash
# Open psql console
./run.sh shell-db

# Or with direct connection string
docker compose exec db psql -U $POSTGRES_USER -d $POSTGRES_DB
```

---

## 🧪 Testing

All tests run inside Docker containers:

```bash
# Run full test suite
./run.sh test

# View test coverage report (HTML)
docker compose run --rm api pytest tests/ --cov=app --cov-report=html
# Report at: backend/htmlcov/index.html

# Run specific test
docker compose run --rm api pytest tests/integration/test_auth.py -v

# Run Postman collection tests
# 1. Import postman_collection.json into Postman
# 2. Import postman_environment.json
# 3. Run the collection
```

### Test Results
| Test Type | Count | Status |
|-----------|-------|--------|
| Unit Tests | [X] | ✅ |
| Integration Tests | [X] | ✅ |
| API Contract (Postman) | [X] | ✅ |

---

## 📦 API Documentation

The API is fully documented via:

1. **Interactive Docs (Swagger UI):** http://localhost:[API_PORT]/docs
2. **ReDoc:** http://localhost:[API_PORT]/redoc
3. **OpenAPI JSON spec:** `openapi.json` in project root
4. **Postman Collection:** `postman_collection.json` — import into Postman

### Quick API Reference

#### Authentication
```bash
# Register
curl -X POST http://localhost:8000/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email": "user@example.com", "password": "Password123!"}'

# Login
curl -X POST http://localhost:8000/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email": "user@example.com", "password": "Password123!"}'

# Use token
curl http://localhost:8000/api/v1/users/me \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN"
```

---

## 🏗️ Project Structure

```
[repo]/
├── backend/                # FastAPI Python application
│   ├── app/
│   │   ├── api/v1/routes/  # API endpoints
│   │   ├── core/           # Config, DB, security
│   │   ├── models/         # SQLAlchemy models
│   │   ├── schemas/        # Pydantic schemas
│   │   ├── services/       # Business logic
│   │   └── repositories/   # DB access layer
│   ├── alembic/            # Database migrations
│   ├── tests/              # Test suite
│   └── Dockerfile
├── frontend/               # React TypeScript application
│   ├── src/
│   │   ├── api/            # API client
│   │   ├── components/     # UI components
│   │   ├── pages/          # Route pages
│   │   ├── stores/         # Zustand state
│   │   └── types/          # TypeScript types
│   └── Dockerfile
├── docker-compose.yml      # Container orchestration
├── .env.example            # Environment template
├── run.sh                  # Management scripts
├── postman_collection.json # API tests (import into Postman)
├── openapi.json            # API spec
├── PLAN.md                 # Architecture decisions
├── TASK.md                 # Task tracker
├── CHANGELOG.md            # All changes documented
└── README.md               # This file
```

---

## 🔒 Security

- JWT access tokens expire in 15 minutes (configurable)
- Refresh token rotation on each use
- Passwords hashed with bcrypt
- SQL injection protected via SQLAlchemy ORM
- CORS configured for specific origins only
- Non-root user in Docker containers
- No secrets in code — all via environment variables

---

## 📋 PLAN.md & TASK.md

See [PLAN.md](./PLAN.md) for architecture decisions and technical design.
See [TASK.md](./TASK.md) for development task tracking.
See [CHANGELOG.md](./CHANGELOG.md) for full project history.

---

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Make changes and write tests
4. Run tests: `./run.sh test`
5. Submit a pull request

---

## 📄 License

[MIT License](./LICENSE)
```

---

## NOTION PAGE GENERATION

Alongside every `README.md`, also generate a `README_NOTION.md` formatted for Notion import.

### Notion Formatting Rules
- Use `# Heading` for page title (Notion H1)
- Use `## Heading` for sections (Notion H2 — creates collapsible sections)
- Use `> Blockquote` for callouts
- Use `---` for dividers
- Replace markdown tables with Notion-compatible tables (same syntax works)
- Code blocks use triple backticks with language (same — Notion supports this)
- Add Notion callout blocks for important warnings:

```markdown
> 💡 **Tip:** [content]
> ⚠️ **Warning:** [content]
> ❌ **Required:** [content]
> ✅ **Done:** [content]
```

### Notion Page Structure Template

```markdown
# [Project Name] 🚀

> 📋 **Status:** In Development | **Last Updated:** [Date] | **Version:** 1.0.0

---

## 📌 Overview

[Project description]

---

## 🚀 Quick Start

> ⚠️ **Prerequisites:** Docker Desktop must be installed.

[Quick start steps]

---

## 🔧 Environment Variables

> ❌ **Required:** Copy `.env.example` to `.env` and fill in all required fields before starting.

[Env vars table]

---

## 🐳 Docker Commands

[run.sh commands table]

---

## 📦 API Documentation

> 💡 **Tip:** Import `postman_collection.json` into Postman for instant API testing.

[API reference]

---

## 🗄️ Database

[DB section]

---

## 🧪 Testing

[Testing section]

---

## 📁 Project Structure

[Structure tree]

---

## 🔒 Security Notes

[Security section]

---

## 📋 Related Documents

| Document | Purpose |
|----------|---------|
| [PLAN.md](./PLAN.md) | Architecture decisions |
| [TASK.md](./TASK.md) | Task tracking |
| [CHANGELOG.md](./CHANGELOG.md) | Full project history |
| [postman_collection.json](./postman_collection.json) | API test collection |
```

---

## DOCUMENTATION QUALITY CHECKLIST

Before marking docs complete:
- [ ] `README.md` complete (all sections)
- [ ] `README_NOTION.md` generated with Notion formatting
- [ ] Every env variable documented with description + default
- [ ] All 25 `run.sh` commands in table
- [ ] `curl` examples for key API endpoints
- [ ] Port defaults documented: app=3351, DB host=4320 (if exposed)
- [ ] DB defaults documented: user=`alpha`, name=`{project}-db`
- [ ] Postman collection import instructions
- [ ] `schema.sql` mentioned (for DB recreation)
- [ ] GHCR push instructions (if applicable)
- [ ] Security section present
- [ ] PLAN.md, TASK.md, CHANGELOG.md cross-referenced
