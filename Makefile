.PHONY: verify tree clean enterprise enterprise-ci

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