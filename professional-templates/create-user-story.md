# Rule: Generating User Stories

## Goal

To guide an AI assistant in creating well-formed user stories that capture user needs, acceptance criteria, and definition of done for agile development.

## Process

1. **Receive Feature Description:** User provides feature or requirement.
2. **Ask User-Focused Questions:** AI *must* understand the user's perspective.
3. **Generate User Stories:** Create stories following the standard format.
4. **Save Stories:** Save as `user-stories-[feature].md` in `/tasks/`.
5. **Link to Sprint:** Add to sprint backlog tracking.

## Clarifying Questions (LLM Must Ask)

**User Context:**
1. Who is the primary user?
   - A) End customer
   - B) Internal employee
   - C) Administrator
   - D) Developer/API user
   - E) Multiple types (specify)

2. What is their main goal?
   - A) Complete a task faster
   - B) Access information
   - C) Manage/configure something
   - D) Analyze/report data
   - E) Communicate/collaborate

3. What is the user's technical level?
   - A) Non-technical
   - B) Basic computer skills
   - C) Power user
   - D) Technical/Developer

**Feature Details:**
4. What is the priority?
   - A) Must have (MVP)
   - B) Should have (Important)
   - C) Could have (Nice to have)
   - D) Won't have (Future)

5. What is the complexity?
   - A) Small (1-2 days)
   - B) Medium (3-5 days)
   - C) Large (1-2 weeks)
   - D) Extra Large (2+ weeks)

## User Story Structure

```markdown
# User Stories: [Feature Name]

**Created:** [YYYY-MM-DD HH:MM]
**Author:** [Name/AI Assistant]
**Sprint:** [Sprint number/name]
**Epic:** [Parent epic if applicable]
**Related PRD:** [Link to PRD]

## Epic Overview
[Brief description of the larger feature these stories support]

---

## Story 1: [Story Title]

### User Story
**As a** [type of user]
**I want** [action/feature]
**So that** [benefit/value]

### Story Details
**ID:** US-001
**Priority:** High | Medium | Low
**Story Points:** [1, 2, 3, 5, 8, 13]
**Sprint:** [Sprint number]
**Assigned To:** [Developer name]
**Status:** Backlog | In Progress | Review | Done

### Acceptance Criteria
- [ ] **Given** [context/precondition]
      **When** [action is taken]
      **Then** [expected outcome]
- [ ] **Given** [another context]
      **When** [another action]
      **Then** [another outcome]
- [ ] The feature works on mobile devices
- [ ] The feature is accessible (WCAG 2.1 AA compliant)
- [ ] Error messages are user-friendly
- [ ] Loading time is under 2 seconds

### Definition of Done
- [ ] Code is written and peer reviewed
- [ ] Unit tests written and passing (coverage > 80%)
- [ ] Integration tests passing
- [ ] Documentation updated
- [ ] UI/UX review completed
- [ ] Product Owner accepted
- [ ] Deployed to staging environment
- [ ] No critical bugs

### Technical Notes
- API endpoint: `POST /api/v1/[resource]`
- Database changes: New column in users table
- Dependencies: Auth service must be updated first
- Performance consideration: Cache results

### Design Mockups
[Link to Figma/Sketch/Screenshots]

![Mockup](./mockups/story-001.png)

### Test Scenarios
1. **Happy Path:** User successfully completes action
2. **Error Case:** Invalid input shows error message
3. **Edge Case:** Maximum allowed values
4. **Security:** Unauthorized access is blocked

### Business Value
- **User Impact:** Reduces task time from 5 min to 30 sec
- **Business Metric:** Expected 20% increase in conversion
- **Cost Savings:** Eliminates need for manual process

---

## Story 2: [Story Title]

### User Story
**As a** [type of user]
**I want** [action/feature]
**So that** [benefit/value]

### Story Details
**ID:** US-002
**Priority:** Medium
**Story Points:** 5
**Dependencies:** US-001 must be completed first
**Status:** Backlog

### Acceptance Criteria
- [ ] **Given** I am on the dashboard
      **When** I click the export button
      **Then** I receive a CSV file with all my data
- [ ] **Given** I have no data
      **When** I try to export
      **Then** I see a meaningful message
- [ ] The export includes all visible columns
- [ ] The export handles special characters correctly
- [ ] File size is optimized (compressed if > 10MB)

### Definition of Done
[Standard DoD criteria]

### Sub-tasks
- [ ] Create export service
- [ ] Add export button to UI
- [ ] Implement CSV formatter
- [ ] Add progress indicator for large exports
- [ ] Write unit tests
- [ ] Update API documentation

---

## Story 3: Admin Configuration

### User Story
**As an** administrator
**I want** to configure user permissions
**So that** I can control access to sensitive features

### Story Details
**ID:** US-003
**Priority:** High
**Story Points:** 8
**Status:** Backlog

### Acceptance Criteria
- [ ] **Given** I am an admin
      **When** I access user management
      **Then** I can see all users and their current permissions
- [ ] **Given** I select a user
      **When** I change their role
      **Then** Their permissions update immediately
- [ ] **Given** I assign a role
      **When** The user logs in
      **Then** They only see features for their role
- [ ] Changes are audit logged
- [ ] Bulk operations are supported
- [ ] Cannot remove last admin

### Permissions Matrix
| Role | View | Create | Edit | Delete | Admin |
|------|------|--------|------|--------|-------|
| Viewer | ✓ | - | - | - | - |
| Editor | ✓ | ✓ | ✓ | - | - |
| Admin | ✓ | ✓ | ✓ | ✓ | ✓ |

---

## Story 4: API Integration

### User Story
**As a** developer
**I want** RESTful API endpoints
**So that** I can integrate this feature into other applications

### Story Details
**ID:** US-004
**Priority:** Medium
**Story Points:** 5
**Status:** Backlog

### Acceptance Criteria
- [ ] **Given** valid authentication
      **When** I call GET /api/v1/resource
      **Then** I receive paginated results in JSON
- [ ] **Given** invalid authentication
      **When** I make any API call
      **Then** I receive 401 Unauthorized
- [ ] All endpoints follow REST conventions
- [ ] API is documented in OpenAPI format
- [ ] Rate limiting is implemented (100 req/min)
- [ ] Responses include proper HTTP status codes

### API Endpoints
```yaml
GET    /api/v1/resources     # List all (paginated)
GET    /api/v1/resources/:id # Get single resource
POST   /api/v1/resources     # Create new
PUT    /api/v1/resources/:id # Update existing
DELETE /api/v1/resources/:id # Delete
```

---

## Story Template (Copy for New Stories)

### User Story
**As a** [type of user]
**I want** [action/feature]
**So that** [benefit/value]

### Story Details
**ID:** US-XXX
**Priority:** High | Medium | Low
**Story Points:** [1, 2, 3, 5, 8, 13]
**Status:** Backlog

### Acceptance Criteria
- [ ] **Given** [context]
      **When** [action]
      **Then** [outcome]

### Definition of Done
- [ ] Code complete and reviewed
- [ ] Tests written and passing
- [ ] Documentation updated
- [ ] Accepted by Product Owner

---

## Story Estimation Guide

| Story Points | Description | Example |
|--------------|-------------|---------|
| 1 | Trivial change | Update text, fix typo |
| 2 | Simple feature | Add basic field |
| 3 | Standard feature | CRUD operation |
| 5 | Complex feature | Multi-step workflow |
| 8 | Very complex | New subsystem |
| 13 | Extremely complex | Architectural change |

## Sprint Planning

### Current Sprint: [Sprint Name]
**Goal:** [Sprint goal]
**Capacity:** [Total story points]

| Story ID | Title | Points | Assigned | Status |
|----------|-------|--------|----------|--------|
| US-001 | [Title] | 3 | [Name] | In Progress |
| US-002 | [Title] | 5 | [Name] | Backlog |
| **Total** | | **8** | | |

### Backlog Prioritization
1. US-001 - Critical for launch
2. US-003 - Blocking other teams
3. US-002 - Nice to have
4. US-004 - Future sprint

---

## Dependencies and Risks

### Dependencies
| Story | Depends On | Type | Impact |
|-------|------------|------|--------|
| US-002 | US-001 | Technical | Cannot start until US-001 complete |
| US-003 | Auth Service | External | Needs new permissions API |

### Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| API changes | Medium | High | Version the API |
| Performance issues | Low | Medium | Load test early |

---

## Metrics and Reporting

### Velocity Tracking
| Sprint | Planned | Completed | Velocity |
|--------|---------|-----------|----------|
| Sprint 1 | 21 | 18 | 18 |
| Sprint 2 | 20 | 22 | 22 |
| Sprint 3 | 21 | [In Progress] | - |

### Burndown Chart
```
Points Remaining
25 |*
20 |  *
15 |    *
10 |      *
5  |        *
0  |__________*
   | M T W T F
   Days in Sprint
```

---

## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | [Date] | Initial stories | [Author] |
| 1.1 | [Date] | Updated priorities | [Author] |
```

## Version Control Integration

```bash
# Track user stories
echo "| user-stories-[feature] | Created | $(date +%Y-%m-%d) | [Sprint] |" >> USER_STORIES_TRACKING.md

# Commit
git add tasks/user-stories-[feature].md
git commit -m "User Stories: [Feature Name]

- Stories: [Number of stories]
- Total Points: [Sum of story points]
- Sprint: [Sprint name/number]"
```

## AI Assistant Instructions

The AI must:
1. Always use the standard "As a... I want... So that..." format
2. Include specific, testable acceptance criteria
3. Add clear definition of done
4. Estimate story points realistically
5. Consider edge cases and error scenarios
6. Include business value/impact
7. Break down large stories (> 8 points) into smaller ones

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `user-stories-[feature].md`