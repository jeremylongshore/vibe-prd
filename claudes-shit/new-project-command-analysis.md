# 🚀 /new-project Command: Intelligent Project Intake System

**Date:** 2025-09-18
**Status:** Design Phase - Awaiting Approval
**Purpose:** Create single command for comprehensive project documentation generation

## 📊 Current System Analysis

### Existing Workflow Patterns
**Current State:**
- **Dual AI Support:** Claude one-paste + Cursor structured workflows
- **Template Library:** 22 professional templates with {{DATE}} placeholders
- **Current Commands:** 4 separate commands (/create-prd, /create-adr, /generate-tasks, /process-tasks)
- **Form System:** Basic intake via form-system/cli.js (7 core questions)
- **Output Structure:** completed-docs/[project-name]/ directory

### Template Interconnection Map
**Core Foundation Flow:**
```
01_prd.md → 03_generate_tasks.md → 04_process_task_list.md
    ↓
02_adr.md (technical decisions)
    ↓
06_architecture.md (system design)
```

**Extended Documentation Web:**
- Business Layer: 05_market_research.md, 07_competitor_analysis.md, 08_personas.md
- User Experience: 09_user_journeys.md, 10_user_stories.md, 11_acceptance_criteria.md
- Quality & Risk: 12_qa_gate.md, 13_risk_register.md, 17_test_plan.md
- Operations: 18_release_plan.md, 19_operational_readiness.md, 20_metrics_dashboard.md

## 🎯 Designed Solution: /new-project Command

### Command Flow Architecture
```
/new-project
├── Starting Point Detection
│   ├── "I have an idea" → Greenfield Path (validate concept)
│   └── "I have existing product/system" → Brownfield Path (build on foundation)
├── Documentation Scope Selection
│   ├── "Foundation (4 docs)" → Quick Flow
│   └── "Comprehensive (22 docs)" → Deep Interview
├── Target Audience Calibration
│   ├── "Startup" → Lean templates
│   ├── "Existing Business" → Standard depth
│   └── "Enterprise" → Full compliance
└── Intelligent Question Flow → Document Generation
```

### Question Flow Design

#### **Phase 1: Project Classification (3 questions)**
1. **Starting Point:** "Are you: (A) Starting with an idea (Greenfield - new concept), (B) Building on existing product/system (Brownfield - enhancement)?"
2. **Target Audience:** "Primary audience: (A) Startup (lean/agile), (B) Existing Business (standard), (C) Enterprise (compliance-heavy)?"
3. **Documentation Scope:** "Generate: (A) Foundation docs (4 core - 5 min), (B) Comprehensive suite (22 docs - 15 min)?"

#### **Phase 2A: Foundation Flow (Quick - 5-7 questions)**
**For 4 Core Documents:**
1. **Vision:** "In 2-3 sentences, what are you building and why now?"
2. **Users:** "Who is your target user and what's their #1 pain point?"
3. **Success:** "How will you measure success in 3 months?"
4. **Constraints:** "Top 2 technical or business constraints?"
5. **Timeline:** "Target launch timeframe?"
6. **Dependencies:** "Any critical integrations or dependencies?"
7. **Open-ended:** "Tell me everything else about this project that would help me create comprehensive documentation..."

#### **Phase 2B: Comprehensive Flow (Deep Interview)**
**Sequential Template Interviews:**
- **Business Foundation** (5 templates): Market research, competitive analysis, personas, user journeys, business metrics
- **Product Definition** (4 templates): PRD, user stories, acceptance criteria, brainstorming
- **Technical Architecture** (5 templates): ADR, architecture, frontend spec, infrastructure, security
- **Project Management** (4 templates): Task generation, risk register, project brief, operational readiness
- **Quality & Launch** (4 templates): QA gates, test plan, release plan, metrics dashboard

### Smart Question Adaptation by Audience

#### **Startup Questions (Lean Focus)**
- "What's your minimum viable feature set?"
- "How quickly do you need to validate this with users?"
- "What's your burn rate constraint?"

#### **Existing Business Questions (Integration Focus)**
- "How does this fit with current product roadmap?"
- "What existing systems need integration?"
- "How will this impact current users?"

#### **Enterprise Questions (Compliance Focus)**
- "What compliance requirements apply (SOX, GDPR, HIPAA)?"
- "Security and audit requirements?"
- "Change management and rollout strategy?"

## 🛠 Technical Implementation Plan

### Command Structure
```bash
# Command location: /home/jeremy/.claude/commands/new-project.md

# Flow:
1. Read project classification questions
2. Branch to appropriate question set
3. Collect responses with smart follow-ups
4. Generate selected template set
5. Create project folder at user-specified location
6. Display table of contents summary
```

### Output Directory Structure
```
[user-specified-location]/[project-name]/
├── index.md                          # Project summary & TOC
├── 01_prd.md                         # Product Requirements
├── 02_adr.md                         # Architecture Decisions
├── 03_generate_tasks.md              # Task Breakdown
├── 04_process_task_list.md           # Task Management
└── [additional templates if comprehensive selected]
```

### Smart Follow-up Logic
```
IF response_length < 10_words:
    → Ask clarifying follow-up
IF mentions_technical_terms:
    → Ask about technical constraints
IF mentions_users/customers:
    → Ask about user research/validation
IF mentions_timeline:
    → Ask about dependencies/risks
```

## 📋 Integration with Existing System

### Preserving Current Workflows
- **Keep existing commands** (/create-prd, etc.) for individual template generation
- **Enhance form-system** for structured data collection
- **Maintain dual AI support** (Claude + Cursor workflows)

### New Command Features
- **Project folder creation** at user-specified location
- **Template cross-referencing** with proper metadata
- **Date stamping** with {{DATE}} replacement
- **Smart questioning** based on responses
- **Audience-specific templates** for different business contexts

## 🎯 Command Behavior Examples

### Example 1: Startup MVP (Foundation)
```
User: /new-project
Claude: (A) New product, (A) Startup, (A) Foundation docs
Questions: 7 quick questions about MVP concept
Output: 4 docs in ~/projects/my-saas-mvp/
Summary: "Generated foundation docs for SaaS MVP targeting small businesses"
```

### Example 2: Enterprise Feature (Comprehensive)
```
User: /new-project
Claude: (B) Feature update, (C) Enterprise, (B) Comprehensive
Questions: Deep interview across all 22 template categories
Output: 22 docs in ~/enterprise-projects/user-analytics-feature/
Summary: "Generated comprehensive documentation suite for enterprise analytics feature"
```

## 🔄 Next Steps for Implementation

### Phase 1: Command Creation
1. Create `/home/jeremy/.claude/commands/new-project.md`
2. Implement question branching logic
3. Add smart follow-up capabilities
4. Test with sample projects

### Phase 2: Template Enhancement
1. Create audience-specific variations (startup/business/enterprise)
2. Add MVP template category
3. Enhance template cross-references
4. Add question guidance within templates

### Phase 3: Repository Integration
1. Document new workflow in README.md
2. Update CLAUDE.md with new command
3. Create examples in completed-docs/
4. Add to public repo as premium feature

## 💡 Value Proposition

**Before:**
- Manual question formulation
- Multiple separate commands
- Inconsistent documentation depth
- No audience-specific guidance

**After:**
- Single intelligent intake command
- Smart question adaptation
- Consistent comprehensive documentation
- Audience-appropriate depth and focus
- Automatic project structure creation

---

## ✅ Ready for Implementation

This design provides:
- **Single command** solving the "too many commands" problem
- **Intelligent questioning** solving the "don't know what to ask" problem
- **Audience adaptation** for different business contexts
- **Flexible scope** (4 foundation vs 22 comprehensive)
- **Integration** with existing successful workflows

**Awaiting approval to proceed with implementation.**