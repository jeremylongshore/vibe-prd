# Rule: Generating a Risk Register

## Goal

To guide an AI assistant in creating a comprehensive risk register that identifies, assesses, and tracks project risks with clear mitigation strategies and ownership.

## Process

1. **Receive Project Context:** User provides project information.
2. **Ask Risk Assessment Questions:** AI *must* understand risk tolerance and constraints.
3. **Generate Risk Register:** Create detailed risk documentation.
4. **Save Risk Register:** Save as `risk-register-[project].md` in `/tasks/`.
5. **Define Response Plans:** Create actionable mitigation strategies.

## Clarifying Questions (LLM Must Ask)

**Risk Context:**
1. What is the organization's risk tolerance?
   - A) Risk-averse (minimize all risks)
   - B) Risk-neutral (balanced approach)
   - C) Risk-tolerant (accept for rewards)
   - D) Risk-seeking (pursue opportunities)

2. What is the most critical concern?
   - A) Schedule delays
   - B) Budget overruns
   - C) Quality issues
   - D) Security breaches
   - E) Regulatory compliance
   - F) Reputation damage

3. What risk categories are relevant?
   - A) Technical risks
   - B) Business risks
   - C) Security risks
   - D) Compliance risks
   - E) Operational risks
   - F) All of the above

**Impact Thresholds:**
4. What constitutes a critical impact?
   - A) > $1M loss
   - B) > 1 month delay
   - C) Data breach
   - D) Service outage > 4 hours
   - E) Regulatory violation

5. How often should risks be reviewed?
   - A) Daily
   - B) Weekly
   - C) Bi-weekly
   - D) Monthly
   - E) Quarterly

## Risk Register Structure

```markdown
# Risk Register: [Project Name]

**Version:** 1.0
**Created:** [YYYY-MM-DD HH:MM]
**Author:** [Name/AI Assistant]
**Project:** [Project name and ID]
**Status:** Active | Under Review | Closed
**Last Review:** [YYYY-MM-DD]
**Next Review:** [YYYY-MM-DD]

## 1. Risk Management Overview

### 1.1 Risk Management Approach
[Description of how risks will be identified, assessed, and managed]

### 1.2 Risk Appetite Statement
**Organization's Risk Tolerance:**
- **Financial:** Willing to accept up to $[Amount] loss
- **Schedule:** Can accommodate up to [Days] delay
- **Quality:** Must maintain [Metric] standard
- **Reputation:** Zero tolerance for [Specific impacts]

### 1.3 Risk Scoring Matrix

#### Probability Levels
| Level | Score | Probability | Description |
|-------|-------|-------------|-------------|
| Very Low | 1 | < 10% | Unlikely to occur |
| Low | 2 | 10-30% | Possible but not expected |
| Medium | 3 | 30-50% | As likely as not |
| High | 4 | 50-70% | More likely than not |
| Very High | 5 | > 70% | Almost certain |

#### Impact Levels
| Level | Score | Schedule | Cost | Quality | Reputation |
|-------|-------|----------|------|---------|------------|
| Very Low | 1 | < 1 day | < $10K | Minor issues | No impact |
| Low | 2 | 1-5 days | $10-50K | Some rework | Limited impact |
| Medium | 3 | 5-10 days | $50-100K | Moderate defects | Local news |
| High | 4 | 10-30 days | $100-500K | Major defects | Regional impact |
| Very High | 5 | > 30 days | > $500K | Project failure | National news |

#### Risk Score Calculation
**Risk Score = Probability × Impact**

| Score Range | Risk Level | Response Required |
|-------------|------------|-------------------|
| 1-5 | Low | Monitor |
| 6-10 | Medium | Plan mitigation |
| 11-15 | High | Active mitigation |
| 16-25 | Critical | Immediate action |

### 1.4 Risk Heat Map

```
Impact ↑
  5  | 5  10  15  20  25
  4  | 4   8  12  16  20
  3  | 3   6   9  12  15
  2  | 2   4   6   8  10
  1  | 1   2   3   4   5
     +-------------------→
       1   2   3   4   5  Probability

Legend:
🟢 Low (1-5)
🟡 Medium (6-10)
🟠 High (11-15)
🔴 Critical (16-25)
```

## 2. Active Risk Register

### 2.1 Critical Risks (Score 16-25) 🔴

#### RISK-001: Data Breach
**Category:** Security
**Status:** Active - Monitoring
**Date Identified:** [YYYY-MM-DD]
**Owner:** [Name]

**Description:**
Unauthorized access to customer personal data could result in regulatory fines and reputation damage.

**Assessment:**
- **Probability:** 4 (High)
- **Impact:** 5 (Very High)
- **Risk Score:** 20 (Critical)
- **Trend:** ↑ Increasing

**Root Causes:**
1. Legacy security infrastructure
2. Increasing cyber threats
3. Complex third-party integrations

**Impacts if Realized:**
- Financial: $2-5M in fines and remediation
- Schedule: 3-6 month delay for investigation
- Reputation: Loss of customer trust
- Legal: Regulatory investigations

**Mitigation Strategies:**
| Strategy | Type | Owner | Status | Due Date |
|----------|------|-------|--------|----------|
| Implement encryption at rest | Preventive | Security Team | In Progress | [Date] |
| Deploy WAF and DDoS protection | Preventive | Infrastructure | Complete | [Date] |
| Conduct security audit | Detective | CISO | Planned | [Date] |
| Incident response plan | Corrective | Security Team | In Progress | [Date] |

**Contingency Plan:**
1. Immediate: Isolate affected systems
2. Within 1 hour: Activate incident response team
3. Within 4 hours: Notify legal and compliance
4. Within 24 hours: Customer notification if required
5. Within 48 hours: Regulatory notification

**Triggers for Escalation:**
- Any confirmed data breach
- Failed security audit
- Suspicious activity detected

**Cost-Benefit Analysis:**
- Mitigation Cost: $200K
- Potential Loss Avoided: $2-5M
- ROI: 10-25x

---

### 2.2 High Risks (Score 11-15) 🟠

#### RISK-002: Key Resource Departure
**Category:** Resource
**Status:** Active - Mitigating
**Date Identified:** [YYYY-MM-DD]
**Owner:** [Name]

**Description:**
Loss of critical technical lead could significantly impact project delivery.

**Assessment:**
- **Probability:** 3 (Medium)
- **Impact:** 4 (High)
- **Risk Score:** 12 (High)
- **Trend:** → Stable

**Mitigation Strategies:**
| Strategy | Type | Owner | Status | Due Date |
|----------|------|-------|--------|----------|
| Knowledge documentation | Preventive | Tech Lead | In Progress | [Date] |
| Cross-training program | Preventive | PM | Planned | [Date] |
| Retention bonus | Preventive | HR | Under Review | [Date] |
| Identify backup resource | Contingent | PM | Complete | [Date] |

---

### 2.3 Medium Risks (Score 6-10) 🟡

#### RISK-003: Third-Party API Changes
**Category:** Technical
**Status:** Active - Monitoring
**Date Identified:** [YYYY-MM-DD]
**Owner:** [Name]

**Assessment:**
- **Probability:** 3 (Medium)
- **Impact:** 3 (Medium)
- **Risk Score:** 9 (Medium)
- **Trend:** → Stable

**Mitigation Strategies:**
| Strategy | Type | Owner | Status | Due Date |
|----------|------|-------|--------|----------|
| API versioning strategy | Preventive | Architect | Complete | [Date] |
| Abstract API layer | Preventive | Dev Team | In Progress | [Date] |
| Monitor deprecation notices | Detective | Dev Team | Ongoing | - |

---

### 2.4 Low Risks (Score 1-5) 🟢

#### RISK-004: Office Closure
**Category:** Operational
**Status:** Accepted
**Date Identified:** [YYYY-MM-DD]
**Owner:** [Name]

**Assessment:**
- **Probability:** 2 (Low)
- **Impact:** 2 (Low)
- **Risk Score:** 4 (Low)
- **Trend:** ↓ Decreasing

**Response:** Accept - Team can work remotely

## 3. Risk Response Strategies

### 3.1 Response Types
| Strategy | Description | When to Use |
|----------|-------------|-------------|
| **Avoid** | Eliminate the risk entirely | Critical risks with feasible alternatives |
| **Mitigate** | Reduce probability or impact | High/Critical risks |
| **Transfer** | Shift risk to third party | Insurable risks |
| **Accept** | Acknowledge and monitor | Low risks or unavoidable |
| **Exploit** | Increase probability (opportunities) | Positive risks |

### 3.2 Mitigation Effectiveness

| Risk ID | Mitigation | Before | After | Reduction |
|---------|------------|--------|-------|-----------|
| RISK-001 | Security measures | 20 | 8 | 60% |
| RISK-002 | Knowledge transfer | 12 | 6 | 50% |
| RISK-003 | API abstraction | 9 | 4 | 56% |

## 4. Risk Tracking

### 4.1 Risk Burndown Chart
```
Risk Score Total
100 |*
 80 |  *
 60 |    *
 40 |      *
 20 |        *
  0 |__________*
    | J F M A M J
      Month
```

### 4.2 Risk Velocity
| Period | New Risks | Closed Risks | Net Change |
|--------|-----------|--------------|------------|
| Week 1 | 3 | 1 | +2 |
| Week 2 | 2 | 4 | -2 |
| Week 3 | 1 | 2 | -1 |
| Week 4 | 0 | 3 | -3 |

### 4.3 Risk Categories Distribution
| Category | Count | % of Total | Total Score |
|----------|-------|------------|-------------|
| Technical | 8 | 32% | 85 |
| Security | 5 | 20% | 76 |
| Resource | 4 | 16% | 42 |
| Business | 4 | 16% | 38 |
| Operational | 4 | 16% | 29 |

## 5. Closed Risks

### 5.1 Recently Closed
| Risk ID | Title | Closure Reason | Closure Date |
|---------|-------|----------------|--------------|
| RISK-005 | Budget approval delay | Budget approved | [Date] |
| RISK-006 | Technology selection | Decision made | [Date] |

### 5.2 Lessons Learned
| Risk | What Worked | What Didn't | Improvement |
|------|-------------|-------------|------------|
| RISK-005 | Early escalation | Initial estimates | Better forecasting |
| RISK-006 | POC approach | Timeline pressure | Start POCs earlier |

## 6. Opportunity Register

### 6.1 Positive Risks (Opportunities)
| ID | Opportunity | Probability | Impact | Score | Strategy |
|----|-------------|-------------|--------|-------|----------|
| OPP-001 | Early delivery | 30% | High | 12 | Exploit |
| OPP-002 | Cost savings | 40% | Medium | 12 | Enhance |
| OPP-003 | Scope expansion | 20% | High | 8 | Share |

### 6.2 Opportunity Realization Plan
| Opportunity | Actions to Increase Probability | Owner |
|-------------|--------------------------------|-------|
| Early delivery | Add resources, parallel work streams | PM |
| Cost savings | Negotiate bulk licensing | Procurement |

## 7. Risk Monitoring

### 7.1 Key Risk Indicators (KRIs)
| Indicator | Threshold | Current | Status | Trend |
|-----------|-----------|---------|--------|-------|
| Open Critical Risks | < 2 | 1 | 🟢 | ↓ |
| Total Risk Score | < 100 | 87 | 🟡 | → |
| Overdue Mitigations | 0 | 2 | 🔴 | ↑ |
| Risk Velocity | < 0 | -2 | 🟢 | ↓ |

### 7.2 Risk Review Calendar
| Review Type | Frequency | Next Date | Participants |
|-------------|-----------|-----------|--------------|
| Daily Standup | Daily | Tomorrow | Team |
| Risk Review | Weekly | [Date] | PM, Leads |
| Deep Dive | Monthly | [Date] | All stakeholders |
| Executive Review | Quarterly | [Date] | Steering Committee |

## 8. Risk Communication

### 8.1 Stakeholder Communication
| Stakeholder | Information Need | Format | Frequency |
|-------------|------------------|--------|-----------|
| Sponsor | Critical risks only | Dashboard | Weekly |
| PMO | Full risk register | Report | Bi-weekly |
| Team | Their owned risks | Discussion | Daily |
| Customer | Impact to delivery | Summary | Monthly |

### 8.2 Risk Escalation Thresholds
| Level | Score | Escalate To | Timeframe |
|-------|-------|-------------|-----------|
| Team | 1-10 | Team Lead | Next standup |
| Project | 11-15 | Project Manager | Within 24 hrs |
| Program | 16-20 | Program Manager | Within 4 hrs |
| Executive | 21-25 | C-Level | Immediately |

## 9. Risk Budget

### 9.1 Contingency Reserve
| Category | Allocated | Used | Remaining |
|----------|-----------|------|-----------|
| Schedule Buffer | 20 days | 5 days | 15 days |
| Cost Contingency | $500K | $50K | $450K |
| Resource Buffer | 2 FTE | 0.5 FTE | 1.5 FTE |

### 9.2 Management Reserve
- **Total Reserve:** $250K
- **Approval Required:** Sponsor
- **Used to Date:** $0
- **Available:** $250K

## 10. Risk Tools and Techniques

### 10.1 Risk Identification Methods
- [ ] Brainstorming sessions
- [ ] SWOT analysis
- [ ] Expert interviews
- [ ] Historical data review
- [ ] Assumption analysis
- [ ] Checklists

### 10.2 Risk Analysis Tools
- [ ] Monte Carlo simulation
- [ ] Decision trees
- [ ] Sensitivity analysis
- [ ] Root cause analysis
- [ ] FMEA (Failure Mode Effects Analysis)

## 11. Compliance and Audit

### 11.1 Regulatory Risks
| Regulation | Risk | Compliance Status | Next Audit |
|------------|------|------------------|------------|
| GDPR | Data privacy | In Progress | [Date] |
| SOC 2 | Security controls | Compliant | [Date] |
| HIPAA | Health data | Not Applicable | - |

### 11.2 Audit Trail
| Date | Auditor | Findings | Actions |
|------|---------|----------|---------|
| [Date] | Internal Audit | 2 medium risks not documented | Updated register |
| [Date] | External Audit | Risk scoring inconsistent | Standardized matrix |

## 12. Appendices

### Appendix A: Risk Identification Checklist
- [ ] Technical risks reviewed
- [ ] Security risks assessed
- [ ] Resource risks identified
- [ ] Schedule risks analyzed
- [ ] Cost risks evaluated
- [ ] Quality risks considered
- [ ] Stakeholder risks mapped
- [ ] External risks monitored

### Appendix B: Risk Response Plan Template
```markdown
Risk ID: RISK-XXX
Title: [Risk title]
Owner: [Name]

Trigger Conditions:
1. [Condition 1]
2. [Condition 2]

Response Actions:
1. Immediate (0-1 hour):
   - [Action 1]
   - [Action 2]
2. Short-term (1-24 hours):
   - [Action 3]
   - [Action 4]
3. Long-term (1+ days):
   - [Action 5]
   - [Action 6]

Success Criteria:
- [Measure 1]
- [Measure 2]
```

### Appendix C: Historical Risk Data
[Link to historical risk analysis and outcomes]

---

**Risk Register Maintenance:**
- Owner: [Project Manager Name]
- Last Updated: [Date]
- Next Review: [Date]
- Distribution: [List]
```

## Version Control Integration

```bash
# Track risk register
echo "| risk-register-[project] | Active | $(date +%Y-%m-%d) | [Risks: X] |" >> RISK_TRACKING.md

# Commit
git add tasks/risk-register-[project].md
git commit -m "Risk Register: [Project Name]

- Total Risks: [Number]
- Critical: [Number]
- High: [Number]"
```

## AI Assistant Instructions

The AI must:
1. Include probability and impact scoring
2. Create clear mitigation strategies
3. Assign risk ownership
4. Include escalation triggers
5. Track risk trends
6. Calculate contingency reserves
7. Document opportunities
8. Plan regular reviews

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `risk-register-[project].md`