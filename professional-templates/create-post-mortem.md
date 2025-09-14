# Rule: Generating a Post-Mortem Document

## Goal

To guide an AI assistant in creating a blameless post-mortem that analyzes incidents, identifies root causes, and prevents future occurrences through actionable improvements.

## Process

1. **Receive Incident Details:** User provides incident information.
2. **Ask Investigative Questions:** AI *must* understand what happened completely.
3. **Generate Post-Mortem:** Create thorough incident analysis.
4. **Save Post-Mortem:** Save as `post-mortem-[date]-[incident].md` in `/tasks/`.
5. **Track Action Items:** Create follow-up tasks from findings.

## Clarifying Questions (LLM Must Ask)

**Incident Context:**
1. What was the severity of the incident?
   - A) SEV-1 (Critical - full outage)
   - B) SEV-2 (Major - significant degradation)
   - C) SEV-3 (Minor - limited impact)
   - D) SEV-4 (Low - minimal impact)

2. What was the primary impact?
   - A) Complete service outage
   - B) Data loss/corruption
   - C) Security breach
   - D) Performance degradation
   - E) Partial feature failure
   - F) Other (specify)

3. How long did the incident last?
   - A) < 5 minutes
   - B) 5-30 minutes
   - C) 30 minutes - 2 hours
   - D) 2-24 hours
   - E) > 24 hours

**Response Context:**
4. How was the incident detected?
   - A) Monitoring alert
   - B) Customer report
   - C) Internal discovery
   - D) Automated system
   - E) Other (specify)

5. What was the root cause category?
   - A) Code bug
   - B) Configuration error
   - C) Infrastructure failure
   - D) Third-party service
   - E) Human error
   - F) Process failure
   - G) Unknown/Under investigation

## Post-Mortem Structure

```markdown
# Post-Mortem: [Incident Title]

**Incident Number:** INC-[YYYY-MM-DD]-[Number]
**Date:** [YYYY-MM-DD]
**Time:** [HH:MM] - [HH:MM] [Timezone]
**Duration:** [X hours Y minutes]
**Severity:** SEV-[1-4]
**Author:** [Name/AI Assistant]
**Status:** Draft | Under Review | Final | Closed

## Executive Summary

[2-3 sentence summary for executives. What happened, impact, and current status.]

## Impact

### Customer Impact
- **Affected Users:** [Number or percentage]
- **Affected Features:** [List of features]
- **Geographic Regions:** [Regions affected]
- **Lost Revenue:** $[Amount] (estimated)
- **SLA Breach:** Yes/No (details)

### Technical Impact
- **Systems Affected:** [List systems]
- **Data Loss:** None/Partial/Complete
- **Performance Degradation:** [Metrics]

### Business Impact
- **Customer Tickets:** [Number]
- **Reputation Impact:** [Assessment]
- **Compliance Issues:** [If any]

## Timeline

All times in [Timezone]

| Time | Event | Actor |
|------|-------|-------|
| HH:MM | Normal system operation | System |
| HH:MM | First signs of issue (retrospectively identified) | System |
| HH:MM | Alert triggered: [Alert name] | Monitoring |
| HH:MM | Incident declared | [Name] |
| HH:MM | Incident response team engaged | [Name] |
| HH:MM | Initial diagnosis: [Hypothesis] | [Name] |
| HH:MM | Mitigation attempted: [Action] | [Name] |
| HH:MM | Mitigation successful/failed | System |
| HH:MM | Root cause identified | [Name] |
| HH:MM | Fix implemented | [Name] |
| HH:MM | Service restored | System |
| HH:MM | Incident closed | [Name] |
| HH:MM | Post-mortem scheduled | [Name] |

## Root Cause Analysis

### What Happened
[Detailed technical explanation of what occurred]

### Why It Happened (5 Whys Analysis)
1. **Why did the service fail?**
   → Because the database connection pool was exhausted

2. **Why was the connection pool exhausted?**
   → Because connections were not being released properly

3. **Why were connections not being released?**
   → Because of a bug in the connection cleanup code

4. **Why was there a bug in the cleanup code?**
   → Because the error handling path didn't close connections

5. **Why didn't we catch this in testing?**
   → Because our tests didn't simulate connection failures

### Root Cause
**Primary Cause:** [Technical root cause]
**Contributing Factors:**
1. [Factor 1]
2. [Factor 2]
3. [Factor 3]

### Trigger
[What specific event or condition triggered the incident]

## Detection and Response

### Detection
- **Time to Detect (TTD):** [X minutes]
- **Detection Method:** [How it was detected]
- **Why wasn't it detected sooner?** [Analysis]

### Response
- **Time to Respond (TTR):** [X minutes]
- **Time to Mitigate (TTM):** [X minutes]
- **Time to Resolve (TTR):** [X minutes]
- **Response Quality:** Excellent/Good/Adequate/Poor

### What Went Well
✅ [Positive aspect 1]
✅ [Positive aspect 2]
✅ [Positive aspect 3]

### What Went Poorly
❌ [Problem 1]
❌ [Problem 2]
❌ [Problem 3]

## Resolution

### Immediate Fix
[What was done to resolve the immediate issue]

```bash
# Example commands used
kubectl rollout undo deployment/service-name
# or
UPDATE config SET value='correct' WHERE key='problematic';
```

### Long-term Fix
[Permanent solution to prevent recurrence]

## Lessons Learned

### Technical Lessons
1. [Technical learning 1]
2. [Technical learning 2]
3. [Technical learning 3]

### Process Lessons
1. [Process learning 1]
2. [Process learning 2]
3. [Process learning 3]

### Communication Lessons
1. [Communication learning 1]
2. [Communication learning 2]

## Action Items

| ID | Action | Owner | Priority | Due Date | Status |
|----|--------|-------|----------|----------|--------|
| AI-001 | Implement connection pool monitoring | [Name] | High | [Date] | Open |
| AI-002 | Add integration tests for error paths | [Name] | High | [Date] | Open |
| AI-003 | Update runbook with new procedures | [Name] | Medium | [Date] | Open |
| AI-004 | Conduct incident response training | [Name] | Medium | [Date] | Open |
| AI-005 | Review and update alerts | [Name] | High | [Date] | Open |

## Prevention Measures

### Short-term (This Week)
- [ ] Deploy hotfix with connection cleanup
- [ ] Add monitoring for connection pool usage
- [ ] Update alert thresholds

### Medium-term (This Month)
- [ ] Implement circuit breakers
- [ ] Add comprehensive error handling
- [ ] Improve test coverage for error scenarios

### Long-term (This Quarter)
- [ ] Redesign connection management
- [ ] Implement chaos engineering tests
- [ ] Establish error budget and tracking

## Supporting Data

### Metrics During Incident
```
Error Rate: 45% (normal: <0.1%)
Response Time p95: 8500ms (normal: 200ms)
Success Rate: 55% (normal: 99.9%)
Traffic: 10,000 req/min (normal: 8,000 req/min)
```

### Graphs
![Error Rate Spike](./graphs/error-rate.png)
![Response Time](./graphs/response-time.png)
![System Resources](./graphs/resources.png)

### Logs
```
ERROR [2025-09-14 10:15:32] Connection pool exhausted, size=100, available=0
ERROR [2025-09-14 10:15:33] Unable to acquire database connection
ERROR [2025-09-14 10:15:34] Request timeout after 30000ms
```

### Related Incidents
- [INC-2025-08-15] - Similar connection pool issue
- [INC-2025-07-20] - Database performance degradation

## Follow-up

### Review Meeting
- **Date:** [Scheduled date]
- **Attendees:** [List of required attendees]
- **Agenda:**
  1. Review timeline and root cause
  2. Discuss action items
  3. Assign owners and deadlines
  4. Schedule follow-up

### Success Criteria
Post-mortem is complete when:
- [ ] All action items have owners
- [ ] Root cause is fully understood
- [ ] Prevention measures are implemented
- [ ] Documentation is updated
- [ ] Team training is completed

## Communication

### Internal Communication
- **Incident Channel:** #incident-[date]
- **Stakeholder Updates:** Every 30 minutes during incident
- **Post-Incident Report:** Sent within 24 hours

### External Communication
- **Status Page Updated:** Yes/No
- **Customer Notification:** Yes/No
- **Public Post-Mortem:** Yes/No [Link if yes]

## Appendices

### Appendix A: Full Log Analysis
[Detailed logs with analysis]

### Appendix B: Configuration Changes
[Any configuration that was changed]

### Appendix C: Code Changes
[Links to PRs/commits that fixed the issue]

### Appendix D: Monitoring Improvements
[New alerts and dashboards created]

---

## Sign-off

| Role | Name | Date | Reviewed |
|------|------|------|----------|
| Incident Commander | [Name] | [Date] | [ ] |
| Tech Lead | [Name] | [Date] | [ ] |
| Engineering Manager | [Name] | [Date] | [ ] |
| SRE Lead | [Name] | [Date] | [ ] |

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | [Date] | Initial post-mortem | [Author] |
| 1.1 | [Date] | Added action items | [Author] |
| 1.2 | [Date] | Final review updates | [Author] |

---

## Post-Mortem Quality Checklist

- [ ] Timeline is complete and accurate
- [ ] Root cause is clearly identified
- [ ] Impact is quantified
- [ ] Action items are specific and assigned
- [ ] Lessons learned are documented
- [ ] No blame is assigned to individuals
- [ ] Technical details are sufficient for understanding
- [ ] Prevention measures address the root cause
```

## Version Control Integration

```bash
# Track post-mortem
echo "| post-mortem-[date] | SEV-[level] | $(date +%Y-%m-%d) | [Status] |" >> POST_MORTEM_TRACKING.md

# Commit
git add tasks/post-mortem-[date]-[incident].md
git commit -m "Post-Mortem: [Incident Title]

- Severity: SEV-[level]
- Duration: [time]
- Root Cause: [brief description]
- Action Items: [number]"
```

## AI Assistant Instructions

The AI must:
1. Maintain a blameless tone throughout
2. Focus on systems and processes, not people
3. Be specific about timeline and impacts
4. Include concrete action items with owners
5. Quantify impact where possible
6. Identify patterns from previous incidents
7. Ensure lessons lead to actionable improvements
8. Use the 5 Whys technique for root cause analysis

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `post-mortem-[YYYY-MM-DD]-[incident-brief].md`