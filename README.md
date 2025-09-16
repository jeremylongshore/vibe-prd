# 🚀 vibe-prd — AI Documentation Generator

Generate **22 enterprise-grade project documents** using AI assistants. Works with both **Claude Code CLI** and **Cursor IDE**.

## Quick Start (2 steps)

1) **Clone**
```bash
git clone https://github.com/jeremylongshore/vibe-prd.git ~/ai-dev
cd ~/ai-dev
```

2) **Choose your AI tool:**

### Option A: Claude Code CLI (Simple)
Paste this one-liner:
```
Create a new folder in completed-docs/ named after my project, then generate all 22 docs using the templates in professional-templates/. Ask me for a single free-form project summary (I can paste as much as I want). Use deductive reasoning to fill gaps. Output all final docs into completed-docs/<my-project>/ and include an index.md summarizing what was generated and any assumptions.
```

### Option B: Cursor IDE (Structured)
Use the `.cursorrules/` workflow:
```
Use @.cursorrules/01-create-prd.mdc
Here's my feature: [describe it]
```
Then follow steps 2-4 in `.cursorrules/`

## What you get

- **22 enterprise documents** (PRD, ADRs, risks, QA gates, test plan, release plan, etc.)
- **No Docker/BMAD setup** required
- **Works with both Claude and Cursor**

## Repo layout

```
~/ai-dev/
├── professional-templates/   # 22 master templates (read-only)
├── completed-docs/           # Your generated outputs (per project)
├── working-mds/              # Ops reports / logs
└── archive/                  # BMAD + legacy files (preserved)
```

## Verify

```bash
make verify
```

## More Info

- **Detailed comparison**: See `UNIFIED_AI_WORKFLOW.md`
- **Cursor workflow**: See `.cursorrules/vibe-basics.md`
- **Templates**: All 22 in `professional-templates/`

## Contributing

PRs welcome. Please keep the 22 templates canonical; additions belong in a separate folder.