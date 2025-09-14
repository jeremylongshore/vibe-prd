# Rule: Generating a Test Plan Document

## Goal

To guide an AI assistant in creating comprehensive test plans that ensure quality through systematic testing approaches, covering all aspects from unit tests to user acceptance testing.

## Process

1. **Receive Feature/System Description:** User provides what needs testing.
2. **Ask Testing Scope Questions:** AI *must* understand testing requirements.
3. **Generate Test Plan:** Create detailed testing documentation.
4. **Save Test Plan:** Save as `test-plan-[feature].md` in `/tasks/`.
5. **Generate Test Cases:** Include specific, executable test cases.

## Clarifying Questions (LLM Must Ask)

**Testing Scope:**
1. What type of testing is needed?
   - A) Unit testing
   - B) Integration testing
   - C) System testing
   - D) Acceptance testing
   - E) Performance testing
   - F) Security testing
   - G) All of the above

2. What is the risk level of this feature?
   - A) Critical (payment, security, data)
   - B) High (core functionality)
   - C) Medium (important features)
   - D) Low (nice to have)

3. What is the testing timeline?
   - A) Continuous (ongoing development)
   - B) Sprint-based (2 weeks)
   - C) Release-based (monthly)
   - D) One-time (specific deadline)

**Technical Context:**
4. What platforms need testing?
   - A) Web browsers (specify which)
   - B) Mobile (iOS/Android)
   - C) Desktop applications
   - D) APIs only
   - E) All platforms

5. What are the performance requirements?
   - A) Response time < 200ms
   - B) Handle 1000 concurrent users
   - C) 99.9% uptime
   - D) All of the above
   - E) Other (specify)

## Test Plan Structure

```markdown
# Test Plan: [Feature/System Name]

**Version:** 1.0
**Created:** [YYYY-MM-DD]
**Author:** [Name/AI Assistant]
**Reviewers:** [Names]
**Status:** Draft | In Review | Approved | In Execution
**Test Period:** [Start Date] - [End Date]
**Related Documents:**
- PRD: [Link]
- Tech Spec: [Link]
- Design Doc: [Link]

## 1. Test Plan Identifier

**Test Plan ID:** TP-[YYYY-MM-DD]-[Feature]
**Version:** 1.0

## 2. Introduction

### 2.1 Purpose
[Purpose of this test plan and what it aims to achieve]

### 2.2 Scope
**In Scope:**
- [What will be tested]
- [Specific features]
- [Platforms/environments]

**Out of Scope:**
- [What will NOT be tested]
- [Excluded features]
- [Deferred testing]

### 2.3 Objectives
1. Verify functional requirements are met
2. Ensure performance meets SLA
3. Validate security requirements
4. Confirm usability standards
5. Verify integration points

## 3. Test Items

### 3.1 Features to Test
| Feature | Priority | Test Type | Test Depth |
|---------|----------|-----------|------------|
| User Login | Critical | Functional, Security | Exhaustive |
| Data Export | High | Functional, Performance | Comprehensive |
| Reports | Medium | Functional | Standard |
| Settings | Low | Functional | Basic |

### 3.2 Features Not to Test
| Feature | Reason |
|---------|--------|
| Legacy Module | Being deprecated |
| Third-party API | Vendor responsibility |

## 4. Testing Approach

### 4.1 Test Levels

#### Unit Testing
- **Coverage Target:** 80%
- **Framework:** Jest/JUnit/pytest
- **Responsibility:** Developers
- **When:** During development

#### Integration Testing
- **Scope:** API endpoints, service interactions
- **Framework:** Postman/REST Assured
- **Responsibility:** QA Team
- **When:** After unit testing

#### System Testing
- **Scope:** End-to-end workflows
- **Method:** Manual and automated
- **Responsibility:** QA Team
- **When:** After integration testing

#### Acceptance Testing
- **Scope:** Business requirements
- **Method:** Manual testing
- **Responsibility:** Product Owner/Users
- **When:** Before release

### 4.2 Test Types

| Test Type | Description | Priority | Method |
|-----------|-------------|----------|--------|
| Functional | Verify features work | Critical | Automated |
| Performance | Load and stress testing | High | Automated |
| Security | Vulnerability testing | Critical | Manual + Tools |
| Usability | User experience | Medium | Manual |
| Compatibility | Cross-platform | High | Manual + Automated |
| Regression | Existing functionality | High | Automated |

## 5. Pass/Fail Criteria

### 5.1 Item Pass Criteria
- All critical test cases pass
- No severity 1 or 2 bugs open
- Code coverage > 80%
- Performance metrics met
- Security scan shows no critical vulnerabilities

### 5.2 Item Fail Criteria
- Any critical test case fails
- Severity 1 bug found
- Performance SLA breach
- Security vulnerability detected
- Data corruption occurs

### 5.3 Suspension Criteria
Testing will be suspended if:
- Environment is unavailable
- > 40% test cases blocked
- Critical blocker bug found
- Test data corrupted

### 5.4 Resumption Requirements
- Environment restored
- Blocker bugs fixed
- Test data refreshed
- Smoke tests pass

## 6. Test Deliverables

### 6.1 Test Documents
- [ ] Test Plan (this document)
- [ ] Test Cases
- [ ] Test Scripts
- [ ] Test Data Requirements
- [ ] Test Environment Setup
- [ ] Traceability Matrix

### 6.2 Test Reports
- [ ] Daily Test Execution Report
- [ ] Defect Reports
- [ ] Test Summary Report
- [ ] Coverage Report
- [ ] Performance Test Report

## 7. Test Cases

### 7.1 Test Case: User Authentication

**Test Case ID:** TC-001
**Priority:** Critical
**Type:** Functional

#### Preconditions
- User account exists
- System is accessible

#### Test Steps
| Step | Action | Expected Result | Pass/Fail |
|------|--------|-----------------|-----------|
| 1 | Navigate to login page | Login page displays | [ ] |
| 2 | Enter valid username | Username accepted | [ ] |
| 3 | Enter valid password | Password accepted | [ ] |
| 4 | Click login button | User logged in successfully | [ ] |
| 5 | Verify dashboard loads | Dashboard displays user data | [ ] |

#### Postconditions
- User session created
- Audit log entry created

#### Test Data
```json
{
  "username": "testuser@example.com",
  "password": "Test123!@#",
  "expected_role": "standard_user"
}
```

### 7.2 Test Case: Performance - Load Testing

**Test Case ID:** TC-002
**Priority:** High
**Type:** Performance

#### Test Scenario
- Concurrent Users: 1000
- Ramp-up: 60 seconds
- Duration: 30 minutes
- Think Time: 5 seconds

#### Performance Criteria
| Metric | Target | Actual | Pass/Fail |
|--------|--------|--------|-----------|
| Response Time (p95) | < 200ms | [Actual] | [ ] |
| Throughput | > 1000 req/sec | [Actual] | [ ] |
| Error Rate | < 0.1% | [Actual] | [ ] |
| CPU Usage | < 70% | [Actual] | [ ] |

#### Load Test Script
```javascript
// K6 Load Test Script
import http from 'k6/http';
import { check } from 'k6';

export let options = {
  stages: [
    { duration: '1m', target: 1000 },
    { duration: '30m', target: 1000 },
    { duration: '1m', target: 0 },
  ],
};

export default function() {
  let response = http.get('https://api.example.com/endpoint');
  check(response, {
    'status is 200': (r) => r.status === 200,
    'response time < 200ms': (r) => r.timings.duration < 200,
  });
}
```

### 7.3 Test Case: Security - SQL Injection

**Test Case ID:** TC-003
**Priority:** Critical
**Type:** Security

#### Test Vectors
| Input Field | Malicious Input | Expected Result |
|-------------|----------------|-----------------|
| Username | `admin' OR '1'='1` | Input rejected |
| Search | `'; DROP TABLE users; --` | Input sanitized |
| ID Parameter | `1 UNION SELECT * FROM passwords` | Error handled gracefully |

### 7.4 Test Case Template

**Test Case ID:** TC-XXX
**Priority:** [Critical/High/Medium/Low]
**Type:** [Functional/Performance/Security/Usability]

#### Description
[What this test validates]

#### Preconditions
- [Condition 1]
- [Condition 2]

#### Test Steps
| Step | Action | Expected Result | Pass/Fail |
|------|--------|-----------------|-----------|
| 1 | [Action] | [Expected] | [ ] |

#### Postconditions
- [Expected state after test]

## 8. Environmental Needs

### 8.1 Test Environment
| Environment | URL | Purpose | Database |
|-------------|-----|---------|----------|
| Development | dev.example.com | Unit testing | Dev DB |
| QA | qa.example.com | Integration testing | QA DB |
| Staging | staging.example.com | UAT | Staging DB |
| Performance | perf.example.com | Load testing | Perf DB |

### 8.2 Test Tools
| Tool | Purpose | Version | License |
|------|---------|---------|---------|
| Selenium | UI Automation | 4.x | Open Source |
| JMeter | Performance Testing | 5.x | Open Source |
| OWASP ZAP | Security Testing | 2.x | Open Source |
| Postman | API Testing | Latest | Free/Paid |

### 8.3 Test Data Requirements
- **User Accounts:** 100 test users with various roles
- **Transaction Data:** 10,000 sample transactions
- **File Uploads:** Various file types and sizes
- **Edge Cases:** Maximum values, special characters

## 9. Responsibilities

### 9.1 RACI Matrix
| Task | QA Lead | Dev Team | Product | DevOps |
|------|---------|----------|---------|--------|
| Test Planning | R,A | C | I | C |
| Test Case Design | R | C | I | - |
| Test Execution | R | C | I | - |
| Defect Management | R | A | I | - |
| Environment Setup | C | C | - | R,A |

### 9.2 Team Members
| Role | Name | Responsibility |
|------|------|----------------|
| QA Lead | [Name] | Overall testing |
| QA Engineer | [Name] | Test execution |
| Automation Engineer | [Name] | Test automation |
| Performance Tester | [Name] | Performance testing |

## 10. Schedule

### 10.1 Test Milestones
| Milestone | Date | Status |
|-----------|------|--------|
| Test Plan Approval | [Date] | [ ] |
| Test Case Preparation | [Date] | [ ] |
| Test Environment Ready | [Date] | [ ] |
| Test Execution Start | [Date] | [ ] |
| Test Execution Complete | [Date] | [ ] |
| Test Report Delivery | [Date] | [ ] |

### 10.2 Test Schedule
```
Week 1: Test preparation and environment setup
Week 2-3: Functional testing
Week 4: Integration testing
Week 5: Performance testing
Week 6: Security testing
Week 7: UAT
Week 8: Regression testing and sign-off
```

## 11. Risk and Contingencies

### 11.1 Testing Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Environment instability | Medium | High | Have backup environment |
| Test data corruption | Low | High | Daily backups |
| Resource unavailability | Medium | Medium | Cross-training |
| Scope creep | High | Medium | Change control process |

### 11.2 Contingency Plans
- **If critical bug found:** Stop testing, fix, and restart
- **If environment down:** Switch to backup or extend timeline
- **If resources unavailable:** Prioritize critical tests

## 12. Approvals

| Role | Name | Signature | Date |
|------|------|-----------|------|
| QA Manager | [Name] | _______ | ____ |
| Development Lead | [Name] | _______ | ____ |
| Product Owner | [Name] | _______ | ____ |
| Project Manager | [Name] | _______ | ____ |

## 13. Appendices

### Appendix A: Requirements Traceability Matrix
| Requirement ID | Test Case IDs | Status |
|----------------|---------------|--------|
| REQ-001 | TC-001, TC-004 | Covered |
| REQ-002 | TC-002, TC-005 | Covered |

### Appendix B: Test Data Sets
[Detailed test data specifications]

### Appendix C: Test Scripts
[Links to automated test scripts]

### Appendix D: Defect Report Template
[Template for reporting bugs]

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | [Date] | Initial test plan | [Author] |
```

## Version Control Integration

```bash
# Track test plan
echo "| test-plan-[feature] | v1.0 | $(date +%Y-%m-%d) | [Status] |" >> TEST_PLAN_TRACKING.md

# Commit
git add tasks/test-plan-[feature].md
git commit -m "Test Plan: [Feature Name]

- Test Cases: [Number]
- Test Types: [List types]
- Timeline: [Duration]"
```

## AI Assistant Instructions

The AI must:
1. Include specific, executable test cases
2. Cover positive and negative scenarios
3. Include edge cases and boundary conditions
4. Specify exact test data
5. Provide clear pass/fail criteria
6. Include performance benchmarks
7. Address security testing
8. Create traceable requirements matrix

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `test-plan-[feature].md`