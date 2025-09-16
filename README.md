# 🧠 AI-Dev — One-Paste Claude Documentation Pipeline

![Templates Verified](https://img.shields.io/github/actions/workflow/status/jeremylongshore/vibe-prd/container-ci.yml?label=Templates%20Verified&style=for-the-badge&logo=github)
![Zero Dependencies](https://img.shields.io/badge/Dependencies-None-success?style=for-the-badge&logo=checkmarx)
![22 Enterprise Templates](https://img.shields.io/badge/Templates-22%20Enterprise-brightgreen?style=for-the-badge&logo=markdown)

**One prompt → Complete enterprise documentation suite.** No setup, no dependencies, just Claude Code.

## Quick Start

### ⚡ One-Paste Claude Prompt

Paste the block below into **Claude Code CLI** (running in your terminal), then answer with a 1–3 sentence summary when asked. Claude will do the rest and put everything in `completed-docs/<your-project>/`.

> **Copy from here ↓**

```
You are Claude Code, running in my terminal at `~/ai-dev`.
**Your mission:** Generate a complete set of enterprise docs from the 22 enhanced templates in `professional-templates/`, **without asking me follow-up questions** beyond the initial summary.

**Rules:**
- Work in `~/ai-dev`. No sudo. Don't modify `professional-templates/`.
- Use reasoning to fill gaps. If info is unknown, make a sensible assumption and mark it as `{Assumption: …}` in the doc.
- Output folder: `completed-docs/<project-slug>/`
- Create an `index.md` with a table of contents, brief project recap, and file list.

**Flow:**
1) Ask me once: "**What's your project about? (1–3 sentences)**"
2) Slugify the name → `<project-slug>`
3) For each template `01_*.md` → `22_*.md`:
   - Read template, generate project-specific content
   - Save to `completed-docs/<project-slug>/<same-name>.md`
4) Write `completed-docs/<project-slug>/index.md` summarizing the set
5) Print final report:
   - Location of folder
   - List of files generated
   - Any assumptions made

**Git (optional):**
When done, run:
```bash
git add completed-docs/
git commit -m "chore(output): generated docs for <project-name>"
```
```

> **Copy to here ↑**

### What Happens Next

1. **You paste the prompt** into Claude Code CLI
2. **Claude asks:** "What's your project about? (1–3 sentences)"
3. **You answer:** Something like "An iOS app for youth soccer training with gamification"
4. **Claude generates:** 22 professional documents tailored to your project
5. **You get:** A complete `completed-docs/your-project/` folder with enterprise-grade documentation

## What You Get (22 Enterprise Templates)

### Core Product Documents
- **01_prd.md** - Product Requirements Document
- **02_adr.md** - Architecture Decision Records
- **03_generate_tasks.md** - Implementation Task Breakdown
- **04_process_task_list.md** - Task Processing Workflow
- **05_market_research.md** - Market Analysis

### Technical Specifications
- **06_architecture.md** - System Architecture
- **07_competitor_analysis.md** - Competitive Analysis
- **08_personas.md** - User Personas
- **09_user_journeys.md** - User Journey Mapping
- **10_user_stories.md** - User Story Templates

### Quality & Testing
- **11_acceptance_criteria.md** - Acceptance Criteria
- **12_qa_gate.md** - Quality Assurance Gates
- **13_risk_register.md** - Risk Management
- **14_project_brief.md** - Project Overview
- **15_brainstorming.md** - Ideation Framework

### Development & Operations
- **16_frontend_spec.md** - Frontend Specifications
- **17_test_plan.md** - Testing Strategy
- **18_release_plan.md** - Release Planning
- **19_operational_readiness.md** - Operations Guide
- **20_metrics_dashboard.md** - Success Metrics

### Post-Launch
- **21_postmortem.md** - Incident Analysis
- **22_playtest_usability.md** - User Testing & Feedback

## Why This Works

### Before AI-Dev:
❌ Start with blank documents
❌ Google "how to write a PRD"
❌ Copy random templates
❌ Spend hours on structure
❌ End up with inconsistent docs

### With AI-Dev:
✅ **One prompt** → complete documentation suite
✅ **22 enterprise templates** pre-filled with your project
✅ **Professional structure** from day one
✅ **Consistent formatting** across all documents
✅ **Zero setup** or dependencies

## Who This Is For

- **Startup founders** needing investor-ready documentation
- **Product managers** wanting comprehensive project specs
- **Solo developers** building professional portfolios
- **Small teams** without dedicated technical writers
- **Anyone** tired of starting docs from scratch

## System Requirements

- **Claude Code CLI** (claude.ai/code)
- **Git** (optional, for committing outputs)
- **5 minutes** to paste and answer one question

That's it. No Docker, no dependencies, no configuration files.

## Example Output Structure

After running the one-paste prompt, you'll get:

```
completed-docs/
└── your-project-name/
    ├── index.md                    # Table of contents + overview
    ├── 01_prd.md                   # Product Requirements Document
    ├── 02_adr.md                   # Architecture Decisions
    ├── 03_generate_tasks.md        # Implementation Tasks
    ├── ...                         # All 22 templates
    └── 22_playtest_usability.md    # User Testing Framework
```

## Advanced Usage

### Repository Commands
```bash
make verify    # Check template integrity
make tree      # Show repository structure
make clean     # Clean output directories
```

### Template Library
Templates are stored in `professional-templates/` as read-only masters. Each template includes:
- Professional structure and sections
- Detailed guidance and examples
- Industry best practices
- Comprehensive coverage of the topic

### Contributing
1. Fork the repository
2. Enhance templates in `professional-templates/`
3. Test with the one-paste prompt
4. Submit pull request

## Example Projects

Perfect for documenting:
- **Mobile apps** - iOS/Android applications
- **Web platforms** - SaaS products and websites
- **APIs** - Backend services and integrations
- **Startups** - MVP to enterprise documentation
- **Open source** - Professional project documentation

---

**Stop starting from scratch. Get enterprise docs in one paste.**

**Repository:** https://github.com/jeremylongshore/vibe-prd
**Issues:** https://github.com/jeremylongshore/vibe-prd/issues