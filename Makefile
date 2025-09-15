WORKSPACE?=/workspace
TPL=templates
T?=create-prd.md
N?=new-doc.md

.PHONY: status create help all
.DEFAULT_GOAL := help

status:
	@echo "📊 AI-Dev Templates Status"
	@echo "=========================="
	@echo "📚 Templates: $(shell [ -d $(TPL) ] && echo "✅ Available ($(shell ls -1 $(TPL)/*.md 2>/dev/null | wc -l) templates)" || echo "❌ Missing")"
	@echo "📁 Workspace: $(WORKSPACE)"
	@echo "📄 Documents: $(shell ls -1 $(WORKSPACE)/*.md 2>/dev/null | wc -l || echo "0") markdown files"
	@echo ""
	@echo "📋 Recent Documents:"
	@ls -1t $(WORKSPACE)/*.md 2>/dev/null | head -5 | sed 's|$(WORKSPACE)/|  ✓ |' || echo "  (no documents yet)"

create:
	@if [ ! -f "$(TPL)/$(T)" ]; then \
		echo "❌ Template not found: $(T)"; \
		echo "💡 Available templates:"; \
		ls -1 $(TPL)/*.md 2>/dev/null | sed 's|$(TPL)/|  - |' | head -10; \
		exit 1; \
	fi
	@cp "$(TPL)/$(T)" "$(WORKSPACE)/$(N)"
	@echo "📄 Created: $(N)"
	@echo "📍 Location: $(WORKSPACE)/$(N)"
	@echo "✏️  Next: Edit the document with your preferred editor"

help:
	@echo "🚀 AI-Dev Containerized CLI"
	@echo "============================"
	@echo ""
	@echo "📋 Commands:"
	@echo "  make create T=template N=filename  - Create document from template"
	@echo "  make status                        - Show templates and workspace status"
	@echo "  make help                          - Show this help"
	@echo ""
	@echo "📚 Popular Templates:"
	@echo "  create-prd.md         - Product Requirements Document"
	@echo "  adr-template.md       - Architecture Decision Record"
	@echo "  create-tech-spec.md   - Technical Specification"
	@echo "  generate-tasks.md     - Implementation Tasks"
	@echo "  create-api-spec.md    - API Documentation"
	@echo "  create-test-plan.md   - Testing Strategy"
	@echo ""
	@echo "💡 Example:"
	@echo "  ai-dev make create T=create-prd.md N=my-feature.md"
	@echo ""
	@echo "📖 Full template list:"
	@ls -1 $(TPL)/*.md 2>/dev/null | sed 's|$(TPL)/|  - |' || echo "  (templates not found)"

# Default target
all: help