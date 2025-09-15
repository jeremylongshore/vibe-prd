# CLAUDE.md - AI Development Tasks Master System

**Last Updated:** 2025-09-15
**System Status:** ✅ Operational Foundational System

## System Overview

This is Jeremy's foundational AI development workflow system. It provides professional templates, automation scripts, and standardized processes for all development projects.

## Directory Structure

```
~/ai-dev/                    # 🎯 CONSOLIDATED AI DEVELOPMENT SYSTEM
├── professional-templates/  # Master template library (22 templates)
├── setup-scripts/          # Project automation scripts
├── examples/               # Usage examples and demos
├── system-docs/            # System documentation
├── docs/                   # Working documents (YOUR CONTENT)
├── sop/                    # Working SOPs (YOUR CONTENT)
├── templates/              # → symlink to professional-templates/
├── CLAUDE.md               # This file - AI assistant guidance
├── SOP.md                  # Standard procedures
├── README.md               # User manual and quick start
├── USER_MANUAL.md          # Comprehensive usage guide
└── Makefile                # Document creation commands
```

## Templates Available

### Core Development Documents
- `create-prd.md` - Product Requirements Document
- `adr-template.md` - Architecture Decision Record
- `create-tech-spec.md` - Technical Specification
- `generate-tasks.md` - Implementation Task Breakdown
- `create-api-spec.md` - API Documentation
- `create-test-plan.md` - Testing Strategy

### Project Management
- `create-project-charter.md` - Project Charter
- `create-raci-matrix.md` - Responsibility Assignment
- `create-risk-register.md` - Risk Management
- `create-runbook.md` - Operational Procedures

### Business Documents
- `create-brd.md` - Business Requirements Document
- `create-user-story.md` - User Story Templates
- `create-design-doc.md` - Design Documentation
- `create-post-mortem.md` - Incident Analysis

## Usage Commands

### Quick Commands
```bash
cd ~/ai-dev-tasks-master
make help                     # Show all commands
make status                   # Show system status
make create T=template N=name # Create document from template
```

### Project Setup
```bash
# Set up new project with ai-dev pipeline
./setup-scripts/setup-project.sh

# Set up entire workspace (all projects)
./setup-scripts/setup-workspace.sh
```

## AI Assistant Guidelines

### When Working with This System
1. **Templates are READ-ONLY** - Never modify template files
2. **Working docs go in ~/ai-dev/docs/** - Single central workspace
3. **This is the source of truth** for all template workflows
4. **Projects route to ~/ai-dev** - No project-level ai-dev directories

### Template Usage Pattern
```bash
# User requests: "Create PRD for new feature"
cd ~/ai-dev
make create T=create-prd.md N=feature-prd.md
# Edit the created file in ~/ai-dev/docs/feature-prd.md

# OR from any project:
cd ~/projects/my-project
make create T=create-prd.md N=feature-prd.md
# Routes to ~/ai-dev and creates ~/ai-dev/docs/feature-prd.md
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

## System Health Checks

```bash
# Verify templates
ls -la professional-templates/ | wc -l  # Should show 22+ templates

# Test automation
./setup-scripts/setup-project.sh --help

# Check documentation
ls -la docs/ sop/
```

## Related Systems

- **Bob's Brain:** `~/projects/bobs-brain/` (has own CLAUDE.md)
- **DiagnosticPro:** `~/projects/diagnostic-platform/` (has own CLAUDE.md)
- **Waygate MCP:** `~/waygate-mcp/` (security-focused MCP server)

---

**This is a foundational development system. Treat it as infrastructure, not a playground.**