# 📘 vibe-prd — One-Paste Claude Docs Generator

**Description:** One-paste Claude Code docs pipeline: paste prompt → 22 enterprise docs → `completed-docs/`.
**BMAD:** Archived under `archive/bmad-method/` with restoration guide.

---

## 🚀 How It Works (Zero Setup)

1. **Clone**
   ```bash
   git clone https://github.com/jeremylongshore/vibe-prd.git
   cd vibe-prd
   ```

2. Open Claude Code CLI in your terminal.
3. Copy/paste the One-Paste block from below into Claude.
4. Answer one question (project description).
5. Get 22 enterprise-grade docs in `completed-docs/<your-project>/`.

## ⚡ One-Paste Block

> Open Claude Code CLI and paste this:

```
You are Claude Code running in my terminal.
Goal: Generate a full set of 22 enterprise-grade docs from a project description.
Output: Place results in completed-docs/<project-name>/.

Instructions:
1. Ask me once: "Describe your project. Provide as much or as little detail as you want (a sentence, a paragraph, or even a full page)."
2. Take that description and auto-complete all reasoning steps yourself (deductive logic, no further questions).
3. Use the professional-templates/ (22 files, 01–22) as blueprints.
4. Generate final documents in completed-docs/<project-name>/.
5. Ensure each doc follows enterprise template structure.
6. Provide a final index.md summarizing the set.

Rules:
- Don't modify professional-templates/.
- Save everything only to completed-docs/.
- If errors occur, fix automatically and retry.
- Always confirm final output folder path to me.
```

---

## 📂 Repo Structure

```
vibe-prd/
├── professional-templates/   # 22 enhanced templates (READ-ONLY)
├── completed-docs/           # AI-generated docs per project (output)
├── archive/
│   └── bmad-method/          # Preserved BMAD (optional, not active)
├── .github/
│   └── workflows/
│       └── ci.yml            # Simplified CI (template sanity + completed-docs smoke)
├── working-mds/              # Phase reports, smoke test, summaries
└── README.md
```

---

## 🛡️ Protections
- Branch protections enforced on main (review + passing CI)
- Tag rules block deletion and force-push on releases

---

## 🙏 Credit

This repo began with BMAD-METHOD and Stulogy's early work.
We simplified and archived BMAD for later, and now deliver a zero-dependency Claude flow for anyone to use.