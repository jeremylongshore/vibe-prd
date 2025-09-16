# 🚀 vibe-prd

![BMAD AUTO-UPDATES](https://img.shields.io/badge/BMAD%20AUTO--UPDATES-ENABLED-brightgreen?style=for-the-badge&logo=docker)
![Docs Verified](https://img.shields.io/github/actions/workflow/status/jeremylongshore/vibe-prd/container-ci.yml?label=Docs%20Verified&style=for-the-badge&logo=github)
![Zero Sudo](https://img.shields.io/badge/Sudo-Free-success?style=for-the-badge&logo=linux)

Form in → BMAD natives + 22 pro docs out.
No version chasing. No root files.

---

## Usage

1. `make ai-dev` → answer prompts
2. `make prd` → outputs:
   - `docs/bmad/` (BMAD originals)
   - `docs/templates/` (22 professional docs)

---

## Automatic BMAD Updates

`vibe-prd` uses Renovate + CI to keep BMAD current:

- Daily check for new container tags
- PR bumps `.bmad-version` and refreshes `.bmad-lock`
- CI must pass before merge ➡️ You always run the latest verified BMAD

---

## 🚀 YC Protocol Integration (Why This Is Superior)

We added **YC founder protocols** on top of BMAD automation, turning doc generation into a professional-grade, failure-resistant system:

✅ **Planning & Scope Control**
- Comprehensive plan in Markdown
- Incremental implementation (section by section)
- Delete unnecessary items, keep scope tight
- Commit early & often for clean history

⚡ **Version Control Discipline**
- Reset clean if stuck (`git reset --hard HEAD`)
- Avoid cumulative failed attempts (reset + reapply)
- Enforce clean implementation on success

📦 **Testing Framework**
- Prioritize end-to-end checks (not just unit tests)
- Simulate user behavior (realistic flows)
- Catch regressions (no unrelated AI rewrites)
- Tests as guardrails — CI enforces boundaries

🔧 **Effective Bug Fixing**
- Leverage error messages (AI interprets logs fast)
- Analyze before coding — multiple hypotheses
- Reset after repeated failures
- Add logging to capture context & prevent repeats

🤖 **AI Optimization**
- Instruction files: `.cursorrules`, `windsurf.rules`, `claude.md`
- Use multiple AI tools — cross-check outputs
- Tool specialization (Cursor: frontend, Windsurf: deeper refactor)
- Compare outputs, keep the strongest

♻️ **Continuous Improvement**
- Renovate auto-updates BMAD daily
- CI required before merge = always green main
- Frequent refactors keep the code/docs lean

**Result:**
Form input → BMAD analysis → 22 verified professional docs → Release artifacts — now hardened with **YC guardrails**.

---

## What This Does

You know how you always start documentation with a blank page and think *"wtf do I write?"* This fixes that.

**You get:** 22+ professional document templates (PRDs, API docs, tech specs, etc.)
**You run:** Two commands
**You get:** BMAD native analysis + pre-filled professional documents

No more googling *"how to write a PRD"* or copying random templates from the internet.

---

## 🧑‍💻 Contributing

- Follow SOP rules (`SOP.md`)
- No sudo, UID/GID safe containers only
- 22 docs required, no extras
- PRs must pass CI and adhere to template

---

## 📜 License

Apache-2.0