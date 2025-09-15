#!/usr/bin/env bash
set -euo pipefail
# Setup vibe-prd as workspace-wide template system
# Installs central templates and links every git project to ai-dev/templates

echo "🚀 vibe-prd workspace setup (v1.0)"
echo "====================================="

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VIBE_PRD_ROOT="$(dirname "$SCRIPT_DIR")"
WORKSPACE_ROOT="${WORKSPACE_ROOT:-$HOME/projects}"
TEMPLATES_DIR="${TEMPLATES_DIR:-$HOME/ai-dev-templates}"

echo "📁 Workspace: $WORKSPACE_ROOT"
echo "📚 Templates: $TEMPLATES_DIR"
echo "🔗 Source: $VIBE_PRD_ROOT"

# 1. Setup central template library
if [ ! -d "$TEMPLATES_DIR" ]; then
    echo "📦 Creating central template library..."
    cp -r "$VIBE_PRD_ROOT" "$TEMPLATES_DIR"
    echo "✅ Templates installed at: $TEMPLATES_DIR"
else
    echo "📦 Template library already exists at: $TEMPLATES_DIR"
fi

# 2. Find all git projects in workspace
echo "🔍 Scanning for git projects in $WORKSPACE_ROOT..."
projects=()
if [ -d "$WORKSPACE_ROOT" ]; then
    while IFS= read -r -d '' project; do
        projects+=("$project")
    done < <(find "$WORKSPACE_ROOT" -maxdepth 2 -name ".git" -type d -exec dirname {} \; 2>/dev/null | sort -u | tr '\n' '\0')
fi

echo "📊 Found ${#projects[@]} git repositories"

# 3. Setup ai-dev pipeline for each project
for project in "${projects[@]}"; do
    project_name=$(basename "$project")
    echo "🔧 Setting up ai-dev pipeline: $project_name"

    cd "$project"

    # Skip if already has ai-dev
    if [ -d "ai-dev" ]; then
        echo "⚠️  ai-dev already exists in $project_name, skipping..."
        continue
    fi

    # Create ai-dev structure
    mkdir -p ai-dev/{docs,sop}

    # Link to central templates
    ln -sfn "$TEMPLATES_DIR/professional-templates" ai-dev/templates

    # Create standard agent files
    cat > ai-dev/docs/claude.md << 'EOF'
# Project LLM Guide
Read templates from `../templates/` (central). Write docs to `../docs/` or `../sop/`.
On creating/updating any doc:
1) Update `../README.md` checklist and phase.
2) Keep headers, frontmatter, and table formats.
Never copy templates into the repo. If a template is missing, request it upstream.
EOF

    cat > ai-dev/README.md << EOF
# AI Development Pipeline — $project_name
Status: Ready ✅  | Templates: \`ai-dev/templates\` → central library

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
	@echo "📚 Templates: $(shell [ -L $(TPL) ] && echo "✅ Linked" || echo "❌ Missing")"
	@echo "📁 Documents: $(shell [ -d $(DOCS) ] && ls -1 $(DOCS) 2>/dev/null | wc -l || echo "0") files"
	@echo ""
	@echo "📋 Current Documents:"
	@[ -d $(DOCS) ] && ls -1 $(DOCS) 2>/dev/null | sed 's/^/  ✓ /' || echo "  (no documents yet)"

create:
	@mkdir -p $(DOCS) $(SOP)
	@if [ ! -f "$(TPL)/$(T)" ]; then echo "❌ Template not found: $(T)"; exit 1; fi
	@if echo "$(N)" | grep -q "sop"; then
		cp "$(TPL)/$(T)" "$(SOP)/$(N)"
		echo "📄 Created: $(SOP)/$(N)"
	else
		cp "$(TPL)/$(T)" "$(DOCS)/$(N)"
		echo "📄 Created: $(DOCS)/$(N)"
	fi

list-templates:
	@echo "📚 Available Templates:"
	@[ -d $(TPL) ] && ls -1 $(TPL)/*.md 2>/dev/null | sed 's|.*/||; s|\.md$$||' | sed 's/^/  - /'

help:
	@echo "make status    - Show pipeline status"
	@echo "make create    - Create document from template"
	@echo "make help      - Show this help"
EOF

    echo "✅ Setup complete: $project_name"
done

echo ""
echo "🎉 Workspace setup complete!"
echo "📊 Processed: ${#projects[@]} projects"
echo "📚 Central templates: $TEMPLATES_DIR"
echo ""
echo "🚀 Next Steps:"
echo "  1. cd [project-directory]"
echo "  2. make status"
echo "  3. make create T=create-prd.md N=prd.md"