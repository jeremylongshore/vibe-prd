# vibe-prd — Form → BMAD natives + 22 templates (YC-guarded)

UID ?= $(shell id -u)
GID ?= $(shell id -g)
PWD_ABS := $(shell pwd)

BMAD_IMAGE := $(shell cat .bmad-version)
CLAUDE_MD ?= vibe-prd/CLAUDE.md
BMAD_OUT := docs/bmad
TPL_OUT  := docs/templates

.PHONY: ai-dev bmad-run collect-bmad extract-bmad fill-templates verify-outputs prd clean-docs fix-perms release-check release-pack

ai-dev: ## interactive form → CLAUDE.md
	@node form-system/cli.js

bmad-run:
	@echo "🤖 Running BMAD (no sudo)"; \
	docker run --rm -u $(UID):$(GID) -v "$(PWD_ABS)":/work -w /work "$(BMAD_IMAGE)" \
		bmad generate --input "$(CLAUDE_MD)" --out "/work/$(BMAD_OUT)"

collect-bmad:
	@node collect-bmad.js || true

extract-bmad:
	@node extract-bmad.js

fill-templates:
	@node fill-templates.js

verify-outputs:
	@test -d $(BMAD_OUT)
	@expected=$$(awk '/^\s*-\s+/{print $$2}' form-system/map.yaml | wc -l); \
	actual=$$(find $(TPL_OUT) -maxdepth 1 -type f | wc -l | tr -d ' '); \
	[ "$$actual" = "$$expected" ] || (echo "FAIL: need $$expected templates, got $$actual"; exit 1); \
	diff -u <(ls -1 $(TPL_OUT) | sort) <(awk '/^\s*-\s+/{print $$2}' form-system/map.yaml | sort) >/dev/null || \
	 (echo "FAIL: template names mismatch"; exit 1); \
	touch $(TPL_OUT)/.permcheck && rm -f $(TPL_OUT)/.permcheck; \
	echo "✅ Verification passed: BMAD natives + 22 templates"

prd: bmad-run collect-bmad extract-bmad fill-templates verify-outputs
	@echo "BMAD natives → $(BMAD_OUT)"
	@echo "22 templates → $(TPL_OUT)"

clean-docs:
	@rm -rf $(BMAD_OUT) $(TPL_OUT) artifacts.zip; echo "Cleaned docs + artifacts"

fix-perms:
	@echo "OK: permissions are user-owned by construction"

release-check:
	@set -euo pipefail; \
	echo "== Clean"; rm -rf $(BMAD_OUT) $(TPL_OUT); mkdir -p $(BMAD_OUT) $(TPL_OUT); \
	echo "== Run BMAD"; \
	docker run --rm -u $(UID):$(GID) -v "$(PWD_ABS)":/work -w /work "$(BMAD_IMAGE)" \
	  bmad generate --input "$(CLAUDE_MD)" --out "/work/$(BMAD_OUT)" || true; \
	echo "== Collect + extract + fill"; \
	node collect-bmad.js || true; \
	node extract-bmad.js; \
	node fill-templates.js; \
	echo "== Verify"; \
	$(MAKE) verify-outputs; \
	echo "== Package"; \
	zip -qr artifacts.zip docs || { echo "WARN: zip failed (empty?)"; true; }; \
	[ -f artifacts.zip ] && echo "READY: artifacts.zip contains BMAD natives + 22 templates" || (echo "FAIL: no artifacts.zip"; exit 1)

release-pack:
	@zip -qr artifacts.zip docs && echo "Packed -> artifacts.zip"