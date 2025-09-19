# Claude One-Paste: Install + Run `/new-project`

**What the user pastes into Claude Code chat:**

```
https://github.com/jeremylongshore/vibe-prd.git
Claude, do the following on my machine:
1. If ~/ai-dev is missing, clone the repo there:
   • if [ -d ~/ai-dev/.git ]; then cd ~/ai-dev && git fetch --all && git checkout feature/new-project-command && git pull; else git clone --branch feature/new-project-command https://github.com/jeremylongshore/vibe-prd.git ~/ai-dev && cd ~/ai-dev; fi
2. Verify Node 18+: node -v
3. Write ~/.claude/commands/new-project.md using docs/claude_commands/new-project.md from this repo.
4. Run: node scripts/test-new-project.mjs
5. Tell the user: "Ready. Type /new-project to begin."
```

**Notes:**
- Always read templates from `~/ai-dev/professional-templates/`
- Write output docs to `~/ai-dev/completed-docs/<project>`

---

## How It Works

### Step 1: User Pastes Into Claude Code
User copies the above commands and pastes into any Claude Code chat session.

### Step 2: Claude Installs Everything
Claude automatically:
- Clones or updates the vibe-prd repo to `~/ai-dev`
- Switches to the `feature/new-project-command` branch
- Installs the `/new-project` command to their Claude CLI
- Tests the installation
- Confirms readiness

### Step 3: User Types `/new-project`
From any directory, user can now type `/new-project` and get:
- Intelligent conversation about their project
- Automatic classification (Greenfield/Brownfield, MVP/Standard/Enterprise)
- Professional documentation generated in `~/ai-dev/completed-docs/<project-name>/`

---

## What Gets Generated

### MVP Tier (4 documents)
- Product Requirements Document
- Implementation Task Breakdown
- Project Brief & Charter
- Brainstorming & Ideation

### Standard Tier (12 documents)
- All MVP documents plus:
- Architecture Decision Record
- Market Research & Analysis
- User Personas & Profiles
- User Journey Mapping
- User Story Templates
- Acceptance Criteria Definition
- Frontend Technical Specification
- Testing Strategy & Plan

### Enterprise Tier (22 documents)
- Complete professional template library
- Full compliance and audit-ready documentation
- Comprehensive cross-references and navigation

---

## User Experience

```
User: /new-project

Claude: What project are you working on? Tell me as much or as little as you'd like about your idea, feature, or system.

User: I want to build a fitness tracking app for runners

Claude: I can see you're starting a consumer fitness app from scratch - exciting! This sounds perfect for our MVP documentation approach. I'll generate 4 essential documents to help you validate and plan your idea. This should take about 3-5 minutes. Ready to start?

[Documents generate automatically in ~/ai-dev/completed-docs/fitness-tracking-app/]

Claude: ✅ Documentation Generation Complete!
📁 Location: ~/ai-dev/completed-docs/fitness-tracking-app/
📋 Generated: 4 professional documents (MVP tier)
🎯 Classification: Greenfield + MVP
```

---

**This creates the ultimate user experience: One paste → Full AI documentation system installed and ready!**