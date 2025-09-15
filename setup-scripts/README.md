# Setup Scripts Documentation

## Overview

Automated setup scripts for vibe-prd AI development workflow system.

## Scripts

### setup-workspace.sh
**Purpose:** Configure vibe-prd as workspace-wide template system
**Usage:** `./setup-workspace.sh`
**Environment Variables:**
- `WORKSPACE_ROOT` - Directory to scan for projects (default: `$HOME/projects`)
- `TEMPLATES_DIR` - Central template installation location (default: `$HOME/ai-dev-templates`)

**What it does:**
1. Installs central template library at `$TEMPLATES_DIR`
2. Scans `$WORKSPACE_ROOT` for git repositories
3. Adds `ai-dev/` structure to each project
4. Creates symlinks from `project/ai-dev/templates` to central library
5. Generates `Makefile` for document automation in each project
6. Creates standard agent files (`claude.md`, `README.md`, `SOP`)

**Verification:**
```bash
# After running setup-workspace.sh
cd $HOME/projects/any-project
make status    # Should show "✅ Linked" templates
make list-templates    # Should list available templates
ls -la ai-dev/templates    # Should show symlink to central library
```

### setup-project.sh
**Purpose:** Add ai-dev pipeline to current project
**Usage:** `./setup-project.sh` (run from project directory)

**Template Setup Options:**
1. **Symlink** - Links to vibe-prd installation (fastest updates)
2. **Copy** - Copies templates into project (portable)
3. **Git Submodule** - Links via git submodule (team collaboration)

**What it does:**
1. Creates `ai-dev/{docs,sop}` directory structure
2. Sets up templates using chosen method
3. Creates pipeline tracker (`ai-dev/README.md`)
4. Creates agent guidance (`ai-dev/docs/claude.md`)
5. Creates project SOP (`ai-dev/sop/standard-operating-procedures.md`)
6. Generates `Makefile` for document automation

**Verification:**
```bash
# After running setup-project.sh
make status    # Should show "✅ Available" templates
make create T=create-prd.md N=test.md    # Should create document
ls ai-dev/docs/test.md    # Should exist
```

## Common Usage Patterns

### New Team Setup
```bash
# Team lead sets up central templates
git clone https://github.com/jeremylongshore/vibe-prd ~/ai-dev-templates
~/ai-dev-templates/setup-scripts/setup-workspace.sh

# Each team member gets templates automatically
cd ~/projects/any-project
make status    # Templates ready to use
```

### Single Project Addition
```bash
# Add ai-dev to existing project
cd my-existing-project
curl -sSL https://raw.githubusercontent.com/jeremylongshore/vibe-prd/main/setup-scripts/setup-project.sh | bash
```

### Template Updates
```bash
# Workspace setup (symlinks) - automatic updates
cd ~/ai-dev-templates && git pull origin main

# Project setup with submodules
cd my-project
git submodule update --remote ai-dev/vibe-prd
```

## Troubleshooting

### Templates Not Found
```bash
# Check template link
ls -la ai-dev/templates

# If broken symlink, recreate
rm ai-dev/templates
ln -sfn /path/to/templates ai-dev/templates
```

### Make Commands Fail
```bash
# Check Makefile exists
ls -la Makefile

# Re-run setup if missing
./path/to/setup-project.sh
```

### Permission Issues
```bash
# Ensure scripts are executable
chmod +x setup-scripts/*.sh

# Check directory permissions
ls -la ai-dev/
```

## Integration with CI/CD

### GitHub Actions Example
```yaml
name: Setup AI-Dev Pipeline
on: [workflow_dispatch]
jobs:
  setup:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup AI-Dev
        run: |
          curl -sSL https://raw.githubusercontent.com/jeremylongshore/vibe-prd/main/setup-scripts/setup-project.sh | bash -s -- 2
          make status
```

### Verification Script
```bash
#!/bin/bash
# verify-ai-dev-setup.sh
set -euo pipefail

echo "🧪 Verifying ai-dev setup..."

# Check required structure
[ -d "ai-dev" ] || { echo "❌ ai-dev directory missing"; exit 1; }
[ -d "ai-dev/docs" ] || { echo "❌ ai-dev/docs missing"; exit 1; }
[ -d "ai-dev/sop" ] || { echo "❌ ai-dev/sop missing"; exit 1; }
[ -e "ai-dev/templates" ] || { echo "❌ ai-dev/templates missing"; exit 1; }

# Check required files
[ -f "ai-dev/README.md" ] || { echo "❌ ai-dev/README.md missing"; exit 1; }
[ -f "ai-dev/docs/claude.md" ] || { echo "❌ ai-dev/docs/claude.md missing"; exit 1; }
[ -f "ai-dev/sop/standard-operating-procedures.md" ] || { echo "❌ SOP missing"; exit 1; }
[ -f "Makefile" ] || { echo "❌ Makefile missing"; exit 1; }

# Test make commands
make status >/dev/null || { echo "❌ make status failed"; exit 1; }
make list-templates >/dev/null || { echo "❌ make list-templates failed"; exit 1; }

echo "✅ AI-dev setup verification passed!"
```