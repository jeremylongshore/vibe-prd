# Rule: Generating a BRD (Business Requirements Document)

## Goal

To guide an AI assistant in creating a comprehensive Business Requirements Document that captures business needs, objectives, and success criteria before technical implementation begins.

## Process

1. **Receive Business Need:** The user describes a business problem or opportunity.
2. **Ask Business-Focused Questions:** The AI *must* ask questions to understand business context, NOT technical implementation.
3. **Generate BRD:** Create a business-focused document using the structure below.
4. **Save BRD:** Save as `brd-[project-name].md` in `/tasks/` directory.
5. **Track Status:** Update `BRD_TRACKING.md` with version control.

## Clarifying Questions (LLM Must Ask)

**Business Context:**
1. What is the primary business problem this solves?
   - A) Revenue generation
   - B) Cost reduction
   - C) Risk mitigation
   - D) Compliance requirement
   - E) Customer satisfaction
   - F) Other (specify)

2. Who are the primary stakeholders?
   - A) Executive team
   - B) Department heads
   - C) End users
   - D) Customers
   - E) Partners/Vendors
   - F) All of the above

3. What is the urgency level?
   - A) Critical - Business blocker
   - B) High - Significant impact
   - C) Medium - Important but not urgent
   - D) Low - Nice to have

**Success Metrics:**
4. How will success be measured?
   - A) Revenue increase (specify %)
   - B) Cost savings (specify amount)
   - C) Time savings (specify hours)
   - D) User adoption (specify target)
   - E) Other KPIs (specify)

5. What is the budget range?
   - A) < $10k
   - B) $10k - $50k
   - C) $50k - $100k
   - D) > $100k
   - E) Not yet determined

## BRD Structure

```markdown
# Business Requirements Document: [Project Name]

**Document Version:** 1.0
**Created:** [YYYY-MM-DD HH:MM]
**Last Updated:** [YYYY-MM-DD HH:MM]
**Status:** Draft | Under Review | Approved | Revised
**Author:** [Name/AI Assistant]
**Approval Date:** [Date when approved]
**Approved By:** [Stakeholder names]

## Executive Summary

[2-3 paragraph overview that executives can read to understand the entire project. Include problem, solution, and expected benefits.]

## Business Objectives

### Primary Objective
[Main business goal this project achieves]

### Secondary Objectives
1. [Additional objective 1]
2. [Additional objective 2]
3. [Additional objective 3]

## Business Problem Statement

### Current State
[Describe how things work today and what's wrong]

### Desired Future State
[Describe how things should work after implementation]

### Gap Analysis
| Current State | Future State | Gap to Bridge |
|---------------|--------------|---------------|
| [Current] | [Future] | [What's needed] |

## Stakeholders

| Name/Role | Interest/Influence | Responsibilities | Contact |
|-----------|-------------------|------------------|---------|
| [Name] | High/High | [What they own] | [Email] |
| [Name] | High/Low | [What they own] | [Email] |

## Business Requirements

### Functional Requirements
| ID | Requirement | Priority | Acceptance Criteria |
|----|-------------|----------|-------------------|
| BR-001 | [What the business needs] | Must Have | [How to verify] |
| BR-002 | [What the business needs] | Should Have | [How to verify] |
| BR-003 | [What the business needs] | Nice to Have | [How to verify] |

### Non-Functional Requirements
| Category | Requirement | Target Metric |
|----------|-------------|---------------|
| Performance | [Requirement] | [Metric] |
| Reliability | [Requirement] | [Metric] |
| Usability | [Requirement] | [Metric] |
| Compliance | [Requirement] | [Metric] |

## Success Criteria

### Key Performance Indicators (KPIs)
| KPI | Current Value | Target Value | Measurement Method |
|-----|---------------|--------------|-------------------|
| [KPI Name] | [Current] | [Target] | [How to measure] |

### Success Metrics Timeline
| Milestone | Date | Success Criteria | Owner |
|-----------|------|------------------|-------|
| Phase 1 | [Date] | [Criteria] | [Owner] |
| Phase 2 | [Date] | [Criteria] | [Owner] |

## Business Process Impact

### Affected Processes
1. **Process Name:** [Name]
   - Current: [How it works now]
   - Future: [How it will work]
   - Impact: [What changes]

### Change Management Requirements
- Training needs: [Description]
- Communication plan: [Description]
- Transition period: [Duration]

## Cost-Benefit Analysis

### Costs
| Category | One-Time | Recurring (Annual) | Notes |
|----------|----------|-------------------|-------|
| Development | $[Amount] | $[Amount] | [Notes] |
| Infrastructure | $[Amount] | $[Amount] | [Notes] |
| Training | $[Amount] | $[Amount] | [Notes] |
| **Total** | **$[Sum]** | **$[Sum]** | |

### Benefits
| Benefit | Year 1 | Year 2 | Year 3 | Calculation Method |
|---------|--------|--------|--------|-------------------|
| Cost Savings | $[Amount] | $[Amount] | $[Amount] | [How calculated] |
| Revenue Increase | $[Amount] | $[Amount] | $[Amount] | [How calculated] |
| **Total** | **$[Sum]** | **$[Sum]** | **$[Sum]** | |

### ROI Calculation
- Payback Period: [X months]
- 3-Year ROI: [X%]
- Net Present Value: $[Amount]

## Risk Assessment

| Risk | Probability | Impact | Mitigation Strategy | Owner |
|------|-------------|--------|-------------------|--------|
| [Risk description] | High/Med/Low | High/Med/Low | [How to mitigate] | [Owner] |

## Constraints and Assumptions

### Constraints
1. Budget: [Constraint]
2. Timeline: [Constraint]
3. Resources: [Constraint]
4. Technology: [Constraint]

### Assumptions
1. [Assumption about business environment]
2. [Assumption about resources]
3. [Assumption about stakeholder availability]

## Dependencies

| Dependency | Type | Impact if Delayed | Mitigation |
|------------|------|------------------|------------|
| [Dependency] | Internal/External | [Impact] | [Plan] |

## Timeline

### High-Level Schedule
| Phase | Start Date | End Date | Key Deliverables |
|-------|------------|----------|-----------------|
| Discovery | [Date] | [Date] | [Deliverables] |
| Design | [Date] | [Date] | [Deliverables] |
| Development | [Date] | [Date] | [Deliverables] |
| Testing | [Date] | [Date] | [Deliverables] |
| Deployment | [Date] | [Date] | [Deliverables] |

## Compliance and Regulatory Requirements

| Requirement | Regulation/Standard | Impact | Verification Method |
|-------------|-------------------|--------|-------------------|
| [Requirement] | [Standard name] | [How it affects project] | [How to verify] |

## Approval

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Business Sponsor | [Name] | ________ | _____ |
| IT Director | [Name] | ________ | _____ |
| Finance | [Name] | ________ | _____ |

---

## Appendices

### Appendix A: Glossary
| Term | Definition |
|------|------------|
| [Term] | [Definition] |

### Appendix B: References
- [Reference documents]
- [Related BRDs]
- [Market research]

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | [Date] | Initial draft | [Author] |
```

## Version Control Integration

After generating the BRD:

1. **Create tracking entry:**
```bash
echo "| BRD-[Name] | Draft | $(date +%Y-%m-%d) | [Author] | [Project] |" >> BRD_TRACKING.md
```

2. **Commit the BRD:**
```bash
git add tasks/brd-[name].md BRD_TRACKING.md
git commit -m "BRD: [Project Name]

- Status: Draft
- Business Objective: [One line summary]
- Estimated ROI: [X%]"
```

## AI Assistant Instructions

When creating BRDs, the AI must:
1. Focus on BUSINESS needs, not technical solutions
2. Quantify benefits and costs with specific numbers
3. Identify all stakeholders and their interests
4. Include realistic ROI calculations
5. Address change management requirements
6. Never skip the cost-benefit analysis
7. Always include measurable success criteria

## Target Audience

BRDs are read by **business stakeholders, executives, and finance teams** who need to understand and approve the business case.

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `brd-[project-name].md`