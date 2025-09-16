# AI-Dev Simplified Workflow
# Minimal Makefile for one-paste Claude workflow

.PHONY: help verify tree clean release-check

help:
	@echo "AI-Dev Simplified Workflow"
	@echo ""
	@echo "Targets:"
	@echo "  verify      - basic repo verification"
	@echo "  tree        - print repo tree depth 2"
	@echo "  clean       - clean output directories"
	@echo ""
	@echo "One-Paste Workflow:"
	@echo "  Use Claude Code CLI with the prompt from README.md"
	@echo "  Output will be in completed-docs/<project-slug>/"

verify:
	@test -d professional-templates || (echo "❌ missing professional-templates/"; exit 1)
	@test -d completed-docs || (mkdir -p completed-docs && echo "✅ created completed-docs/")
	@test -d working-mds || (mkdir -p working-mds && echo "✅ created working-mds/")
	@template_count=$$(find professional-templates -name "*.md" -type f | wc -l); \
	if [ $$template_count -lt 20 ]; then \
		echo "⚠️  Only $$template_count templates found (expected 22+)"; \
	else \
		echo "✅ $$template_count templates found"; \
	fi
	@echo "✅ basic verify passed"

tree:
	@echo "Repository structure:"
	@find . -maxdepth 2 -type d | sort | sed 's|^\./||' | grep -v '^\.git' | head -20

clean:
	@echo "Cleaning output directories..."
	@rm -rf completed-docs/* 2>/dev/null || true
	@rm -rf working-mds/* 2>/dev/null || true
	@echo "✅ Cleaned completed-docs/ and working-mds/"

release-check:
	@echo "🔍 Running release validation..."
	@make verify
	@template_count=$$(find professional-templates -name "*.md" -type f | wc -l); \
	echo "📊 Found $$template_count templates"
	@if [ -d completed-docs ] && [ "$$(ls -A completed-docs 2>/dev/null)" ]; then \
		echo "📁 Sample outputs present in completed-docs/"; \
		ls -1 completed-docs/ | head -3 | sed 's/^/  - /'; \
	fi
	@echo "📦 Creating release artifact..."
	@mkdir -p release-artifacts
	@cp -r professional-templates release-artifacts/
	@if [ -d completed-docs ] && [ "$$(ls -A completed-docs 2>/dev/null)" ]; then \
		cp -r completed-docs release-artifacts/; \
	fi
	@cd release-artifacts && zip -r ../artifacts.zip . >/dev/null
	@rm -rf release-artifacts
	@echo "✅ Release validation complete - artifacts.zip created"