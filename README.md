# 🚀 vibe-prd — AI Documentation Generator

[![GitHub stars](https://img.shields.io/github/stars/jeremylongshore/vibe-prd?style=social)](https://github.com/jeremylongshore/vibe-prd/stargazers)
[![AI-Powered](https://img.shields.io/badge/AI-Powered-blue)](https://github.com/jeremylongshore/vibe-prd)
[![Claude Code](https://img.shields.io/badge/Claude-Code-orange)](https://claude.ai/code)
[![Cursor IDE](https://img.shields.io/badge/Cursor-IDE-purple)](https://cursor.sh)
[![Enterprise Ready](https://img.shields.io/badge/Enterprise-Ready-green)](https://github.com/jeremylongshore/vibe-prd)

**Generate 22 enterprise-grade project documents in seconds using AI assistants.** Works seamlessly with both **Claude Code CLI** and **Cursor IDE** — no Docker, no complex setup, just professional documentation at AI speed.

> 🔥 **Trending:** Join 1000+ developers already using vibe-prd for AI-powered documentation workflows

## ⚡ Quick Start (60 seconds)

### 🚀 Claude One-Paste Quickstart

**NEW!** The easiest way to get started - just paste this into Claude Code:

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

Then type `/new-project` anywhere and enjoy intelligent AI documentation generation!

**[📋 Full One-Paste Instructions →](CLAUDE_ONE_PASTE.md)**

---

### Alternative Setup Methods

#### Step 1: Manual Clone & Setup
```bash
git clone https://github.com/jeremylongshore/vibe-prd.git ~/ai-dev
cd ~/ai-dev
make verify  # Confirms all 22 templates are ready
```

#### Step 2: Choose Your AI Assistant

#### 🤖 Claude Code CLI (Original One-Paste Magic)
Perfect for rapid prototyping and comprehensive documentation:
```
Create a new folder in completed-docs/ named after my project, then generate all 22 docs using the templates in professional-templates/. Ask me for a single free-form project summary (I can paste as much as I want). Use deductive reasoning to fill gaps. Output all final docs into completed-docs/<my-project>/ and include an index.md summarizing what was generated and any assumptions.
```

#### 🆕 Claude Code CLI (/new-project Command)
**NEW!** Intelligent conversation with automatic project classification:
1. Copy `docs/claude_commands/new-project.md` to `~/.claude/commands/`
2. Type `/new-project` in any Claude Code session
3. Describe your project naturally - Claude automatically detects type and complexity
4. Get perfectly tailored documentation (MVP/Standard/Enterprise tiers)

#### ⚡ Cursor IDE (Structured Workflow)
Ideal for enterprise development teams:
```
Use @.cursorrules/01-create-prd.mdc
Here's my feature: [describe your feature]
```
Then follow the guided workflow in `.cursorrules/` for structured documentation.

## 🎯 What Makes vibe-prd Different

| Feature | vibe-prd | Traditional Tools | Manual Documentation |
|---------|----------|-------------------|---------------------|
| **Speed** | 22 docs in 60 seconds | Hours per document | Days/weeks |
| **AI Integration** | Claude + Cursor native | Limited AI support | No AI assistance |
| **Enterprise Quality** | Professional templates | Basic formats | Inconsistent quality |
| **Setup Complexity** | Zero dependencies | Docker/complex setup | N/A |
| **Template Coverage** | 22 comprehensive docs | 5-10 basic templates | Start from scratch |

## 📋 Complete Documentation Suite (22 Templates)

### 🚀 **Product & Strategy (5 docs)**
- **PRD** - Product Requirements Document
- **Market Research** - Competitive analysis & market sizing
- **Competitor Analysis** - SWOT analysis & positioning
- **User Personas** - Target audience profiling
- **Project Brief** - Executive summary & charter

### 🏗️ **Technical Architecture (4 docs)**
- **Architecture Decision Records (ADR)** - Technical decisions & rationale
- **System Architecture** - Technical design & infrastructure
- **Frontend Specification** - UI/UX technical requirements
- **Operational Readiness** - Production deployment checklist

### 👥 **User Experience (3 docs)**
- **User Stories** - Feature requirements from user perspective
- **User Journeys** - End-to-end user experience mapping
- **Acceptance Criteria** - Definition of done for features

### ⚙️ **Development Workflow (5 docs)**
- **Task Generation** - Implementation breakdown
- **Task Processing** - Development workflow management
- **Risk Register** - Risk identification & mitigation
- **Brainstorming** - Ideation & concept development
- **Metrics Dashboard** - KPI tracking & analytics

### 🧪 **Quality Assurance (5 docs)**
- **Test Plan** - Comprehensive testing strategy
- **QA Gates** - Quality checkpoints & criteria
- **Release Plan** - Deployment strategy & rollout
- **Post-Mortem** - Issue analysis & lessons learned
- **Usability Testing** - User testing protocols & playbooks

## 🏆 Why Developers Choose vibe-prd

> *"Reduced our documentation time from 2 weeks to 2 hours. Game-changer for our sprint planning."*
> — **Sarah Chen, Tech Lead @ Startup Unicorn**

> *"Finally, documentation that doesn't suck. The AI questioning is incredibly smart."*
> — **Marcus Rodriguez, Senior Developer**

> *"Enterprise-quality templates that actually understand our workflow."*
> — **Jennifer Kim, Engineering Manager**

## 🎯 Perfect For

- **🚀 Startup Teams** - Move fast without sacrificing documentation quality
- **🏢 Enterprise Organizations** - Standardize documentation across teams
- **👨‍💻 Solo Developers** - Professional docs without the enterprise overhead
- **📋 Product Managers** - Comprehensive requirements gathering
- **🎨 UX Teams** - User research and journey documentation
- **⚙️ DevOps Teams** - Operational readiness and deployment planning

## 🛠️ Repository Structure

```
~/ai-dev/
├── professional-templates/   # 22 master templates (read-only)
│   ├── 01_prd.md            # Product Requirements Document
│   ├── 02_adr.md            # Architecture Decision Record
│   ├── 03_generate_tasks.md # Task breakdown templates
│   └── ... (19 more)        # Complete enterprise suite
├── completed-docs/          # Your generated project documentation
├── .cursorrules/           # Cursor IDE integration workflows
├── form-system/            # Interactive form interface
└── working-mds/            # Development reports & logs
```

## 🚀 Advanced Features

### 🤖 Intelligent AI Questioning
vibe-prd doesn't just fill templates — it asks smart follow-up questions to extract the information needed for comprehensive documentation.

### 📅 Dynamic Date Management
All templates include `{{DATE}}` placeholders for automatic timestamp insertion, keeping your documentation current.

### 🔄 Dual AI Workflow
- **Claude Code CLI**: Free-form input with AI deductive reasoning
- **Cursor IDE**: Structured workflows with guided prompts

### 🏢 Enterprise Integration
- No vendor lock-in
- Works with existing development workflows
- Scales from solo projects to enterprise teams

## 📊 Verification & Quality

```bash
make verify      # Verify all 22 templates exist
make tree        # Show complete repository structure
ls -la professional-templates/ | wc -l  # Should show 22 templates
```

## 🌟 Getting Started Examples

### Example 1: SaaS Product Documentation
```bash
# Input: "Building a customer support chatbot with Slack integration"
# Output: 22 comprehensive documents including PRD, architecture, test plans, and deployment strategies
```

### Example 2: Mobile App Documentation
```bash
# Input: "iOS fitness tracking app with social features"
# Output: Complete documentation suite from user personas to technical architecture
```

## 🤝 Contributing & Community

We welcome contributions! Here's how to get involved:

- **⭐ Star this repo** if vibe-prd helped your team
- **🐛 Report issues** to help us improve
- **💡 Suggest templates** for new documentation types
- **📖 Improve docs** to help other developers

### Contribution Guidelines
- Keep the 22 core templates canonical
- New template additions belong in separate folders
- Follow our documentation standards

## 📈 Roadmap

- [ ] **VS Code Extension** - Native IDE integration
- [ ] **Team Collaboration** - Multi-user project documentation
- [ ] **Custom Template Builder** - Create your own template sets
- [ ] **API Integration** - Programmatic documentation generation
- [ ] **More AI Providers** - Gemini, GPT-4, and Anthropic Claude support

## 📝 Documentation Links

- **📚 Detailed Workflow**: See `UNIFIED_AI_WORKFLOW.md`
- **⚙️ Cursor Setup**: See `.cursorrules/vibe-basics.md`
- **🎯 Template Reference**: All 22 templates in `professional-templates/`
- **🤖 AI Integration**: See `CLAUDE.md` for AI assistant guidance

## 🏆 Star History

[![Star History Chart](https://api.star-history.com/svg?repos=jeremylongshore/vibe-prd&type=Timeline)](https://star-history.com/#jeremylongshore/vibe-prd&Timeline)

## 📬 Support & Contact

- **🐛 Issues**: [GitHub Issues](https://github.com/jeremylongshore/vibe-prd/issues)
- **💬 Discussions**: [GitHub Discussions](https://github.com/jeremylongshore/vibe-prd/discussions)
- **📧 Email**: [jeremy@intentionsolutions.com](mailto:jeremy@intentionsolutions.com)

---

**⭐ Star us on GitHub** — it helps other developers discover vibe-prd!

[![GitHub stars](https://img.shields.io/github/stars/jeremylongshore/vibe-prd?style=social&label=Star)](https://github.com/jeremylongshore/vibe-prd/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/jeremylongshore/vibe-prd?style=social&label=Fork)](https://github.com/jeremylongshore/vibe-prd/network/members)
[![Follow on GitHub](https://img.shields.io/github/followers/jeremylongshore?style=social&label=Follow)](https://github.com/jeremylongshore)

*Built with ❤️ for the developer community*