# AI Development Tasks - Containerized CLI

**Professional technical documentation templates delivered as a zero-ops containerized CLI.**

## Quick Install

### One-Line Install
```bash
curl -fsSL https://raw.githubusercontent.com/jeremylongshore/vibe-prd/main/ai-dev -o /usr/local/bin/ai-dev
chmod +x /usr/local/bin/ai-dev
ai-dev make help
```

### Alternative: Custom Image
```bash
AI_DEV_IMAGE=ghcr.io/jeremylongshore/ai-dev-tasks:latest ai-dev make help
```

## Quick Start

### Create Documentation
```bash
# Create a PRD in your current project
ai-dev make create T=create-prd.md N=feature-x-prd.md

# Check status
ai-dev make status

# See available templates
ai-dev make help
```

### Project Setup (Local Development)
```bash
cd ~/projects/new-project
~/ai-dev/setup-scripts/setup-project.sh
```

## What You Get

### 22+ Professional Templates
- **Core Development:** PRDs, Tech Specs, API Docs, Test Plans
- **Project Management:** Project Charters, Risk Registers, RACI Matrices
- **Business Documents:** BRDs, User Stories, Design Docs
- **Operations:** Runbooks, SOPs, RFCs, Post-Mortems

### Zero-Ops Deployment
- **Containerized CLI** - No local dependencies beyond Docker
- **One-line install** - Works on any system with Docker
- **Version controlled** - Reproducible builds and releases

## Available Templates

### Core Development (6 templates)
- `create-prd.md` - Product Requirements Document
- `adr-template.md` - Architecture Decision Record
- `create-tech-spec.md` - Technical Specification
- `create-api-spec.md` - API Documentation
- `create-database-schema.md` - Database Design
- `create-test-plan.md` - Testing Strategy

### Project Management (4 templates)
- `create-project-charter.md` - Project Charter
- `create-raci-matrix.md` - Responsibility Matrix
- `create-risk-register.md` - Risk Management
- `generate-tasks.md` - Task Breakdown

### Business Documents (4 templates)
- `create-brd.md` - Business Requirements
- `create-user-story.md` - User Stories
- `create-design-doc.md` - Design Documentation
- `create-post-mortem.md` - Incident Analysis

### Operations (4 templates)
- `create-runbook.md` - Operational Procedures
- `create-sop.md` - Standard Operating Procedures
- `create-rfc.md` - Request for Comments
- `process-task-list.md` - Task Processing

## Usage Examples

### Common Use Cases
```bash
# Create a Product Requirements Document
ai-dev make create T=create-prd.md N=new-feature-prd.md

# Create an Architecture Decision Record
ai-dev make create T=adr-template.md N=adr-001-database-choice.md

# Create a Technical Specification
ai-dev make create T=create-tech-spec.md N=api-integration-spec.md

# Generate implementation tasks
ai-dev make create T=generate-tasks.md N=sprint-tasks.md

# Check your documentation status
ai-dev make status
```

### For Local Development
```bash
# Set up project integration (if you want local workflow)
./setup-scripts/setup-project.sh     # Single project
./setup-scripts/setup-workspace.sh   # All projects in workspace
```

## How It Works

### File Creation Flow
```bash
# 1. Run the command
ai-dev make create T=create-prd.md N=my-feature-prd.md

# 2. Document is created in your current directory
./my-feature-prd.md  # Ready to edit!

# 3. Edit with your favorite editor
vim my-feature-prd.md
code my-feature-prd.md
```

### Template System
- **Read-only templates** stored in container
- **Working documents** created in your current directory
- **No local installation** required beyond Docker
- **Version controlled** through container tags

## Repository & Container Registry

- **Source:** https://github.com/jeremylongshore/vibe-prd
- **Container:** `ghcr.io/jeremylongshore/ai-dev-tasks`
- **Latest:** Always use `:latest` for most recent templates

## System Requirements

- Docker installed and running
- Internet connection (for initial image pull)
- That's it! No local dependencies.

## Key Benefits

- **Zero Setup:** Works immediately after one-line install
- **Consistent:** Professional format across all projects
- **Portable:** Same templates on any Docker-enabled system
- **Always Updated:** Pull latest container for newest templates
- **No Conflicts:** Isolated environment prevents dependency issues

---

**Professional documentation workflow in a container. Install once, use everywhere.**