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

.PHONY: prd bmad-run extract-bmad fill-templates verify-outputs fix-perms clean-docs bmad-lock check

check:
	@test -f .bmad-version || (echo ".bmad-version missing" && exit 1)
	@test -f $(CLAUDE_MD) || (echo "$(CLAUDE_MD) missing" && exit 1)

clean-docs:
	@rm -rf $(BMAD_OUT) $(TPL_OUT)
	@mkdir -p $(BMAD_OUT) $(TPL_OUT)

bmad-run: check
	@echo "🤖 Running BMAD container with proper permissions..."
	@mkdir -p $(BMAD_OUT)
	docker run --rm \
	  -u $(UID):$(GID) \
	  -v $(PWD_ABS):/work \
	  -w /work \
	  $(BMAD_IMAGE) \
	  bmad generate --input $(CLAUDE_MD) --out /work/$(BMAD_OUT)

fix-perms:
	@docker run --rm -v $(PWD_ABS):/work alpine:3.20 \
	  sh -c "chown -R $(UID):$(GID) /work/docs 2>/dev/null || true"

extract-bmad:
	@echo "🔍 Extracting BMAD data for template filling..."
	@node extract-bmad.js

fill-templates:
	@echo "📝 Filling professional templates with BMAD insights..."
	@node fill-templates.js

prd: bmad-run extract-bmad fill-templates verify-outputs
	@echo ""
	@echo "🎯 Phase 3 Complete: BMAD docs + Professional templates"
	@echo "📁 BMAD native docs: $(BMAD_OUT)/"
	@echo "📋 Professional docs: $(TPL_OUT)/"
	@echo "📊 Total outputs: BMAD originals + 22 template docs"

bmad-lock:
	@docker pull $(BMAD_IMAGE) >/dev/null
	@digest=$$(docker inspect --format='{{index .RepoDigests 0}}' $(BMAD_IMAGE) | sed 's/.*@//'); \
	  echo $$digest > .bmad-lock; echo "Locked: $$digest"

# Phase 2: Form-driven document generation
.PHONY: ai-dev fallback-pack verify-outputs

ai-dev:
	@node form-system/cli.js

fallback-pack:
	@mkdir -p $(TPL_OUT)
	@for f in $(shell grep -o '[a-z-]*.md' form-system/map.yaml); do \
	  cp form-system/fallback-templates/$$f $(TPL_OUT)/$$f; \
	done
	@echo "Fallback 22-doc pack created in $(TPL_OUT)/"

verify-outputs:
	@echo "📋 Verifying BMAD + templates suite..."
	@test -d $(BMAD_OUT) || (echo "❌ Missing $(BMAD_OUT)/"; exit 1)
	@expected=22; \
	actual=$$(find $(TPL_OUT) -type f -maxdepth 1 | wc -l | tr -d ' '); \
	echo "Templates: $$actual files (expected $$expected)"; \
	[ "$$actual" = "$$expected" ] || (echo "❌ Need 22 template docs, got $$actual"; exit 1)
	@comm -3 <(ls -1 $(TPL_OUT) | sort) <(grep -o '[a-z-]*.md' form-system/map.yaml | sort) | \
	  (! read) || (echo "❌ Template name mismatch"; exit 1)
	@echo "✅ Verification passed: BMAD natives + 22 templates"