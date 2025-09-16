# Original 22 Template Pack - Reference Copy
**Saved:** 2025-09-16
**Purpose:** Original concise template pack for future reference

This is the original concise template pack that was provided. Saving for future use in case we need the minimal versions.

---

=== FILE: 01_prd.md ===
# Product Requirements Document (PRD)
**Last Updated:** {{DATE}}
**Maintainer:** AI-Dev Toolkit
**Upstream (BMAD):** prd-tmpl.yaml → docs/prd.md
**Cross-links:** See 03_generate_tasks.md, 04_process_task_list.md, 06_architecture.md

## 1. One-liner & Problem
- One-liner:
- Who hurts today / why now:

## 2. Goals (Measurable)
- G1 (KPI + target):
- G2:
- G3:

## 3. Users & Scenarios
- Primary persona(s):
- Top journeys (3):

## 4. Scope (MVP → V1)
- In:
- Out:
- Assumptions:

## 5. Requirements
- Core features (numbered):
- Non-functional (perf, SLAs, reliability):

## 6. Risks & Mitigations
- R1: / Mitigation:
- R2: / Mitigation:

## 7. Metrics & Analytics
- Activation, Engagement, Retention, Monetization:
- Instrumentation notes:

## 8. Privacy, Security, Compliance
- Data types, consent, deletion/export paths:
- Threat model sketch:

## 9. Release Plan
- Milestones:
- Success criteria ("done = …"):
=== END FILE ===

=== FILE: 02_adr.md ===
# Architecture Decision Record (ADR)
**Last Updated:** {{DATE}}
**Maintainer:** AI-Dev Toolkit
**Upstream (BMAD):** architecture-tmpl.yaml → docs/architecture.md
**Cross-links:** See 06_architecture.md

## Context
- Problem & constraints:

## Decision
- Chosen approach:

## Alternatives Considered
1)
2)
3)

## Consequences
- Positive:
- Negative / tradeoffs:

## Follow-ups
- Tasks to complete decision:
- Revisit date / trigger:
=== END FILE ===

=== FILE: 03_generate_tasks.md ===
# Task Generation (from PRD)
**Last Updated:** {{DATE}}
**Maintainer:** AI-Dev Toolkit
**Upstream (BMAD):** story-tmpl.yaml / qa-gate-tmpl.yaml
**Cross-links:** Uses 01_prd.md → feeds 04_process_task_list.md

## Inputs
- PRD sections → features → user stories

## Method
1) For each PRD feature, write user story(ies)
2) Add acceptance criteria (testable)
3) Break into engineering tasks (≤2 days each)

## Output Format
- Story ID, title, ACs
- Tasks: ID, description, estimate, dependency

## Quality Gates
- Each AC is verifiable
- No task > 2 days
- Critical path identified
=== END FILE ===

=== FILE: 04_process_task_list.md ===
# Process Task List (Execution Plan)
**Last Updated:** {{DATE}}
**Maintainer:** AI-Dev Toolkit
**Cross-links:** Consumes 03_generate_tasks.md; gates 17_test_plan.md

## Board Columns
- Backlog → Ready → In Progress → Review → Done

## Workflow Rules
- WIP limits:
- Definition of Ready (DoR):
- Definition of Done (DoD):

## Cadences
- Standup (15m daily):
- Planning (1h weekly):
- Retro (30m biweekly):

## Reporting
- Burndown, cycle time, blocked items

## Escalation
- What triggers a swarm:
- Owner on call:
=== END FILE ===

=== FILE: 05_market_research.md ===
# Market Research Brief
**Last Updated:** {{DATE}}
**Upstream (BMAD):** market-research-tmpl.yaml

## Market Overview
- Size, growth, trends

## Customer Insights
- Segments, needs, willingness to pay

## Channels & Distribution
- Where users are; acquisition paths

## Implications for PRD
- 3 bullets that changed scope/priority
=== END FILE ===

=== FILE: 06_architecture.md ===
# System Architecture (High Level)
**Last Updated:** {{DATE}}
**Upstream (BMAD):** fullstack-architecture-tmpl.yaml / front-end-architecture-tmpl.yaml

## Context & Constraints
- Domain, data, perf, scale, SLA

## Logical View
- Modules & responsibilities

## Data & Integrations
- Core entities, external services

## Runtime View
- Critical flows (auth, write, read)

## Quality Attributes
- Reliability, security, cost, operability

## Risks & Spikes
- Unknowns, proofs to run
=== END FILE ===

=== FILE: 07_competitor_analysis.md ===
# Competitor & Alternative Analysis
**Last Updated:** {{DATE}}
**Upstream (BMAD):** competitor-analysis-tmpl.yaml

## Direct Competitors
- Table: Product | Segment | Strengths | Weaknesses

## Alternatives / DIY
- What users do today

## Differentiation
- Our edge & how to keep it
=== END FILE ===

=== FILE: 08_personas.md ===
# User Personas
**Last Updated:** {{DATE}}

## Persona A
- Goals, pains, environment
- Success definition

## Persona B
- …

## Anti-Persona (optional)
- Who we won't optimize for
=== END FILE ===

=== FILE: 09_user_journeys.md ===
# User Journeys (Top 3)
**Last Updated:** {{DATE}}

## Journey 1: Acquire & Activate
- Steps, emotions, drop-offs, fixes

## Journey 2: Core Value
- Steps, "aha" moment, loops

## Journey 3: Retain
- Streaks, reminders, social proof
=== END FILE ===

=== FILE: 10_user_stories.md ===
# User Stories & Acceptance Criteria
**Last Updated:** {{DATE}}
**Upstream (BMAD):** story-tmpl.yaml

> Template
Story: As a <user>, I want <capability> so <outcome>.
AC:
- [ ] Given/When/Then #1
- [ ] Given/When/Then #2

(List stories here referencing PRD features)
=== END FILE ===

=== FILE: 11_acceptance_criteria.md ===
# Acceptance Criteria Library
**Last Updated:** {{DATE}}

## Example Patterns
- Given <context>, when <action>, then <expected>
- Input validation
- Error handling
- Performance constraints
=== END FILE ===

=== FILE: 12_qa_gate.md ===
# QA Gate Checklist
**Last Updated:** {{DATE}}
**Upstream (BMAD):** qa-gate-tmpl.yaml

## Pre-release Checks
- Unit test coverage ≥ X%
- Integration tests green
- Security scans passing
- Performance thresholds met
- Docs updated
=== END FILE ===

=== FILE: 13_risk_register.md ===
# Risk Register
**Last Updated:** {{DATE}}

## Format
- Risk | Probability | Impact | Owner | Mitigation

## Seed Risks
- Tech debt
- Resource gaps
- Compliance
- Vendor lock-in
=== END FILE ===

=== FILE: 14_project_brief.md ===
# Project Brief
**Last Updated:** {{DATE}}
**Upstream (BMAD):** project-brief-tmpl.yaml

## TL;DR
- Problem:
- Solution:
- Why now:

## Team
- Roles & owners

## Timeline
- MVP target date
- Milestones
=== END FILE ===

=== FILE: 15_brainstorming.md ===
# Brainstorming Output
**Last Updated:** {{DATE}}
**Upstream (BMAD):** brainstorming-output-tmpl.yaml

## Raw Ideas
- …

## Clustered Themes
- …

## Prioritized
- …
=== END FILE ===

=== FILE: 16_frontend_spec.md ===
# Frontend Spec
**Last Updated:** {{DATE}}
**Upstream (BMAD):** front-end-spec-tmpl.yaml

## Context
- Target devices
- Framework/library

## Components
- List, props, states

## UX Notes
- Accessibility
- Performance
=== END FILE ===

=== FILE: 17_test_plan.md ===
# Test Plan
**Last Updated:** {{DATE}}

## Levels
- Unit
- Integration
- E2E
- Load

## Tools
- Frameworks, runners

## Reporting
- Dashboards, alerts
=== END FILE ===

=== FILE: 18_release_plan.md ===
# Release Plan
**Last Updated:** {{DATE}}

## Channels
- App Store, TestFlight, staging env

## Phases
- Alpha → Beta → GA

## Rollback Plan
- Triggers, actions
=== END FILE ===

=== FILE: 19_operational_readiness.md ===
# Operational Readiness Checklist
**Last Updated:** {{DATE}}

## Categories
- Monitoring
- Logging
- Alerts
- On-call
- Runbooks
=== END FILE ===

=== FILE: 20_metrics_dashboard.md ===
# Metrics & Dashboard
**Last Updated:** {{DATE}}

## Core Metrics
- DAU/MAU
- Retention
- NPS
- Revenue

## Tools
- Analytics SDKs
- BI dashboards
=== END FILE ===

=== FILE: 21_postmortem.md ===
# Incident Postmortem Template
**Last Updated:** {{DATE}}

## Incident
- Timeline
- Impact
- Root cause

## Resolution
- Fix
- Verification

## Lessons Learned
- Preventive actions
=== END FILE ===

=== FILE: 22_playtest_usability.md ===
# Playtest / Usability Report
**Last Updated:** {{DATE}}

## Session Overview
- Who, when, what tested

## Observations
- Successes
- Struggles

## Recommendations
- Changes to prioritize
=== END FILE ===

---

**End of Original Template Pack**
**Total Files:** 22
**Style:** Concise, minimal structure
**Use Case:** Quick template creation, minimal overhead