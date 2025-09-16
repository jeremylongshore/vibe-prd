# Template Output 1 - Source Template Guidelines
**Generated:** 2025-09-16
**Purpose:** Master source templates that guide AI to create professional documentation
**Location:** ~/ai-dev/professional-templates/

---

# 🎯 OVERVIEW OF SOURCE TEMPLATES

This document contains all 44 source template files that serve as guidelines for AI assistants to generate professional documentation. These are the "master blueprints" that get filled with project data to create the output documents.

## 📊 Template Categories

### 📚 Foundation Templates (3)
- `README.md` - Complete toolkit overview and usage guide
- `DOCUMENT_GUIDE.md` - Detailed guide on when/how to use each document type
- `AI_ATTRIBUTION.md` - Transparency about AI-assisted development

### 🎯 Simple Fill Templates (22)
*These are the templates that got filled with project data in test-output-00.md*
- Small templates with placeholders like `{{project.overview}}`
- Auto-filled by BMAD workflow with project context

### 🚀 Complex Creation Templates (19)
*These are comprehensive guides for AI to create complex documents*
- Multi-page prompts with structured questions
- Industry-standard templates with detailed sections

---

# 📚 FOUNDATION TEMPLATES

## 1. README.md - Toolkit Overview
*Complete guide to the AI Dev Tasks Professional Documentation Toolkit*

```markdown
# 🚀 AI Dev Tasks: Professional Documentation Toolkit 🤖

Welcome to the **AI Dev Tasks Professional Documentation Toolkit**! This comprehensive collection of LLM-optimized templates transforms AI assistants into expert documentation specialists. Every template is crafted to extract maximum value from AI interactions through structured prompts, clarifying questions, and version control integration.

## 🙏 Credits

The original PRD template, ADR template, and task generation concepts were inspired by and adapted from [stulogy's vibe-prd](https://github.com/stulogy/vibe-prd) repository. This toolkit expands on those foundations to create a comprehensive documentation suite with 16 professional templates.

Stop wrestling with vague AI responses and start generating professional-grade documentation that meets industry standards!

## ✨ The Core Philosophy

Professional software development requires comprehensive documentation at every phase. This toolkit ensures that AI assistants:

1. **Ask the Right Questions:** Structured clarifying questions ensure completeness
2. **Follow Industry Standards:** Templates based on real-world professional practices
3. **Maintain Version Control:** Built-in Git integration for tracking changes
4. **Enforce Quality:** Required sections and validation checks
5. **Save Time:** Consistent format across all projects

## 📚 Complete Documentation Lifecycle

### Phase 1: Planning Documents
- **PRD** (Product Requirements Document) - Define what to build
- **BRD** (Business Requirements Document) - Capture business needs
- **RFC** (Request for Comments) - Propose major changes
- **Tech Spec** - Detailed implementation blueprint

### Phase 2: Design Documents
- **Design Doc** - System architecture and design
- **API Spec** - OpenAPI/Swagger specifications
- **Database Schema** - Data models and relationships
- **C4 Model** - Architecture visualization

### Phase 3: Development Documents
- **User Stories** - Agile requirements
- **Test Plans** - Testing strategy and cases
- **Task Lists** - Detailed implementation tasks

### Phase 4: Operations Documents
- **Runbook** - Operational procedures
- **Post-Mortem** - Incident analysis
- **SOP** - Standard operating procedures

### Phase 5: Architecture Documents
- **ADR** (Architecture Decision Record) - Document decisions
- **Solution Architecture** - Complete solution design

### Phase 6: Project Management
- **Project Charter** - Project initiation
- **RACI Matrix** - Responsibility assignment
- **Risk Register** - Risk tracking

[... Complete README content ...]
```

## 2. AI_ATTRIBUTION.md - AI Transparency
*Full disclosure about AI-assisted development*

```markdown
# AI Attribution & Transparency

## Full Disclosure

This Professional Documentation Toolkit was created entirely through AI-assisted development using Claude (Anthropic). We believe in complete transparency about AI usage in software development.

## What Was AI-Generated

- ✅ **100% of template content** - All 16 documentation templates
- ✅ **All code examples** - Every code snippet and example
- ✅ **Documentation structure** - README, guides, and organization
- ✅ **Git integration commands** - Version control workflows
- ✅ **Clarifying questions** - LLM-optimized prompts
- ✅ **Industry standards references** - IEEE, ISO, Agile frameworks

## Development Process

1. **Human provided:** Requirements and vision
2. **AI generated:** Complete implementation
3. **Human reviewed:** Quality and accuracy
4. **AI refined:** Based on feedback

[... Complete attribution content ...]
```

---

# 🎯 SIMPLE FILL TEMPLATES (22)

*These templates contain placeholders that get auto-filled with project data*

## Template Structure Pattern:
```markdown
# [Document Type]

## Project Context
{{project.overview}}

## Goals & Constraints
Goals: {{project.goals}}
Constraints: {{project.constraints}}

## Risk Considerations
{{project.risks}}

## Success Criteria
{{project.acceptance}}

## Template Content
*This [template-name] template has been generated and filled with project context. Customize the sections below based on your specific [template-name] requirements.*
```

### List of 22 Simple Fill Templates:
1. `prd.md` - Product Requirements Document (enhanced)
2. `architecture.md` - System Architecture
3. `api-design.md` - API Design
4. `competitive-analysis.md` - Competitive Analysis
5. `compliance-plan.md` - Compliance Plan
6. `data-model.md` - Data Model
7. `deployment-plan.md` - Deployment Plan
8. `faq.md` - FAQ
9. `implementation-plan.md` - Implementation Plan
10. `infra-diagram.md` - Infrastructure Diagram
11. `metrics-kpis.md` - Metrics & KPIs
12. `ops-runbook.md` - Operations Runbook
13. `personas.md` - User Personas
14. `postmortem-template.md` - Post-mortem Template
15. `release-plan.md` - Release Plan
16. `requirements-traceability.md` - Requirements Traceability
17. `risk-register.md` - Risk Register
18. `roadmap.md` - Product Roadmap
19. `sdlc-checklist.md` - SDLC Checklist
20. `security-review.md` - Security Review
21. `test-plan.md` - Test Plan
22. `user-stories.md` - User Stories

### Special Template: `prd.md` (Enhanced)
*This one has more structure than the others*

```markdown
# Product Requirements Document

## Project Overview
{{project.overview}}

## Target Users
{{project.target_users}}

## Value Proposition
{{project.value_prop}}

## Goals
{{project.goals}}

## Constraints
{{project.constraints}}

## Compliance Requirements
{{project.compliance}}

## Risk Assessment
{{project.risks}}

## Key Assumptions
{{project.assumptions}}

## Success Criteria
{{project.acceptance}}
```

---

# 🚀 COMPLEX CREATION TEMPLATES (19)

*These are comprehensive AI guides for creating professional documents*

## 1. create-prd.md - Product Requirements Document Creator
*4,000 character comprehensive PRD generation guide*

```markdown
# Rule: Creating Product Requirements Documents (PRDs)

## Goal

To guide an AI assistant in creating comprehensive Product Requirements Documents that capture all necessary information for successful feature development.

## Process

1. **Receive Initial Request:** User provides basic feature description.
2. **Ask Clarifying Questions:** AI *must* ask these structured questions.
3. **Generate Complete PRD:** Create detailed PRD using the provided template.
4. **Save PRD:** Save as `prd-[feature-name].md` in `/tasks/`.
5. **Generate Task List:** Offer to create implementation tasks.

## Required Clarifying Questions

When a user asks to create a PRD, the AI *must* ask these questions to ensure completeness:

### **Feature Definition**
1. What is the core problem this feature solves?
2. Who is the primary target user for this feature?
3. What is the desired user outcome or benefit?
4. How does this align with overall product strategy?

### **Scope & Requirements**
5. What are the must-have vs nice-to-have requirements?
6. What existing features or systems will this integrate with?
7. Are there any technical constraints or limitations?
8. What platforms or environments need to be supported?

### **Success Metrics**
9. How will we measure if this feature is successful?
10. What are the key performance indicators (KPIs)?
11. What is the expected impact on user engagement/retention?
12. Are there any business metrics this should drive?

### **Resources & Timeline**
13. What is the desired timeline for this feature?
14. Are there any dependencies on other teams or features?
15. What is the approximate development effort (story points/weeks)?
16. Who are the key stakeholders and decision makers?

### **Edge Cases & Considerations**
17. What are potential edge cases or error scenarios?
18. Are there any accessibility requirements?
19. What are the security and privacy considerations?
20. How should this behave on different devices/screen sizes?

[... Complete PRD creation guide continues ...]
```

## 2. create-brd.md - Business Requirements Document Creator
*8,100 character comprehensive BRD generation guide*

```markdown
# Rule: Creating Business Requirements Documents (BRDs)

## Goal

To guide an AI assistant in creating comprehensive Business Requirements Documents that capture business objectives, stakeholder needs, and success criteria for projects and initiatives.

## Process

1. **Receive Business Request:** User provides business initiative description.
2. **Ask Business Questions:** AI *must* understand business context and objectives.
3. **Generate Complete BRD:** Create detailed BRD with all necessary sections.
4. **Save BRD:** Save as `brd-[initiative-name].md` in `/tasks/`.
5. **Create Tracking:** Generate tracking file for status updates.

[... Complete BRD creation guide continues ...]
```

## 3. create-tech-spec.md - Technical Specification Creator
*10,200 character comprehensive technical specification guide*

```markdown
# Rule: Creating Technical Specifications

## Goal

To guide an AI assistant in creating comprehensive technical specifications that provide detailed implementation guidance for development teams.

## Process

1. **Receive Technical Request:** User provides feature or system description.
2. **Ask Technical Questions:** AI *must* understand technical requirements and constraints.
3. **Generate Complete Tech Spec:** Create detailed specification with architecture, APIs, and implementation plan.
4. **Save Tech Spec:** Save as `tech-spec-[feature].md` in `/tasks/`.
5. **Generate Implementation Tasks:** Offer to break down into development tasks.

[... Complete Tech Spec creation guide continues ...]
```

## 4. create-design-doc.md - Design Document Creator
*11,500 character comprehensive design documentation guide*

```markdown
# Rule: Creating Design Documents

## Goal

To guide an AI assistant in creating comprehensive design documents that capture system architecture, component design, and technical decisions for software projects.

## Process

1. **Receive Design Request:** User provides system or feature description.
2. **Ask Design Questions:** AI *must* understand architectural requirements and constraints.
3. **Generate Complete Design Doc:** Create detailed design with architecture diagrams and component specifications.
4. **Save Design Doc:** Save as `design-doc-[system].md` in `/tasks/`.
5. **Generate Related Docs:** Offer to create ADRs for major decisions.

[... Complete Design Doc creation guide continues ...]
```

## 5. create-api-spec.md - API Specification Creator
*15,700 character comprehensive API documentation guide*

```markdown
# Rule: Generating API Specifications

## Goal

To guide an AI assistant in creating comprehensive API specifications that clearly document endpoints, data models, authentication, and integration requirements for development teams.

## Process

1. **Receive API Description:** User provides API requirements.
2. **Ask API Design Questions:** AI *must* understand the API purpose and constraints.
3. **Generate API Spec:** Create detailed OpenAPI/Swagger documentation.
4. **Save API Spec:** Save as `api-spec-[service].md` and `openapi-[service].yaml` in `/tasks/`.
5. **Generate Examples:** Include request/response examples and SDKs.

[... Complete API Spec creation guide continues ...]
```

## 6. create-database-schema.md - Database Schema Creator
*21,000 character comprehensive database design guide*

```markdown
# Rule: Creating Database Schemas

## Goal

To guide an AI assistant in creating comprehensive database schemas that capture data models, relationships, constraints, and optimization requirements for applications.

## Process

1. **Receive Data Requirements:** User provides application data needs.
2. **Ask Database Questions:** AI *must* understand data relationships and constraints.
3. **Generate Schema Design:** Create detailed ERD and schema documentation.
4. **Save Schema:** Save as `schema-[database].md` and `schema.sql` in `/tasks/`.
5. **Generate Migrations:** Create migration scripts and seed data.

[... Complete Database Schema creation guide continues ...]
```

## 7. create-user-story.md - User Story Creator
*9,600 character comprehensive user story guide*

```markdown
# Rule: Creating User Stories

## Goal

To guide an AI assistant in creating comprehensive user stories that capture user needs, acceptance criteria, and implementation guidance for agile development teams.

## Process

1. **Receive Story Request:** User provides feature or user need description.
2. **Ask Story Questions:** AI *must* understand user context and requirements.
3. **Generate User Stories:** Create detailed stories with acceptance criteria.
4. **Save Stories:** Save as `user-stories-[epic].md` in `/tasks/`.
5. **Generate Tasks:** Offer to break stories into development tasks.

[... Complete User Story creation guide continues ...]
```

## 8. create-test-plan.md - Test Plan Creator
*12,200 character comprehensive testing guide*

```markdown
# Rule: Creating Test Plans

## Goal

To guide an AI assistant in creating comprehensive test plans that define testing strategies, test cases, and quality assurance procedures for software projects.

## Process

1. **Receive Testing Request:** User provides feature or system to test.
2. **Ask Testing Questions:** AI *must* understand testing scope and requirements.
3. **Generate Test Plan:** Create detailed testing strategy and test cases.
4. **Save Test Plan:** Save as `test-plan-[feature].md` in `/tasks/`.
5. **Generate Test Cases:** Create executable test cases and automation scripts.

[... Complete Test Plan creation guide continues ...]
```

## 9. create-runbook.md - Runbook Creator
*13,800 character comprehensive operations guide*

```markdown
# Rule: Creating Operations Runbooks

## Goal

To guide an AI assistant in creating comprehensive operations runbooks that document deployment, monitoring, troubleshooting, and maintenance procedures for production systems.

## Process

1. **Receive Operations Request:** User provides system or service description.
2. **Ask Operations Questions:** AI *must* understand operational requirements and procedures.
3. **Generate Runbook:** Create detailed operational documentation.
4. **Save Runbook:** Save as `runbook-[service].md` in `/tasks/`.
5. **Generate Procedures:** Create specific operational procedures and checklists.

[... Complete Runbook creation guide continues ...]
```

## 10. create-post-mortem.md - Post-mortem Creator
*9,800 character comprehensive incident analysis guide*

```markdown
# Rule: Creating Post-Mortem Documents

## Goal

To guide an AI assistant in creating comprehensive post-mortem documents that analyze incidents, identify root causes, and establish preventive measures for future incidents.

## Process

1. **Receive Incident Description:** User provides incident details.
2. **Ask Post-Mortem Questions:** AI *must* understand incident timeline and impact.
3. **Generate Post-Mortem:** Create detailed incident analysis and action items.
4. **Save Post-Mortem:** Save as `post-mortem-[incident-date].md` in `/tasks/`.
5. **Track Action Items:** Create tracking for remediation tasks.

[... Complete Post-mortem creation guide continues ...]
```

## 11. create-sop.md - Standard Operating Procedure Creator
*11,600 character comprehensive SOP guide*

```markdown
# Rule: Creating Standard Operating Procedures (SOPs)

## Goal

To guide an AI assistant in creating comprehensive Standard Operating Procedures that document step-by-step processes, safety requirements, and quality standards for organizational operations.

## Process

1. **Receive Process Description:** User provides process or procedure needs.
2. **Ask SOP Questions:** AI *must* understand process requirements and constraints.
3. **Generate SOP:** Create detailed step-by-step procedures.
4. **Save SOP:** Save as `sop-[process-name].md` in `/tasks/`.
5. **Generate Training:** Create training materials and checklists.

[... Complete SOP creation guide continues ...]
```

## 12. create-rfc.md - Request for Comments Creator
*5,800 character comprehensive RFC guide*

```markdown
# Rule: Creating Request for Comments (RFC) Documents

## Goal

To guide an AI assistant in creating comprehensive RFC documents that propose technical changes, gather feedback, and build consensus among development teams.

## Process

1. **Receive Change Proposal:** User provides technical change description.
2. **Ask RFC Questions:** AI *must* understand the proposed change and its implications.
3. **Generate RFC:** Create detailed proposal with alternatives and analysis.
4. **Save RFC:** Save as `rfc-[proposal-name].md` in `/tasks/`.
5. **Generate Discussion:** Create discussion points and decision framework.

[... Complete RFC creation guide continues ...]
```

## 13. create-project-charter.md - Project Charter Creator
*13,300 character comprehensive project initiation guide*

```markdown
# Rule: Creating Project Charters

## Goal

To guide an AI assistant in creating comprehensive project charters that define project scope, objectives, stakeholders, and success criteria for project initiation and approval.

## Process

1. **Receive Project Description:** User provides project initiative details.
2. **Ask Charter Questions:** AI *must* understand project scope and objectives.
3. **Generate Charter:** Create detailed project charter with all required sections.
4. **Save Charter:** Save as `project-charter-[project-name].md` in `/tasks/`.
5. **Generate Planning:** Create initial project planning documents.

[... Complete Project Charter creation guide continues ...]
```

## 14. create-raci-matrix.md - RACI Matrix Creator
*15,100 character comprehensive responsibility assignment guide*

```markdown
# Rule: Creating RACI Matrices

## Goal

To guide an AI assistant in creating comprehensive RACI matrices that clearly define roles and responsibilities for project tasks, deliverables, and decision-making processes.

## Process

1. **Receive Project/Process Description:** User provides project or process details.
2. **Ask RACI Questions:** AI *must* understand roles, responsibilities, and deliverables.
3. **Generate RACI Matrix:** Create detailed responsibility assignment matrix.
4. **Save RACI:** Save as `raci-matrix-[project].md` in `/tasks/`.
5. **Generate Communication Plan:** Create related communication and escalation procedures.

[... Complete RACI Matrix creation guide continues ...]
```

## 15. create-risk-register.md - Risk Register Creator
*14,300 character comprehensive risk management guide*

```markdown
# Rule: Creating Risk Registers

## Goal

To guide an AI assistant in creating comprehensive risk registers that identify, assess, and plan mitigation strategies for project and operational risks.

## Process

1. **Receive Project/System Description:** User provides project or system details.
2. **Ask Risk Questions:** AI *must* understand risk context and environment.
3. **Generate Risk Register:** Create detailed risk assessment and mitigation plans.
4. **Save Risk Register:** Save as `risk-register-[project].md` in `/tasks/`.
5. **Generate Monitoring:** Create risk monitoring and review procedures.

[... Complete Risk Register creation guide continues ...]
```

## 16. generate-tasks.md - Task Generation Guide
*4,300 character task breakdown guide*

```markdown
# Rule: Generating Task Lists from PRDs

## Goal

To guide an AI assistant in creating detailed, actionable task lists from Product Requirements Documents that can be directly used for sprint planning and development.

## Process

1. **Receive PRD or Feature Description:** User provides PRD document or feature requirements.
2. **Analyze Requirements:** AI breaks down requirements into logical components.
3. **Generate Task List:** Create detailed task breakdown with estimates and dependencies.
4. **Save Task List:** Save as `tasks-[feature-name].md` in `/tasks/`.
5. **Create Tracking:** Generate task tracking and progress monitoring.

[... Complete Task Generation guide continues ...]
```

## 17. process-task-list.md - Task Processing Guide
*2,300 character task management guide*

```markdown
# Rule: Processing and Managing Task Lists

## Goal

To guide an AI assistant in processing task lists, updating progress, managing dependencies, and facilitating effective project management and sprint planning.

## Process

1. **Receive Task List:** User provides existing task list or requests task updates.
2. **Analyze Current State:** AI reviews task status, dependencies, and blockers.
3. **Update Progress:** Update task completion, estimates, and timelines.
4. **Identify Issues:** Flag blockers, risks, and dependencies.
5. **Generate Reports:** Create progress reports and planning updates.

[... Complete Task Processing guide continues ...]
```

## 18. adr-template.md - Architecture Decision Record Template
*2,500 character ADR template guide*

```markdown
# 📋 Architecture Decision Record (ADR) Template
**Template Type**: Architecture Decision Record (ADR)
**Purpose**: Document important architectural decisions
**Standard**: Simplified ADR format for quick decision documentation

---

## 🎯 Template Instructions

**Use this template to create ADR documents for architectural decisions.**

**Claude Instructions**: When user asks to "Create an ADR for [decision]", use this template to generate a properly formatted Architecture Decision Record.

---

## 📋 ADR Template Structure

```markdown
# ADR-[NUMBER]: [Title]

**Date**: [YYYY-MM-DD]
**Status**: Proposed | Accepted | Deprecated | Superseded

## Context

[What is the issue that we're seeing that is motivating this decision?]

## Decision

[What is the change that we're proposing and/or doing?]

## Consequences

### Positive
- [Positive outcome 1]
- [Positive outcome 2]

### Negative
- [Drawback 1]
- [Drawback 2]

## Alternatives Considered

### Option 1: [Alternative]
- **Pros**:
- **Cons**:
- **Reason for rejection**:

### Option 2: [Alternative]
- **Pros**:
- **Cons**:
- **Reason for rejection**:

## Implementation

[How will this be implemented? Key steps or code examples]

## References

- [Link to relevant documentation]
- [Related ADRs]
- [External resources]
```

[... Complete ADR template guide ...]
```

---

# 📊 SUMMARY

## Template Breakdown by Size & Complexity:

### Foundation Templates (3 files)
- `README.md` - 9,355 characters - Complete toolkit guide
- `DOCUMENT_GUIDE.md` - 13,217 characters - When/how to use each document
- `AI_ATTRIBUTION.md` - 2,729 characters - AI transparency disclosure

### Simple Fill Templates (22 files)
- Range: 373-448 characters each
- Contain `{{project.*}}` placeholders
- Auto-filled by BMAD workflow
- Standard 4-section format

### Complex Creation Templates (19 files)
- Range: 2,300-21,000 characters each
- Comprehensive AI instruction guides
- Industry-standard templates
- Structured clarifying questions
- Complete workflow processes

## Key Features:
✅ **44 professional templates** covering complete development lifecycle
✅ **Structured AI guidance** with required clarifying questions
✅ **Industry standards compliance** (IEEE, ISO, Agile)
✅ **Version control integration** built into every template
✅ **Quality assurance** with completion checklists
✅ **AI transparency** with full disclosure of AI assistance

## Template Categories:
- **Planning:** PRD, BRD, RFC, Tech Spec (4 templates)
- **Design:** Design Doc, API Spec, Database Schema (3 templates)
- **Development:** User Stories, Test Plans, Task Generation (3 templates)
- **Operations:** Runbooks, Post-mortems, SOPs (3 templates)
- **Architecture:** ADRs, Solution Architecture (2 templates)
- **Project Management:** Charters, RACI, Risk Registers (3 templates)
- **Auto-Fill:** 22 simple templates + 3 foundation docs

---

*These source templates serve as the "DNA" of professional documentation generation, ensuring AI assistants create consistent, comprehensive, industry-standard documents every time.*

**End of Template Output 1**