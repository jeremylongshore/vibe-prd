# 🚀 vibe-prd — One-Paste Claude Docs Pipeline

Generate **22 enterprise-grade project documents** from a single summary using Claude Code (CLI).

## Quick Start (2 steps)

1) **Clone**
```bash
git clone https://github.com/jeremylongshore/vibe-prd.git ~/ai-dev
cd ~/ai-dev
```

2) **Open Claude Code CLI and paste this:**

```
Create a new folder in completed-docs/ named after my project, then generate all 22 docs using the templates in professional-templates/. Ask me for a single free-form project summary (I can paste as much as I want). Use deductive reasoning to fill gaps. Output all final docs into completed-docs/<my-project>/ and include an index.md summarizing what was generated and any assumptions.
```

## What you get

- `completed-docs/<project>/` → 22 enterprise documents (PRD, ADRs, risks, QA gates, test plan, release plan, etc.) + index.md
- No Docker. No BMAD setup. Claude-only.

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

## Contributing

PRs welcome. Please keep the 22 templates canonical; additions belong in a separate folder.