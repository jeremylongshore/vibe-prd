# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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

### Common Development Commands
```bash
cd ~/ai-dev
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

# OR from any project with setup-project.sh integration:
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

## Architecture & Key Features

### Template System Architecture
- **22 professional templates** in `professional-templates/` directory
- **Read-only templates** that generate working documents in `docs/`
- **Centralized workflow** - all projects route documentation to `~/ai-dev/`
- **Automation scripts** for project setup and workspace integration

### Key Components
1. **Makefile** - Document creation and status commands
2. **setup-project.sh** - Individual project integration
3. **setup-workspace.sh** - Bulk workspace setup
4. **Template library** - Enterprise-grade documentation templates

### System Health Checks

```bash
# Verify templates (should show 22+ templates)
ls -la professional-templates/ | wc -l

# Test automation
./setup-scripts/setup-project.sh --help

# Check documentation directories
ls -la docs/ sop/

# Verify symlink integrity
ls -la templates/
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