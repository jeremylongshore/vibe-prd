# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**Last Updated:** 2025-09-16
**System Status:** ✅ Production Ready v0.2.0
**Container:** `ghcr.io/jeremylongshore/vibe-prd:v0.2.0`
**BMAD Integration:** `ghcr.io/jeremylongshore/bmad:5.1.3`

## System Overview

This is a **containerized AI development workflow system with AI assistant integration**. It provides professional templates via Docker container and includes guided AI prompts for users of all skill levels - from complete beginners to experienced developers.

## Directory Structure

```
~/ai-dev/                         # 🎯 CONTAINERIZED AI DEVELOPMENT SYSTEM
├── professional-templates/       # Master template library (22 templates)
├── .github/workflows/            # CI/CD: Container build + release automation
├── examples/                     # Usage examples and demos
├── archive/                     # Legacy directories (cli-workflow, etc.)
├── docs-archive/                # Extra documentation (GETTING_STARTED, etc.)
├── CLAUDE.md                    # This file - AI assistant guidance
├── README.md                    # Quick start + AI prompt integration
├── SOP.md                       # Standard procedures (containerized)
├── USER_MANUAL.md               # Complete user guide (containerized)
├── AI_ASSISTANT_PROMPTS.md      # 🤖 6 AI prompts for different skill levels
├── BEGINNER_SETUP.md           # 🤖 Complete beginner AI guidance
├── Dockerfile                   # Container definition
├── Makefile                     # Document creation logic (WORKSPACE?= fix)
├── ai-dev                       # CLI wrapper script
└── templates -> professional-templates/
```

## Templates Available (40+ Professional Documents)

### Core Development Documents
- `create-prd.md` - Product Requirements Document
- `adr-template.md` - Architecture Decision Record
- `create-tech-spec.md` - Technical Specification
- `generate-tasks.md` - Implementation Task Breakdown
- `create-api-spec.md` / `api-design.md` - API Documentation
- `create-test-plan.md` / `test-plan.md` - Testing Strategy
- `architecture.md` - System Architecture
- `implementation-plan.md` - Development Planning
- `data-model.md` - Data Structure Design

### Project Management & Planning
- `create-project-charter.md` - Project Charter
- `create-raci-matrix.md` - Responsibility Assignment
- `create-risk-register.md` / `risk-register.md` - Risk Management
- `create-runbook.md` / `ops-runbook.md` - Operational Procedures
- `roadmap.md` - Product Roadmap
- `release-plan.md` - Release Planning
- `deployment-plan.md` - Deployment Strategy

### Business & Requirements
- `create-brd.md` - Business Requirements Document
- `create-user-story.md` / `user-stories.md` - User Story Templates
- `personas.md` - User Personas
- `competitive-analysis.md` - Market Analysis
- `metrics-kpis.md` - Success Metrics

### Technical Documentation
- `create-design-doc.md` - Design Documentation
- `infra-diagram.md` - Infrastructure Design
- `security-review.md` - Security Assessment
- `compliance-plan.md` - Compliance Documentation
- `sdlc-checklist.md` - Development Lifecycle

### Process & Operations
- `create-post-mortem.md` / `postmortem-template.md` - Incident Analysis
- `create-sop.md` - Standard Operating Procedures
- `create-rfc.md` - Request for Comments
- `requirements-traceability.md` - Requirements Tracking
- `faq.md` - Frequently Asked Questions

## Usage Commands

### Primary Development Workflow
```bash
# Two-phase workflow: Form input → Document generation
make ai-dev        # Interactive form to capture project context
make prd          # Generate BMAD analysis + 22 professional templates

# Output locations:
# - docs/bmad/      (BMAD native analysis files)
# - docs/templates/ (22 professional document templates)
```

### BMAD Integration Commands
```bash
# Core BMAD workflow (runs automatically in make prd)
make bmad-run           # Run BMAD container analysis
make collect-bmad       # Process BMAD outputs
make extract-bmad       # Extract structured data
make fill-templates     # Populate template library
make verify-outputs     # Validate generated documents
```

### System Management
```bash
make clean-docs         # Clean output directories
make release-check      # Full validation pipeline
make fix-perms         # Fix Docker permission issues
```

### Legacy Containerized Usage
```bash
# Using global ai-dev command (if installed)
ai-dev make help                          # Show all templates
ai-dev make create T=create-prd.md N=my-feature.md

# Or direct container usage
docker run --rm -v "$PWD":/workspace -w /workspace \
  ghcr.io/jeremylongshore/vibe-prd:v0.2.0 \
  make create T=create-prd.md N=my-feature.md
```

## AI Assistant Guidelines

### When Working with This System
1. **Templates are READ-ONLY** - Never modify professional-templates/ files
2. **Containerized workflow** - Documents created via Docker container
3. **AI Assistant Integration** - Use AI_ASSISTANT_PROMPTS.md for user guidance
4. **Multiple user types supported** - Beginners to expert developers

### AI Assistant User Support
When users need help with this system:
1. **Complete Beginners**: Direct them to BEGINNER_SETUP.md or the README AI prompt
2. **Developers**: Use the technical prompts in AI_ASSISTANT_PROMPTS.md
3. **Troubleshooting**: Guide them through the troubleshooting prompts
4. **Team Setup**: Use the organizational prompts for multiple users

### Template Usage Pattern (BMAD-Integrated)
```bash
# User requests: "Create comprehensive project documentation"
# Modern BMAD workflow:
cd ~/ai-dev
make ai-dev    # Interactive form captures project context
make prd       # BMAD analyzes + generates 40+ documents

# Output structure:
# docs/bmad/           - BMAD native analysis
# docs/templates/      - 40+ populated professional templates

# Legacy single-template approach:
ai-dev make create T=create-prd.md N=feature-prd.md
# Creates single document in current directory
```

### Project Integration
- **All AI development work happens in ~/ai-dev/**
- Projects get Makefiles that route commands to ~/ai-dev
- Projects with comprehensive CLAUDE.md files are left untouched
- Never create project-level ai-dev directories

## File Management Rules

### NEVER Create
- Files without explicit permission
- Documentation in project root directories
- Duplicate functionality
- Test/temp files in this foundational system

### ALWAYS Maintain
- Clean directory structure
- Updated documentation
- Working automation scripts
- Template integrity

## GitHub Integration

- **Origin:** https://github.com/jeremylongshore/vibe-prd.git
- **Branch:** feat/workspace-pipeline
- **Purpose:** Public methodology sharing (templates can be public, working docs stay private)

## Architecture & Key Features

### Template System Architecture
- **22 professional templates** in `professional-templates/` directory
- **Read-only templates** that generate working documents in `docs/`
- **Centralized workflow** - all projects route documentation to `~/ai-dev/`
- **Automation scripts** for project setup and workspace integration

### Key Components
1. **Makefile** - Core workflow orchestration (form input → BMAD → templates)
2. **form-system/cli.js** - Interactive form interface for project context
3. **BMAD integration** - AI-powered analysis via pinned container (`ghcr.io/jeremylongshore/bmad:5.1.3`)
4. **Template library** - 40+ professional document templates in `professional-templates/`
5. **CI/CD pipeline** - Automated testing and release via GitHub Actions
6. **Version pinning** - `.bmad-version` and `.bmad-lock` ensure reproducible builds

### System Health Checks

```bash
# Verify templates (should show 40+ templates)
ls -la professional-templates/ | wc -l

# Check BMAD integration
cat .bmad-version  # Should show: ghcr.io/jeremylongshore/bmad:5.1.3
cat .bmad-lock     # Should show SHA256 digest

# Test full workflow
make clean-docs && make ai-dev && make prd

# Verify outputs
make verify-outputs  # Validates template count and structure

# Check form system
node form-system/cli.js --help
```

## Integration Rules & Project Ecosystem

### Projects Using AI-Dev Pipeline
This system is designed for projects that need structured documentation workflows but don't have comprehensive development systems.

### Projects with Independent Systems (DO NOT USE AI-DEV)
- **Bob's Brain:** `~/projects/bobs-brain/` (has comprehensive CLAUDE.md)
- **DiagnosticPro:** `~/projects/diagnostic-platform/` (has comprehensive CLAUDE.md)
- **Waygate MCP:** `~/projects/waygate-mcp/` (security-focused MCP server)

### Decision Matrix for AI-Dev Usage
- ✅ **Use for:** New projects, prototypes becoming production, projects needing documentation structure
- ❌ **Don't use for:** Projects with existing comprehensive CLAUDE.md files and established workflows

---

**This is a foundational development system. Treat it as infrastructure, not a playground.**