.PHONY: verify tree clean

verify:
	@ls -1 professional-templates | wc -l | xargs -I{} bash -c 'if [ "$1" -ne 22 ]; then echo "Expected 22 templates, found $1"; exit 1; fi' _ {}
	@echo "✅ templates OK (22)"; exit 0

tree:
	@printf "\nRepo layout:\n\n"; \
	find . -maxdepth 2 -type d | sort

clean:
	@echo "Nothing to clean (no build artifacts)."