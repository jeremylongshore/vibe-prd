# Workspace Setup Guide

## Overview

The workspace setup mode configures vibe-prd as a central template library serving multiple projects. This approach is ideal for:

- Development teams with multiple repositories
- Organizations standardizing AI development workflows
- Individual developers managing many projects

## Setup Process

### 1. Install Central Template Library

```bash
git clone https://github.com/jeremylongshore/vibe-prd ~/ai-dev-templates
cd ~/ai-dev-templates
./setup-scripts/setup-workspace.sh
```

### 2. Automatic Project Discovery

The setup script will:
- Find all git repositories in your workspace (default: `~/projects/`)
- Add `ai-dev/` structure to each project
- Create symlinks from `project/ai-dev/templates` to central library
- Generate project-specific `Makefile` for document automation
- Create pipeline tracking `README.md` in each project

### 3. Verification

After setup, each project will have:
```
project/
├── ai-dev/
│   ├── README.md           # Pipeline status tracker
│   ├── docs/               # Working documents
│   ├── sop/                # Standard procedures
│   └── templates/          # Symlink to central library
├── Makefile                # Document automation
└── (existing project files)
```

## Usage

### Create Documents
```bash
cd any-project
make create T=create-prd.md N=feature-auth.md
make create T=adr-template.md N=adr-001.md
```

### Check Status
```bash
make status    # Show pipeline status for current project
```

### Update Templates
```bash
cd ~/ai-dev-templates
git pull origin main    # Updates all projects automatically via symlinks
```

## Benefits

- **Single Source of Truth:** All projects use same template versions
- **Instant Updates:** Template improvements propagate to all projects
- **Consistent Workflow:** Same commands work across all projects
- **Team Coordination:** Shared methodology across development team