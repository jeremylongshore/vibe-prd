# Force root to repo path
ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
export ROOT

# Always run from project root
MAKEFLAGS += --directory=$(ROOT)

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

# Phase 3: BMAD Native + Professional Templates
BMAD_IMAGE := $(shell cat .bmad-version)
UID ?= $(shell id -u)
GID ?= $(shell id -g)
PWD_ABS := $(shell pwd)
BMAD_OUT := docs/bmad
TPL_OUT := docs/templates
CLAUDE_MD ?= vibe-prd/CLAUDE.md

.PHONY: ai-dev bmad-run collect-bmad extract-bmad fill-templates verify-outputs prd clean-docs fix-perms

ai-dev:
	@node cli.js

bmad-run:
	@mkdir -p $(BMAD_OUT)
	docker run --rm -u $(UID):$(GID) -v $(PWD_ABS):/work -w /work $(BMAD_IMAGE) \
	  bmad generate --input $(CLAUDE_MD) --out /work/$(BMAD_OUT) || true

collect-bmad:
	@node collect-bmad.js

extract-bmad:
	@node extract-bmad.js

fill-templates:
	@node fill-templates.js

verify-outputs:
	@test -d $(BMAD_OUT)
	@expected=$$(awk '/^\s*-\s+/{print $$2}' map.yaml | wc -l); \
	actual=$$(find $(TPL_OUT) -maxdepth 1 -type f | wc -l | tr -d ' '); \
	echo "Templates: $$actual files (expect $$expected)"; \
	[ "$$actual" = "$$expected" ] || (echo "Template count mismatch"; exit 1)

prd: bmad-run collect-bmad extract-bmad fill-templates verify-outputs
	@echo "Done. BMAD natives in $(BMAD_OUT) + 22 templates in $(TPL_OUT)"

clean-docs:
	@rm -rf $(BMAD_OUT) $(TPL_OUT)
	@mkdir -p $(BMAD_OUT) $(TPL_OUT)

fix-perms:
	@docker run --rm -v $(PWD_ABS):/work alpine:3.20 sh -c "chown -R $(UID):$(GID) /work/docs 2>/dev/null || true"

bmad-lock:
	@docker pull $(BMAD_IMAGE) >/dev/null
	@digest=$$(docker inspect --format='{{index .RepoDigests 0}}' $(BMAD_IMAGE) | sed 's/.*@//'); \
	  echo $$digest > .bmad-lock; echo "Locked: $$digest"

# Legacy Phase 2: Form-driven document generation (deprecated)
.PHONY: fallback-pack

fallback-pack:
	@mkdir -p $(TPL_OUT)
	@for f in $(shell grep -o '[a-z-]*.md' form-system/map.yaml); do \
	  cp form-system/fallback-templates/$$f $(TPL_OUT)/$$f; \
	done
	@echo "Fallback 22-doc pack created in $(TPL_OUT)/"