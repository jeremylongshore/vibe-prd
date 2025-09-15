#!/usr/bin/env bash
set -euo pipefail
# Set up project to use Jeremy's central ai-dev workspace
# Links project to ~/ai-dev for all AI development tasks

echo "🔧 AI-Dev Project Setup (v2.0)"
echo "==============================="

PROJECT_ROOT="$(pwd)"
PROJECT_NAME="$(basename "$PROJECT_ROOT")"
AI_DEV_ROOT="$HOME/ai-dev"

echo "📁 Project: $PROJECT_NAME"
echo "📍 Location: $PROJECT_ROOT"
echo "🎯 AI-Dev Workspace: $AI_DEV_ROOT"

# Ensure ~/ai-dev exists
if [ ! -d "$AI_DEV_ROOT" ]; then
    echo "❌ ~/ai-dev directory not found. Creating it..."
    mkdir -p "$AI_DEV_ROOT"/{docs,sop}
    ln -sf ~/ai-dev/professional-templates "$AI_DEV_ROOT/templates"
    # ai-dev workspace already exists, no need to copy files
    echo "✅ Created ~/ai-dev workspace"
fi

# Create project-specific Makefile that points to ~/ai-dev
echo "📄 Creating project Makefile..."
cat > Makefile << 'EOF'
# AI-Dev Integration - All commands route to ~/ai-dev
AI_DEV = $(HOME)/ai-dev

.PHONY: status create help ai-dev

status:
	@echo "📊 Project Status: $(shell basename $(PWD))"
	@echo "🎯 AI-Dev Workspace: ~/ai-dev"
	@echo ""
	@cd $(AI_DEV) && make status

create:
	@echo "📄 Creating document in ~/ai-dev..."
	@cd $(AI_DEV) && make create T=$(T) N=$(N)
	@echo "📍 Document created in ~/ai-dev/docs/"

help:
	@echo "🚀 AI-Dev Commands (routes to ~/ai-dev)"
	@echo "========================================"
	@echo "make status           - Show ai-dev pipeline status"
	@echo "make create T=X N=Y   - Create document Y from template X"
	@echo "make ai-dev           - Go to ai-dev workspace"
	@echo ""
	@echo "📍 All documents are created in: ~/ai-dev/docs/"
	@echo "📚 Templates available in: ~/ai-dev/templates/"

ai-dev:
	@echo "📍 Opening ~/ai-dev workspace..."
	@cd $(AI_DEV) && exec $$SHELL
EOF

# Create README section for ai-dev integration
if [ ! -f "README.md" ]; then
    echo "📄 Creating README.md..."
    cat > README.md << EOF
# $PROJECT_NAME

## AI Development Integration

This project uses Jeremy's central ai-dev workspace for all documentation.

### Commands
\`\`\`bash
make status                    # Check ai-dev pipeline status
make create T=template N=name  # Create document from template
make ai-dev                    # Go to ai-dev workspace
\`\`\`

### Documentation Location
All AI development documents are created in: \`~/ai-dev/docs/\`

### Available Templates
See: \`~/ai-dev/templates/\` or run \`make help\`
EOF
else
    echo "📄 README.md exists, skipping creation"
fi

echo ""
echo "✅ Project setup complete!"
echo ""
echo "🚀 Next Steps:"
echo "  1. make status           # Check ai-dev pipeline"
echo "  2. make create T=create-prd.md N=prd.md  # Create first document"
echo "  3. cd ~/ai-dev           # Go to ai-dev workspace"
echo ""
echo "📍 All documents will be created in: ~/ai-dev/docs/"