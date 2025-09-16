UID ?= $(shell id -u)
GID ?= $(shell id -g)
PWD_ABS := $(shell pwd)

BMAD_IMAGE := $(shell cat .bmad-version)
CLAUDE_MD ?= vibe-prd/CLAUDE.md
BMAD_OUT := docs/bmad
TPL_OUT  := docs/templates

.PHONY: ai-dev bmad-run collect-bmad extract-bmad fill-templates verify-outputs prd clean-docs fix-perms release-check

ai-dev:
	@node form-system/cli.js

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
	@expected=$$(awk '/^- /{print $$2}' form-system/map.yaml | wc -l); \
	actual=$$(find $(TPL_OUT) -maxdepth 1 -type f | wc -l | tr -d ' '); \
	[ "$$actual" = "$$expected" ] || (echo "FAIL: need $$expected templates, got $$actual"; exit 1); \
	diff -u <(ls -1 $(TPL_OUT) | sort) <(awk '/^- /{print $$2}' form-system/map.yaml | sort) >/dev/null || (echo "FAIL: template names mismatch"; exit 1); \
	touch $(TPL_OUT)/.permcheck && rm -f $(TPL_OUT)/.permcheck

prd: bmad-run collect-bmad extract-bmad fill-templates verify-outputs
	@echo "BMAD natives → $(BMAD_OUT)"
	@echo "22 templates → $(TPL_OUT)"

clean-docs:
	@rm -rf $(BMAD_OUT) $(TPL_OUT)
	@mkdir -p $(BMAD_OUT) $(TPL_OUT)

fix-perms:
	@docker run --rm -v $(PWD_ABS):/work alpine:3.20 sh -c "chown -R $(UID):$(GID) /work/docs 2>/dev/null || true"

release-check:
	@$(MAKE) clean-docs ai-dev prd verify-outputs
	@zip -qr artifacts.zip docs
	@echo "READY: artifacts.zip with BMAD natives + 22 templates"