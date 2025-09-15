#!/usr/bin/env bash
set -euo pipefail
# Add ai-dev pipeline to current project
# Creates ai-dev/ with docs, sop directories and templates link/copy

echo "🔧 vibe-prd project setup (v1.0)"
echo "=================================="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIBE_PRD_ROOT="$(dirname "$SCRIPT_DIR")"
PROJECT_ROOT="$(pwd)"
PROJECT_NAME="$(basename "$PROJECT_ROOT")"

echo "📁 Project: $PROJECT_NAME"
echo "📍 Location: $PROJECT_ROOT"

# Check if we're in a git repository
if ! git rev-parse --git-dir >/dev/null 2>&1; then
    echo "⚠️  Not a git repository. Continue anyway? (y/N)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "❌ Setup cancelled"
        exit 1
    fi
fi

# Check if ai-dev already exists
if [ -d "ai-dev" ]; then
    echo "⚠️  ai-dev directory already exists. Overwrite? (y/N)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        echo "❌ Setup cancelled"
        exit 1
    fi
    echo "🗑️  Backing up existing ai-dev to ai-dev.backup.$(date +%s)"
    mv ai-dev "ai-dev.backup.$(date +%s)"
fi

# Create ai-dev structure
echo "📁 Creating ai-dev directory structure..."
mkdir -p ai-dev/{docs,sop}

# Setup templates (choose method)
echo ""
echo "📚 Choose template setup method:"
echo "  1) Symlink to vibe-prd (local development, fastest updates)"
echo "  2) Copy templates (portable, no external dependencies)"
echo "  3) Git submodule (team collaboration, version controlled)"
echo ""
read -p "Selection (1-3): " method

template_source=""
case $method in
    1)
        ln -sfn "$VIBE_PRD_ROOT/professional-templates" ai-dev/templates
        template_source="symlink to vibe-prd"
        echo "✅ Templates linked via symlink"
        ;;
    2)
        cp -r "$VIBE_PRD_ROOT/professional-templates" ai-dev/templates
        template_source="local copy"
        echo "✅ Templates copied locally"
        ;;
    3)
        if git rev-parse --git-dir >/dev/null 2>&1; then
            git submodule add https://github.com/jeremylongshore/vibe-prd.git ai-dev/vibe-prd 2>/dev/null || {
                echo "ℹ️  Submodule already exists, updating..."
                git submodule update --init ai-dev/vibe-prd 2>/dev/null || true
            }
            ln -sfn vibe-prd/professional-templates ai-dev/templates
            template_source="git submodule"
            echo "✅ Templates added as git submodule"
        else
            echo "❌ Not a git repository, falling back to copy"
            cp -r "$VIBE_PRD_ROOT/professional-templates" ai-dev/templates
            template_source="local copy (fallback)"
        fi
        ;;
    *)
        echo "❌ Invalid selection, using symlink as default"
        ln -sfn "$VIBE_PRD_ROOT/professional-templates" ai-dev/templates
        template_source="symlink (default)"
        ;;
esac

# Create standard agent files
echo "📄 Creating pipeline documentation..."

cat > ai-dev/docs/claude.md << 'EOF'
# Project LLM Guide
Read templates from `../templates/` (central). Write docs to `../docs/` or `../sop/`.
On creating/updating any doc:
1) Update `../README.md` checklist and phase.
2) Keep headers, frontmatter, and table formats.
Never copy templates into the repo. If a template is missing, request it upstream.
EOF

cat > ai-dev/README.md << EOF
# AI Development Pipeline — $PROJECT_NAME
Status: Ready ✅  | Templates: \`ai-dev/templates\` → $template_source

## Checklist
- [ ] PRD → docs/prd.md
- [ ] ADR-001 → docs/adr-001.md
- [ ] Tech Spec → docs/tech-spec.md
- [ ] Tasks → docs/tasks.md
- [ ] API Spec → docs/api-spec.md
- [ ] Test Plan → docs/test-plan.md
- [ ] Runbook → docs/runbook.md
- [ ] Risk Register → docs/risk-register.md
- [ ] SOP → sop/standard-operating-procedures.md
- [ ] DB Schema → docs/database-schema.md

**Rules:** Templates live centrally. Working docs live here.

## Quick Start
\`\`\`bash
# Check status
make status

# Create PRD from template
make create T=create-prd.md N=prd.md

# Create architecture decision
make create T=adr-template.md N=adr-001.md
\`\`\`

**Template Source:** $template_source
**Setup Date:** $(date +%Y-%m-%d)
EOF

cat > ai-dev/sop/standard-operating-procedures.md << 'EOF'
# SOP — AI Dev Docs
Single source of truth: central templates. Per-project docs only.
Workflow: pick template → create doc in docs/ → update README checklist → PR.
Audits: `ai-dev/templates` must be a link or submodule. No stray template copies.
EOF

# Create Makefile for document automation
cat > Makefile << 'EOF'
DOCS=ai-dev/docs
SOP=ai-dev/sop
TPL=ai-dev/templates
T?=create-prd.md
N?=new-doc.md

.PHONY: status create list-templates help

status:
	@echo "📊 AI-Dev Pipeline Status: $(shell basename $(PWD))"
	@echo "========================================"
	@echo "📚 Templates: $(shell [ -d $(TPL) ] && echo "✅ Available" || echo "❌ Missing")"
	@echo "📁 Documents: $(shell [ -d $(DOCS) ] && ls -1 $(DOCS) 2>/dev/null | wc -l || echo "0") files"
	@echo ""
	@echo "📋 Current Documents:"
	@[ -d $(DOCS) ] && ls -1 $(DOCS) 2>/dev/null | sed 's/^/  ✓ /' || echo "  (no documents yet)"

create:
	@mkdir -p $(DOCS) $(SOP)
	@if [ ! -f "$(TPL)/$(T)" ]; then echo "❌ Template not found: $(T)"; echo "💡 Use 'make list-templates' to see available templates"; exit 1; fi
	@if echo "$(N)" | grep -q "sop"; then
		cp "$(TPL)/$(T)" "$(SOP)/$(N)"
		echo "📄 Created: $(SOP)/$(N)"
	else
		cp "$(TPL)/$(T)" "$(DOCS)/$(N)"
		echo "📄 Created: $(DOCS)/$(N)"
	fi
	@echo "✏️  Next: Edit the document and update ai-dev/README.md checklist"

list-templates:
	@echo "📚 Available Templates:"
	@[ -d $(TPL) ] && ls -1 $(TPL)/*.md 2>/dev/null | sed 's|.*/||; s|\.md$$||' | sed 's/^/  - /' || echo "  (templates not found)"

help:
	@echo "🚀 AI-Dev Pipeline Commands"
	@echo "============================"
	@echo "make status           - Show pipeline status"
	@echo "make create T=X N=Y   - Create document Y from template X"
	@echo "make list-templates   - Show available templates"
	@echo ""
	@echo "📚 Common Templates:"
	@echo "  create-prd.md       - Product Requirements Document"
	@echo "  adr-template.md     - Architecture Decision Record"
	@echo "  create-tech-spec.md - Technical Specification"
	@echo "  generate-tasks.md   - Implementation Tasks"
EOF

echo ""
echo "✅ AI-Dev pipeline setup complete!"
echo ""
echo "🚀 Next Steps:"
echo "  1. make status                              # Check setup"
echo "  2. make create T=create-prd.md N=prd.md     # Create PRD"
echo "  3. Edit ai-dev/docs/prd.md                  # Define your project"
echo "  4. make create T=generate-tasks.md N=tasks.md # Break down into tasks"
echo ""
echo "📖 Pipeline tracker: ai-dev/README.md"
echo "🔗 Template source: $template_source"