DOCS=ai-dev/docs
SOP=ai-dev/sop
TPL=ai-dev/templates
T?=create-prd.md
N?=new-doc.md

.PHONY: status create list-templates help dev build

# AI-Dev Pipeline Commands
status:
	@echo "📊 AI-Dev Pipeline Status: $(shell basename $(PWD))"
	@echo "========================================"
	@echo "📚 Templates: $(shell [ -d $(TPL) ] && echo "✅ Available" || echo "❌ Missing")"
	@echo "📁 Documents: $(shell [ -d $(DOCS) ] && ls -1 $(DOCS) 2>/dev/null | wc -l || echo "0") files"
	@echo ""
	@echo "📋 Current Documents:"
	@[ -d $(DOCS) ] && ls -1 $(DOCS) 2>/dev/null | sed 's/^/  ✓ /' || echo "  (no documents yet)"
	@echo ""
	@echo "🎯 Example Project Status:"
	@echo "  ✓ PRD (User Authentication)"
	@echo "  ✓ ADR-001 (Core Architecture)"
	@echo "  ⏳ Tech Spec (In Progress)"
	@echo "  ⏳ Implementation Tasks"

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
	@echo ""
	@echo "🔧 Project Commands"
	@echo "==================="
	@echo "make dev             - Start development server"
	@echo "make build           - Build for production"

# Project Development Commands
dev:
	@echo "🚀 Starting TaskFlow development server..."
	@if [ -f "package.json" ]; then npm run dev; else echo "📦 Run 'npm install' first"; fi

build:
	@echo "🏗️  Building TaskFlow for production..."
	@if [ -f "package.json" ]; then npm run build; else echo "📦 Run 'npm install' first"; fi