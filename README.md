# 🚀 vibe-prd

![BMAD auto-updates](https://img.shields.io/badge/BMAD%20auto--updates-Enabled-brightgreen?style=for-the-badge&logo=docker)
![Docs Verified](https://img.shields.io/github/actions/workflow/status/jeremylongshore/vibe-prd/container-ci.yml?label=Docs%20Verified&style=for-the-badge&logo=github)
![Made with AI](https://img.shields.io/badge/Made%20with-AI-blueviolet?style=for-the-badge&logo=openai)
![Zero Sudo](https://img.shields.io/badge/Sudo-Free-success?style=for-the-badge&logo=linux)

**vibe-prd** is the **one-command AI dev stack**:
Form in → **BMAD's native analysis** + **22 pro-grade templates out**.
No setup headaches. No version chasing. Just outputs that slap.

---

## ⚡ Why vibe-prd slaps

- **BMAD native + pro docs** → Get the raw BMAD insights *and* a polished 22-doc suite.
- **Auto-updating core** → Renovate + CI keep BMAD pinned and fresh. You never touch a version string.
- **Zero sudo, zero tears** → Containers run under your UID/GID. No root-owned files.
- **CI-gated** → Every PR runs `make prd` and verifies outputs. Broken docs can't land.
- **Developer vibe** → Minimal commands, maximum output. You focus on ideas, vibe-prd does the paperwork.

---

## 🛠️ How it works

1. **Fill the form**
   ```bash
   make ai-dev
   ```
   Answer 9 simple questions about your project.

2. **Generate docs**
   ```bash
   make prd
   ```
   - `docs/bmad/` → BMAD's native analysis (their voice, their insights).
   - `docs/templates/` → 22 professional docs auto-filled with BMAD's output.

3. **Ship confidently**
   - Always on the latest BMAD.
   - Always reproducible (`.bmad-lock` digest pinned).
   - Always verified by CI.

---

## 🧬 Tech Stack Magic
- **Dockerized BMAD** — runs as a pinned container, UID-safe.
- **Renovate Bot** — auto bumps BMAD versions daily.
- **GitHub Actions** — container CI, docs verification, release flow.
- **Makefile UX** — one-liners for prd, ai-dev, verify-outputs.
- **Templates** — your 22-doc suite wired for BMAD JSON/Markdown extraction.

---

## 🔮 The Vision

From a simple prompt to a full product spec,
vibe-prd turns **ideas → docs → action**.

You walk in with nothing but an idea.
You walk out with BMAD's raw intelligence and a C-suite-ready document suite.
No grind, no excuses, just execution.

---

## What This Does

You know how you always start documentation with a blank page and think "wtf do I write?" This fixes that.

**You get:** 22+ professional document templates (PRDs, API docs, tech specs, etc.)
**You run:** One command
**You get:** A pre-filled document with all the right sections

No more googling "how to write a PRD" or copying random templates from the internet.

## 🤖 Complete Beginner? Let AI Help You

**Never used GitHub or Docker?** Copy this repo URL and this prompt to Claude/ChatGPT:

```
I'm a complete beginner and found this repository: https://github.com/jeremylongshore/vibe-prd

I want to use this "AI Development Tasks" system but don't know how to install or use it. Please walk me through everything step-by-step, assuming I know nothing about command line tools.

My computer: [Mac/Windows/Linux]
```

The AI will guide you through installation and first use. **[More AI prompts →](./AI_ASSISTANT_PROMPTS.md)**

### Quick start
1. Edit `vibe-prd/CLAUDE.md` with your project context.
2. Run: `make prd`
3. See generated docs in `/docs`.

BMAD runs inside a pinned container defined in `.bmad-version`. Do not call BMAD directly.

## ⚡ Quick Install (30 seconds)

**Step 1:** Copy this, paste in terminal:
```bash
curl -fsSL https://raw.githubusercontent.com/jeremylongshore/vibe-prd/main/ai-dev -o /usr/local/bin/ai-dev && chmod +x /usr/local/bin/ai-dev
```

**Step 2:** Test it works:
```bash
ai-dev make help
```

**Done.** (Needs Docker installed, but you probably have that)

## How To Use It

### Create Any Professional Document
```bash
# Go to your project folder
cd ~/my-startup

# Create a Product Requirements Document (PRD)
ai-dev make create T=create-prd.md N=user-login-feature.md

# Boom! You now have "user-login-feature.md" with proper PRD structure
```

### What You Get In That Document
- Problem statement section
- Success metrics section
- User stories section
- Technical requirements section
- Risk assessment section
- All the stuff that makes you look like you know what you're doing

### Other Useful Documents You Can Create
```bash
# Technical specification (how to actually build it)
ai-dev make create T=create-tech-spec.md N=login-api-spec.md

# API documentation (document your endpoints)
ai-dev make create T=create-api-spec.md N=users-api.md

# Architecture decision (why you chose React over Vue)
ai-dev make create T=adr-template.md N=why-we-use-postgres.md

# Project breakdown (turn big ideas into tasks)
ai-dev make create T=generate-tasks.md N=sprint-planning.md
```

## Why This Is Actually Useful

### Before This Tool:
1. Google "how to write a PRD"
2. Find some random blog post
3. Copy/paste into blank doc
4. Spend 2 hours figuring out what sections you need
5. End up with amateur-looking docs

### With This Tool:
1. Run one command
2. Get professional template instantly
3. Fill in the blanks
4. Look like you know what you're doing

## What Documents You Can Create

**The stuff every startup/project needs:**

- **PRD** (Product Requirements) - What you're building and why
- **Tech Spec** - How you're actually going to build it
- **API Docs** - Document your endpoints so people can use them
- **User Stories** - Features from the user's perspective
- **Project Plans** - Break big ideas into actual tasks
- **Decision Records** - Why you chose X over Y (for future you)
- **Runbooks** - How to fix things when they break
- **Post-mortems** - What went wrong and how to prevent it

**And 14 more** for when you get fancy.

## See All Available Templates
```bash
ai-dev make help
```

## Real Example

Let's say you're building a login feature:

```bash
# 1. Write the requirements
ai-dev make create T=create-prd.md N=login-feature.md

# 2. Figure out how to build it
ai-dev make create T=create-tech-spec.md N=login-implementation.md

# 3. Document the API
ai-dev make create T=create-api-spec.md N=auth-api.md

# 4. Break it into tasks
ai-dev make create T=generate-tasks.md N=login-sprint.md
```

Now you have 4 professional documents that make you look organized AF.

## Who This Is For

- **Startup founders** who need to look professional to investors
- **Solo developers** who want to document stuff properly
- **Small teams** who don't have dedicated PMs/tech writers
- **Anyone** who's tired of starting docs from scratch

## What You Need

- A computer with Docker (Mac/Windows/Linux all work)
- 5 minutes to install
- Basic ability to edit text files

That's it. No coding skills needed.

---

**Stop looking amateur. Get professional docs in 30 seconds.**