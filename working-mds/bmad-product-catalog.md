# BMAD-METHOD Product Catalog
**Generated:** 2025-09-16
**Repository:** https://github.com/bmad-code-org/BMAD-METHOD.git
**Commit:** f09e282
**Analysis Scope:** Complete framework inventory and output mapping

---

## 🎯 High-Level Overview

BMAD-METHOD™ is a comprehensive AI-driven agile development methodology that orchestrates specialized AI agents through structured workflows to produce professional software documentation and guide development processes. The framework operates through a web-based planning phase followed by IDE-based development, generating standardized artifacts in `docs/` directories throughout the project lifecycle.

---

## 🤖 Agents Table

| Agent | Purpose | Inputs | Outputs | Key Parameters |
|-------|---------|---------|---------|----------------|
| **bmad-orchestrator** | Heavy-duty workflow coordination and agent morphing | User requirements, project context | Workflow guidance, agent transitions | `mode: primary`, context-heavy |
| **analyst** | Requirements analysis and business logic definition | Business requirements, user needs | Analysis documents, requirement specs | Analytical depth settings |
| **architect** | System architecture and technical design | Requirements, constraints, technology stack | `docs/architecture.md`, design docs | Architecture patterns, scalability |
| **pm** | Project management and planning coordination | Project scope, timelines, resources | Project plans, milestone tracking | Planning methodologies |
| **po** | Product ownership and requirement validation | User stories, business goals | Product backlogs, acceptance criteria | Product vision alignment |
| **dev** | Development guidance and code structure | Architecture specs, user stories | Development guidelines, code structure | Technology-specific patterns |
| **qa** | Quality assurance and testing strategy | Requirements, architecture | Test plans, QA gates, validation criteria | Testing frameworks, coverage |
| **sm** | Scrum master and process facilitation | Team dynamics, project status | Process improvements, meeting facilitation | Agile methodologies |
| **ux-expert** | User experience and interface design | User requirements, usability goals | UX specifications, design guidelines | Design systems, accessibility |
| **bmad-master** | Framework expertise and methodology guidance | BMAD process questions | Best practices, framework usage | BMAD methodology depth |

---

## 📋 Workflows Table

| File | Trigger | Stages | Outputs | Write Path |
|------|---------|--------|---------|-----------|
| **greenfield-fullstack.yaml** | New full-stack project | Planning → Architecture → Validation | Complete project documentation set | `docs/` directory |
| **greenfield-service.yaml** | New service/API project | Service planning → API design → Validation | Service documentation, API specs | `docs/` directory |
| **greenfield-ui.yaml** | New UI/frontend project | UI planning → Design → Validation | UI specifications, design docs | `docs/` directory |
| **brownfield-fullstack.yaml** | Existing full-stack enhancement | Analysis → Integration planning → Validation | Integration docs, safety analysis | `docs/` directory |
| **brownfield-service.yaml** | Existing service modification | Service analysis → Change planning → Validation | Change documentation, impact analysis | `docs/` directory |
| **brownfield-ui.yaml** | Existing UI enhancement | UI analysis → Enhancement planning → Validation | UI change docs, integration safety | `docs/` directory |

---

## 📄 Templates/Prompts Table

| File | Purpose | Used By |
|------|---------|---------|
| **prd-tmpl.yaml** | Product Requirements Document generation | po, analyst |
| **architecture-tmpl.yaml** | System architecture documentation | architect |
| **project-brief-tmpl.yaml** | Initial project scoping and context | pm, po |
| **story-tmpl.yaml** | User story creation and management | po, dev |
| **qa-gate-tmpl.yaml** | Quality validation checkpoints | qa |
| **market-research-tmpl.yaml** | Market analysis and competitive research | analyst |
| **competitor-analysis-tmpl.yaml** | Competitive landscape analysis | analyst |
| **front-end-spec-tmpl.yaml** | Frontend technical specifications | ux-expert, architect |
| **front-end-architecture-tmpl.yaml** | Frontend architecture design | architect |
| **fullstack-architecture-tmpl.yaml** | Complete system architecture | architect |
| **brownfield-architecture-tmpl.yaml** | Existing system integration architecture | architect |
| **brownfield-prd-tmpl.yaml** | Product requirements for existing systems | po, analyst |
| **brainstorming-output-tmpl.yaml** | Structured brainstorming capture | All agents |

---

## 📦 Produced Artifacts Table

| Filename/Pattern | Content Description | When Produced | Path |
|------------------|---------------------|---------------|------|
| **docs/prd.md** | Product Requirements Document | During planning phase | Project root |
| **docs/architecture.md** | System architecture documentation | After architecture phase | Project root |
| **docs/project-brief.md** | Initial project context and scope | Project initiation | Project root |
| **docs/user-stories.md** | Comprehensive user story collection | Requirements phase | Project root |
| **docs/qa-gates.md** | Quality validation checkpoints | QA planning | Project root |
| **docs/market-research.md** | Market analysis report | Business analysis | Project root |
| **docs/competitive-analysis.md** | Competitor landscape study | Market research | Project root |
| **docs/frontend-spec.md** | Frontend technical requirements | UI planning | Project root |
| **docs/api-spec.md** | API design and documentation | Service planning | Project root |
| **dist/agents/*.txt** | Web bundle agent configurations | Build process | Framework distribution |
| **dist/teams/*.txt** | Team workflow bundles | Build process | Framework distribution |
| **dist/expansion-packs/*.txt** | Domain-specific extensions | Build process | Framework distribution |

---

## 🔄 Input→Output Dataflow Diagram

```
User Input (Project Context)
    ↓
[bmad-orchestrator] ← Workflow Selection
    ↓
Workflow YAML (greenfield/brownfield + type)
    ↓
┌─────────────────────────────────────────┐
│ Planning Phase (Web UI)                 │
│                                         │
│ [analyst] → Requirements Analysis       │
│     ↓                                   │
│ [po] → Product Requirements             │
│     ↓                                   │
│ [architect] → System Design             │
│     ↓                                   │
│ [ux-expert] → UI/UX Specifications     │
│     ↓                                   │
│ [qa] → Testing Strategy                 │
│     ↓                                   │
│ [pm] → Project Planning                 │
└─────────────────────────────────────────┘
    ↓
Artifact Validation (all_artifacts)
    ↓
┌─────────────────────────────────────────┐
│ Output Generation                       │
│                                         │
│ Template YAML + Agent Data              │
│     ↓                                   │
│ Structured Documents                    │
│     ↓                                   │
│ docs/ Directory Population              │
│   • prd.md                             │
│   • architecture.md                    │
│   • user-stories.md                    │
│   • qa-gates.md                        │
│   • [other artifacts]                  │
└─────────────────────────────────────────┘
    ↓
IDE Phase Handoff (Development)
    ↓
[dev] + [sm] → Implementation Guidance
```

---

## 🚀 How to Run (Local)

### Prerequisites
```bash
cd ~/ai-dev/bmad
npm install  # Install dependencies
```

### Core Commands
```bash
# Build Framework (Web Bundles)
npm run build                    # Build all agents and teams
npm run build:agents            # Build only agent bundles
npm run build:teams             # Build only team bundles

# Framework Management
npm run validate                 # Validate configurations
npm run list:agents             # List available agents
node tools/cli.js list:expansions  # List expansion packs

# Development Tools
npm run lint                    # Code quality checks
npm run format                  # Code formatting
npm run pre-release            # Full validation pipeline
```

### Workflow Execution
**Note:** BMAD workflows are designed for web UI environments, not direct CLI execution. The framework builds web bundles for browser-based orchestration.

```bash
# Web Bundle Generation (for hosting)
npm run build  # Creates dist/ directory with web-ready agent bundles
```

---

## 📊 Gaps vs Our 22 Templates

### Where BMAD Stops
- **No Direct Template Filling**: BMAD provides YAML templates but requires web UI for interactive generation
- **Limited Standalone Documents**: Focuses on workflow-driven documentation rather than individual template creation
- **Web-Dependent**: Requires web hosting infrastructure for full functionality
- **Complex Setup**: Multi-hour setup vs. our 5-minute Docker approach

### What We Add
- **Instant Template Generation**: Direct markdown output without web infrastructure
- **BMAD Analysis Integration**: Our `make prd` combines BMAD analysis with template filling
- **Standalone Operation**: Works via simple `make` commands in any environment
- **Professional Template Library**: 22+ immediate-use templates vs. BMAD's workflow-gated approach
- **Rapid Prototyping**: Quick document generation for fast iteration

### Complementary Strengths
| Aspect | BMAD-METHOD™ | Our AI-Dev Toolkit | Combined Value |
|--------|--------------|-------------------|----------------|
| **Depth** | Enterprise methodology | Professional templates | Deep analysis + quick output |
| **Speed** | Hours to setup | Minutes to run | Choose appropriate tool |
| **Scope** | Complete development lifecycle | Documentation focused | Full project coverage |
| **Complexity** | High (agents, workflows, web UI) | Low (Docker, make commands) | Scalable complexity |

---

## 💡 Recommendations: Integration Hooks

### 1. Key JSON Fields to Capture
Based on BMAD template analysis, we should enhance our form input to capture:

```json
{
  "project_context": {
    "project_name": "string",
    "project_type": "greenfield|brownfield",
    "scope": "fullstack|service|ui",
    "technology_stack": "array",
    "target_users": "array",
    "business_goals": "array"
  },
  "requirements": {
    "functional_requirements": "array",
    "non_functional_requirements": "object",
    "constraints": "array",
    "success_metrics": "array"
  },
  "architecture": {
    "architecture_pattern": "string",
    "data_model": "object",
    "api_design": "object",
    "security_requirements": "array"
  },
  "quality": {
    "testing_strategy": "string",
    "qa_gates": "array",
    "compliance_requirements": "array"
  }
}
```

### 2. BMAD Output Fields We Should Tap
From BMAD's template YAML structure:
- **Template Metadata**: `id`, `version`, `output.filename` for consistent naming
- **Section Structure**: `sections[].id`, `sections[].title` for organized content
- **Workflow Context**: `workflow.mode`, `workflow.elicitation` for appropriate depth
- **Dependencies**: Template interdependencies for proper ordering

### 3. Enhanced Form System Integration
**Current**: Basic form → BMAD analysis → template filling
**Enhanced**: Structured form → BMAD analysis + JSON extraction → enriched template filling

```bash
# Enhanced workflow
make ai-dev     # Capture structured project context (JSON)
make prd        # BMAD analysis + JSON-enhanced template population
make validate   # Verify completeness and consistency
```

### 4. Template Enrichment Strategy
- **Phase 1**: Extract JSON from BMAD analysis output
- **Phase 2**: Map BMAD fields to our template variables
- **Phase 3**: Enhance templates with conditional sections based on project type
- **Phase 4**: Add cross-template consistency checks

---

## 🎯 Strategic Integration Summary

### What BMAD Actually Produces
BMAD produces **comprehensive project documentation ecosystems** through agent-orchestrated workflows. Core outputs include structured markdown files (`docs/prd.md`, `docs/architecture.md`, etc.) generated via YAML templates and web-based agent interactions. The framework specializes in **methodology-driven documentation** with deep business analysis, architectural design, and quality validation.

### Concrete Artifact Names/Paths
- `docs/prd.md` - Product Requirements Document
- `docs/architecture.md` - System Architecture
- `docs/project-brief.md` - Project Context
- `docs/user-stories.md` - User Story Collection
- `docs/qa-gates.md` - Quality Checkpoints
- `docs/competitive-analysis.md` - Market Research
- `dist/agents/*.txt` - Web bundle agent configurations
- `dist/teams/*.txt` - Team workflow bundles

### Key JSON Structures for Template Enhancement
1. **Project Context**: `project_name`, `project_type`, `scope`, `technology_stack`
2. **Requirements Structure**: `functional_requirements`, `non_functional_requirements`, `constraints`
3. **Architecture Metadata**: `architecture_pattern`, `data_model`, `api_design`
4. **Quality Framework**: `testing_strategy`, `qa_gates`, `compliance_requirements`
5. **Template Dependencies**: `sections[].id`, `workflow.mode`, cross-document relationships

---

## ✅ Deliverable Confirmation

### Files Created
- **~/ai-dev/working-mds/bmad-product-catalog.md** ✅ - This comprehensive analysis
- **~/ai-dev/working-mds/bmad-inventory.txt** ✅ - Complete raw inventory and structure

### Analysis Complete
- Repository structure cataloged (f09e282 commit)
- 10 agents documented with inputs/outputs
- 6 core workflows mapped to artifacts
- 13 template YAMLs analyzed for structure
- CLI commands and build system documented
- Integration recommendations provided with JSON field mapping

---
**End of BMAD Product Catalog**
**Generated:** 2025-09-16T16:00:00Z
**Location:** ~/ai-dev/working-mds/bmad-product-catalog.md