# User Manual - AI Development Tasks Master System

**Created:** 2025-09-15
**Version:** 1.0
**For:** Jeremy Longshore
**System:** Foundational AI Development Workflow

## Table of Contents
1. [Quick Start](#quick-start)
2. [System Overview](#system-overview)
3. [Daily Usage](#daily-usage)
4. [Template Reference](#template-reference)
5. [Project Setup](#project-setup)
6. [Advanced Features](#advanced-features)
7. [Troubleshooting](#troubleshooting)

## Quick Start

### 30-Second Setup for New Project
```bash
cd ~/my-new-project
~/ai-dev-tasks-master/setup-scripts/setup-project.sh
# Choose: 1) Symlink (recommended)
make create T=create-prd.md N=prd.md
```

### Daily Commands
```bash
# Check what templates are available
make help

# Create a document
make create T=create-prd.md N=feature-prd.md

# Check project status
make status
```

## System Overview

### What This System Does
- **Provides 22+ professional templates** for all development documentation
- **Automates project setup** with consistent ai-dev pipelines
- **Maintains clean separation** between templates (public) and working docs (private)
- **Integrates with GitHub** for sharing methodology while keeping projects private

### What This System Doesn't Do
- **Replace existing comprehensive systems** (like Bob's Brain CLAUDE.md)
- **Store working documents** (those stay in individual projects)
- **Manage project code** (pure documentation workflow)

### Directory Structure
```
~/ai-dev-tasks-master/               # 🏗️ FOUNDATIONAL SYSTEM
├── professional-templates/          # 📚 Master template library
│   ├── create-prd.md               # Product Requirements Document
│   ├── adr-template.md             # Architecture Decision Record
│   ├── create-tech-spec.md         # Technical Specification
│   └── ... (19 more templates)
├── setup-scripts/                  # 🔧 Automation scripts
│   ├── setup-project.sh            # Single project setup
│   └── setup-workspace.sh          # Workspace-wide setup
├── examples/                       # 📖 Usage examples
│   └── webapp-project/             # Complete example implementation
├── docs/                           # 📄 System documentation
├── CLAUDE.md                       # 🤖 AI assistant guidance
├── SOP.md                          # 📋 Standard procedures
├── README.md                       # 📘 Quick reference
└── USER_MANUAL.md                  # 📚 This comprehensive guide
```

## Daily Usage

### Creating Documents

#### Step 1: Navigate to Your Project
```bash
cd ~/projects/my-project
# NOT ~/ai-dev-tasks-master (that's the template library)
```

#### Step 2: Create Document from Template
```bash
# Basic syntax
make create T=[template-name].md N=[your-document-name].md

# Examples
make create T=create-prd.md N=user-dashboard-prd.md
make create T=adr-template.md N=adr-001-database-choice.md
make create T=create-tech-spec.md N=api-integration-spec.md
```

#### Step 3: Edit the Created Document
- Document appears in `ai-dev/docs/[your-document-name].md`
- Follow the template structure and prompts
- Fill in all required sections
- Save when complete

#### Step 4: Update Project Status
- Check off completed item in `ai-dev/README.md`
- Commit to your project's git repository

### Checking System Status
```bash
# From any project directory
make status

# Example output:
# 📊 AI-Dev Pipeline Status: my-project
# ========================================
# 📚 Templates: ✅ Linked
# 📁 Documents: 3 files
#
# 📋 Current Documents:
#   ✓ prd.md
#   ✓ adr-001.md
#   ✓ tech-spec.md
```

## Template Reference

### Core Development Templates

#### Product Requirements (create-prd.md)
**Use for:** New features, products, or major changes
**Creates:** Business requirements, success metrics, user stories
**Time:** 30-60 minutes to complete

#### Architecture Decision Record (adr-template.md)
**Use for:** Technology choices, architectural decisions
**Creates:** Decision rationale, alternatives considered, consequences
**Time:** 15-30 minutes to complete

#### Technical Specification (create-tech-spec.md)
**Use for:** Implementation details, API design, system architecture
**Creates:** Detailed technical requirements, interfaces, data models
**Time:** 1-2 hours to complete

#### Task Generation (generate-tasks.md)
**Use for:** Breaking down work into manageable pieces
**Creates:** Granular tasks with acceptance criteria
**Time:** 30-45 minutes to complete

### Project Management Templates

#### Project Charter (create-project-charter.md)
**Use for:** Project kickoff, stakeholder alignment
**Creates:** Project scope, objectives, success criteria
**Time:** 45-60 minutes to complete

#### Risk Register (create-risk-register.md)
**Use for:** Risk identification and mitigation planning
**Creates:** Risk assessment, mitigation strategies
**Time:** 30-45 minutes to complete

#### RACI Matrix (create-raci-matrix.md)
**Use for:** Role clarity, responsibility assignment
**Creates:** Clear responsibility matrix
**Time:** 15-30 minutes to complete

### Business Templates

#### Business Requirements (create-brd.md)
**Use for:** Business stakeholder requirements
**Creates:** Business objectives, constraints, success criteria
**Time:** 45-90 minutes to complete

#### User Stories (create-user-story.md)
**Use for:** Feature requirements from user perspective
**Creates:** User-centered requirements
**Time:** 15-30 minutes per story

### Technical Templates

#### API Specification (create-api-spec.md)
**Use for:** API design and documentation
**Creates:** Complete API documentation with examples
**Time:** 1-2 hours to complete

#### Database Schema (create-database-schema.md)
**Use for:** Database design and modeling
**Creates:** Complete database schema with relationships
**Time:** 1-3 hours to complete

#### Test Plan (create-test-plan.md)
**Use for:** Testing strategy and execution
**Creates:** Comprehensive test strategy
**Time:** 45-90 minutes to complete

#### Runbook (create-runbook.md)
**Use for:** Operational procedures and troubleshooting
**Creates:** Step-by-step operational guide
**Time:** 1-2 hours to complete

### Process Templates

#### Standard Operating Procedure (create-sop.md)
**Use for:** Process documentation and standardization
**Creates:** Detailed process procedures
**Time:** 45-90 minutes to complete

#### Post-Mortem (create-post-mortem.md)
**Use for:** Incident analysis and learning
**Creates:** Incident analysis and improvement plan
**Time:** 30-60 minutes to complete

#### Design Document (create-design-doc.md)
**Use for:** System design and architecture
**Creates:** Comprehensive design documentation
**Time:** 2-4 hours to complete

#### RFC (create-rfc.md)
**Use for:** Proposals requiring team input
**Creates:** Request for Comments document
**Time:** 45-90 minutes to complete

## Project Setup

### When to Use AI-Dev Pipeline

#### ✅ Use For:
- **New projects** without existing documentation systems
- **Prototype projects** becoming production systems
- **Projects requiring structured documentation**
- **Team projects** needing consistent documentation

#### ❌ Don't Use For:
- **Projects with comprehensive CLAUDE.md files** (like Bob's Brain)
- **Simple scripts or utilities**
- **Temporary experiments**
- **Well-documented existing projects**

### Setup Methods

#### Method 1: Symlink (Recommended)
```bash
cd ~/projects/my-project
~/ai-dev-tasks-master/setup-scripts/setup-project.sh
# Choose: 1) Symlink
```
**Benefits:** Always up-to-date templates, fast updates
**Best for:** Local development, frequently updated projects

#### Method 2: Copy Templates
```bash
cd ~/projects/my-project
~/ai-dev-tasks-master/setup-scripts/setup-project.sh
# Choose: 2) Copy templates
```
**Benefits:** Portable, no external dependencies
**Best for:** Distributed teams, offline work

#### Method 3: Git Submodule
```bash
cd ~/projects/my-project
~/ai-dev-tasks-master/setup-scripts/setup-project.sh
# Choose: 3) Git submodule
```
**Benefits:** Version controlled, team collaboration
**Best for:** Team projects, version-sensitive work

### Workspace-Wide Setup
```bash
cd ~/ai-dev-tasks-master
./setup-scripts/setup-workspace.sh
```
**What it does:**
- Scans all git repositories in `~/projects/`
- Sets up ai-dev pipeline in each project
- Skips projects with comprehensive CLAUDE.md files
- Creates central template library

## Advanced Features

### Custom Template Creation
1. Create new template in `~/ai-dev-tasks-master/professional-templates/`
2. Follow existing template format
3. Test with example project
4. Commit to GitHub for sharing

### Template Customization
- Modify templates in `~/ai-dev-tasks-master/professional-templates/`
- Changes automatically propagate to all projects (symlink method)
- Version control template changes

### Integration with AI Assistants
- AI assistants use `CLAUDE.md` for guidance
- Templates designed for AI-assisted completion
- Structured prompts guide AI responses

### GitHub Integration
- **Public:** Template methodology and examples
- **Private:** Your working documents and projects
- **Fork:** Contributes improvements back to community

## Troubleshooting

### Common Issues

#### "Template not found"
```bash
# Check template exists
ls -la ~/ai-dev-tasks-master/professional-templates/

# Verify project setup
cd [project] && ls -la ai-dev/templates
```
**Solution:** Re-run project setup script

#### "Make command not found"
```bash
# Check if Makefile exists
ls -la Makefile
```
**Solution:** Run setup script to create Makefile

#### "Templates not updating"
**Problem:** Using copy method instead of symlink
**Solution:** Re-run setup with symlink option

#### "AI-dev directory in wrong projects"
**Problem:** Workspace setup added ai-dev to comprehensive projects
**Solution:** Manually remove ai-dev from projects with CLAUDE.md

### Getting Help

#### System Status Check
```bash
cd ~/ai-dev-tasks-master
git status                    # Check for uncommitted changes
ls -la professional-templates/ | wc -l  # Count templates (should be 22+)
```

#### Template Verification
```bash
cd ~/projects/test-project
make help                     # Should show available commands
make status                   # Should show pipeline status
```

#### GitHub Integration
```bash
cd ~/ai-dev-tasks-master
git remote -v                 # Should show vibe-prd origin
```

### Support Resources
- **System Documentation:** `~/ai-dev-tasks-master/docs/`
- **Standard Procedures:** `~/ai-dev-tasks-master/SOP.md`
- **AI Guidance:** `~/ai-dev-tasks-master/CLAUDE.md`
- **GitHub Issues:** https://github.com/jeremylongshore/vibe-prd/issues

---

**This foundational system streamlines your development workflow while maintaining the flexibility and control you need for professional software development.**