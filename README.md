# vibe-prd 🚀

**Form → BMAD → 22 Pro Docs** (YC-style guardrails)

## Why this system
- BMAD alone generates — this repo **enforces**:
  - No sudo; UID/GID-safe containers
  - CI verifies exactly 22 templates match map
  - Releases attach artifacts.zip every time
  - Tag rewrites/deletes blocked (immutable releases)

## Usage
1. `make ai-dev` → answer prompts → `vibe-prd/CLAUDE.md`
2. `make prd` → BMAD natives + 22 templates
3. `make release-check` → verify + zip

## Badges
![Docs Verified](https://img.shields.io/github/actions/workflow/status/jeremylongshore/vibe-prd/container-ci.yml?label=Docs%20Verified&style=for-the-badge&logo=github)
![Zero Sudo](https://img.shields.io/badge/Sudo-Free-success?style=for-the-badge&logo=linux)

## Usage
1. `make ai-dev` → answer prompts
2. `make prd` → outputs:
   - `docs/bmad/` (BMAD originals)
   - `docs/templates/` (22 professional docs)

## Automatic BMAD Updates
vibe-prd uses Renovate + CI to keep BMAD current:
- Daily check for new container tags
- PR bumps `.bmad-version` and refreshes `.bmad-lock`
- CI must pass before merge
➡️ You always run the latest verified BMAD.

## What This Does

You know how you always start documentation with a blank page and think "wtf do I write?" This fixes that.

**You get:** 22+ professional document templates (PRDs, API docs, tech specs, etc.)
**You run:** Two commands
**You get:** BMAD native analysis + pre-filled professional documents

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