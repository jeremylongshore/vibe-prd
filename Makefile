.PHONY: verify tree clean enterprise enterprise-ci release-check

verify:
	@./scripts/verify-templates.sh

tree:
	@printf "\nRepo layout:\n\n"; \
	find . -maxdepth 2 -type d | sort

clean:
	@echo "Nothing to clean (no build artifacts)."

enterprise:
	@node scripts/run-enterprise.mjs --project "$(PROJECT)"

enterprise-ci:
	@node scripts/run-enterprise.mjs --project "$(PROJECT)" --answers "$(ANSWERS)"

release-check:
	@echo "Release validation starting..."
	@./scripts/verify-templates.sh
	@echo "Creating release artifact..."
	@mkdir -p release-artifacts
	@zip -r artifacts.zip professional-templates/ README.md CLAUDE.md LICENSE
	@echo "✅ Release check passed - artifacts.zip created"