DOCS=docs
SOP=sop
TPL=templates
T?=create-prd.md
N?=new-doc.md

.PHONY: status create help

status:
	@echo "📊 AI-Dev Pipeline Status: Jeremy's Workspace"
	@echo "=============================================="
	@echo "📚 Templates: $(shell [ -d $(TPL) ] && echo "✅ Available" || echo "❌ Missing")"
	@echo "📁 Documents: $(shell [ -d $(DOCS) ] && ls -1 $(DOCS) 2>/dev/null | wc -l || echo "0") files"
	@echo ""
	@echo "📋 Current Documents:"
	@[ -d $(DOCS) ] && ls -1 $(DOCS) 2>/dev/null | sed 's/^/  ✓ /' || echo "  (no documents yet)"

create:
	@mkdir -p $(DOCS) $(SOP)
	@if [ ! -f "$(TPL)/$(T)" ]; then echo "❌ Template not found: $(T)"; echo "💡 Available templates in ~/ai-dev/templates/"; exit 1; fi
	@if echo "$(N)" | grep -q "sop"; then \
		cp "$(TPL)/$(T)" "$(SOP)/$(N)"; \
		echo "📄 Created: $(SOP)/$(N)"; \
	else \
		cp "$(TPL)/$(T)" "$(DOCS)/$(N)"; \
		echo "📄 Created: $(DOCS)/$(N)"; \
	fi
	@echo "✏️  Next: Edit the document and update README.md checklist"

help:
	@echo "🚀 AI-Dev Commands"
	@echo "=================="
	@echo "make status           - Show pipeline status"
	@echo "make create T=X N=Y   - Create document Y from template X"
	@echo ""
	@echo "📚 Common Templates:"
	@echo "  create-prd.md       - Product Requirements Document"
	@echo "  adr-template.md     - Architecture Decision Record"
	@echo "  create-tech-spec.md - Technical Specification"
	@echo "  generate-tasks.md   - Implementation Tasks"