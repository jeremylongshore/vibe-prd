# 📖 Document Guide: Who, What, When, Where, and Why

This guide explains each document type in the AI Dev Tasks toolkit, helping you understand when to use each one and why it matters.

---

## 📋 Planning Phase Documents

### PRD (Product Requirements Document)

**WHO Creates It:** Product Managers, Product Owners, Technical Leads
**WHO Reads It:** Everyone - developers, designers, QA, stakeholders

**WHAT It Contains:**
- Feature overview and goals
- User stories and use cases
- Functional requirements
- Success metrics
- Out of scope items

**WHEN to Create:**
- Before any development begins
- When proposing new features
- During product planning cycles

**WHERE It's Used:**
- Sprint planning meetings
- Development kickoffs
- Stakeholder reviews

**WHY It Matters:**
- Ensures everyone understands what's being built
- Prevents scope creep
- Provides clear success criteria
- Documents the "what" not the "how"

**Example Trigger:** "We need to add user authentication to our app"

---

### BRD (Business Requirements Document)

**WHO Creates It:** Business Analysts, Product Managers, Business Stakeholders
**WHO Reads It:** Executives, Finance, Department Heads, Technical Leaders

**WHAT It Contains:**
- Business objectives and goals
- ROI analysis and cost-benefit
- Stakeholder identification
- Success KPIs
- Budget and timeline

**WHEN to Create:**
- Before requesting budget
- When justifying new initiatives
- During annual planning
- Before PRD creation

**WHERE It's Used:**
- Executive presentations
- Budget meetings
- Board reviews
- Strategic planning

**WHY It Matters:**
- Justifies investment
- Aligns business and tech
- Provides measurable objectives
- Gets stakeholder buy-in

**Example Trigger:** "We need approval for a $100k project"

---

### RFC (Request for Comments)

**WHO Creates It:** Any team member proposing changes
**WHO Reads It:** Technical team, architects, senior developers

**WHAT It Contains:**
- Proposed technical change
- Motivation and context
- Detailed design
- Alternatives considered
- Open questions

**WHEN to Create:**
- Proposing architecture changes
- Suggesting new technologies
- Major refactoring plans
- Breaking changes

**WHERE It's Used:**
- Architecture reviews
- Team discussions
- Technical decision meetings
- Pull request discussions

**WHY It Matters:**
- Gets team consensus
- Documents alternatives
- Prevents costly mistakes
- Encourages collaboration

**Example Trigger:** "Should we migrate from REST to GraphQL?"

---

### Technical Specification

**WHO Creates It:** Technical Leads, Senior Developers, Architects
**WHO Reads It:** Development team, QA, DevOps

**WHAT It Contains:**
- System architecture
- API definitions
- Data models
- Performance requirements
- Implementation plan

**WHEN to Create:**
- After PRD approval
- Before coding begins
- For complex features
- When defining APIs

**WHERE It's Used:**
- Development planning
- Code reviews
- API documentation
- Testing planning

**WHY It Matters:**
- Provides implementation blueprint
- Defines technical boundaries
- Ensures scalability
- Documents technical decisions

**Example Trigger:** "How exactly will we implement this feature?"

---

## 🎨 Design Phase Documents

### Design Document

**WHO Creates It:** Software Architects, Senior Engineers
**WHO Reads It:** Development team, Technical reviewers

**WHAT It Contains:**
- High-level architecture
- Component interactions
- Data flow diagrams
- Technology choices
- Security considerations

**WHEN to Create:**
- New system design
- Major architectural changes
- Before implementation
- During system planning

**WHERE It's Used:**
- Design reviews
- Architecture meetings
- Onboarding documentation
- Technical discussions

**WHY It Matters:**
- Visualizes system design
- Identifies potential issues
- Guides implementation
- Documents architecture

**Example Trigger:** "Design a microservices architecture"

---

### API Specification

**WHO Creates It:** Backend Developers, API Designers
**WHO Reads It:** Frontend Developers, External Partners, QA

**WHAT It Contains:**
- Endpoint definitions
- Request/response formats
- Authentication methods
- Error codes
- Rate limits

**WHEN to Create:**
- Designing new APIs
- Before frontend development
- For external integrations
- API versioning

**WHERE It's Used:**
- API documentation
- Integration planning
- Client development
- Testing

**WHY It Matters:**
- Enables parallel development
- Provides integration contract
- Reduces miscommunication
- Supports external users

**Example Trigger:** "Define our REST API endpoints"

---

### Database Schema

**WHO Creates It:** Database Architects, Backend Developers
**WHO Reads It:** Developers, DBAs, Data Analysts

**WHAT It Contains:**
- Table structures
- Relationships (ERD)
- Indexes
- Constraints
- Migration scripts

**WHEN to Create:**
- New database design
- Schema changes
- Performance optimization
- Data modeling

**WHERE It's Used:**
- Database creation
- Migration planning
- Performance tuning
- Documentation

**WHY It Matters:**
- Ensures data integrity
- Optimizes performance
- Documents data model
- Guides development

**Example Trigger:** "Design the database for user management"

---

## 💻 Development Phase Documents

### User Stories

**WHO Creates It:** Product Owners, Business Analysts
**WHO Reads It:** Developers, QA, Product Team

**WHAT It Contains:**
- User persona
- Desired action
- Expected benefit
- Acceptance criteria
- Definition of done

**WHEN to Create:**
- Sprint planning
- Backlog grooming
- Feature definition
- Agile development

**WHERE It's Used:**
- Sprint boards
- Development tasks
- Testing scenarios
- Sprint reviews

**WHY It Matters:**
- Focuses on user value
- Defines completion
- Enables estimation
- Guides development

**Example Trigger:** "As a user, I want to..."

---

### Test Plans

**WHO Creates It:** QA Engineers, Test Leads
**WHO Reads It:** QA Team, Developers, Product Owners

**WHAT It Contains:**
- Test objectives
- Test scenarios
- Test cases
- Expected results
- Test data

**WHEN to Create:**
- Before testing begins
- After requirements defined
- For regression testing
- Release planning

**WHERE It's Used:**
- Testing execution
- Bug tracking
- Release criteria
- Quality gates

**WHY It Matters:**
- Ensures quality
- Prevents bugs
- Documents testing
- Validates requirements

**Example Trigger:** "How will we test this feature?"

---

### Task Lists

**WHO Creates It:** Technical Leads, AI Assistants (from PRDs)
**WHO Reads It:** Developers, Project Managers

**WHAT It Contains:**
- Parent tasks
- Sub-tasks
- Dependencies
- Time estimates
- Assignees

**WHEN to Create:**
- After tech spec
- Sprint planning
- Project breakdown
- From PRDs

**WHERE It's Used:**
- Project management
- Sprint planning
- Progress tracking
- Daily standups

**WHY It Matters:**
- Breaks down complexity
- Enables tracking
- Identifies dependencies
- Facilitates planning

**Example Trigger:** "Break down this PRD into tasks"

---

## 🔧 Operations Phase Documents

### Runbook

**WHO Creates It:** DevOps Engineers, SREs
**WHO Reads It:** Operations Team, On-call Engineers

**WHAT It Contains:**
- Service overview
- Deployment procedures
- Monitoring setup
- Troubleshooting guides
- Emergency contacts

**WHEN to Create:**
- Before production deployment
- New service launch
- After incidents
- Operations handoff

**WHERE It's Used:**
- Production operations
- Incident response
- On-call rotations
- Training

**WHY It Matters:**
- Enables 24/7 operations
- Reduces MTTR
- Documents procedures
- Ensures consistency

**Example Trigger:** "How do we operate this service?"

---

### Post-Mortem

**WHO Creates It:** Incident Commander, Team Lead
**WHO Reads It:** Entire team, Management, Stakeholders

**WHAT It Contains:**
- Incident timeline
- Root cause analysis
- Impact assessment
- Lessons learned
- Action items

**WHEN to Create:**
- After major incidents
- Service outages
- Data loss events
- Security breaches

**WHERE It's Used:**
- Team retrospectives
- Process improvement
- Training materials
- Compliance records

**WHY It Matters:**
- Prevents recurrence
- Improves systems
- Documents learning
- Builds resilience

**Example Trigger:** "The service was down for 2 hours"

---

### SOP (Standard Operating Procedure)

**WHO Creates It:** Operations Managers, Team Leads
**WHO Reads It:** Operations Team, New Hires

**WHAT It Contains:**
- Step-by-step procedures
- Required tools
- Safety considerations
- Quality checks
- Escalation paths

**WHEN to Create:**
- Standardizing processes
- Compliance requirements
- Training documentation
- Process improvement

**WHERE It's Used:**
- Daily operations
- Training programs
- Audit compliance
- Process execution

**WHY It Matters:**
- Ensures consistency
- Reduces errors
- Facilitates training
- Maintains quality

**Example Trigger:** "Document the deployment process"

---

## 🏗️ Architecture Documents

### ADR (Architecture Decision Record)

**WHO Creates It:** Software Architects, Technical Leads
**WHO Reads It:** Development Team, Future Maintainers

**WHAT It Contains:**
- Decision context
- Options considered
- Decision made
- Consequences
- Status

**WHEN to Create:**
- Major technical decisions
- Technology selections
- Architecture changes
- Pattern adoption

**WHERE It's Used:**
- Code reviews
- Architecture reviews
- Onboarding
- Technical debt discussions

**WHY It Matters:**
- Documents "why" decisions
- Prevents revisiting
- Helps new team members
- Tracks technical evolution

**Example Trigger:** "Why did we choose PostgreSQL over MongoDB?"

---

## 📊 Project Management Documents

### Project Charter

**WHO Creates It:** Project Managers, Sponsors
**WHO Reads It:** Stakeholders, Team Members, Executives

**WHAT It Contains:**
- Project vision
- Objectives and scope
- Stakeholders
- Timeline and budget
- Success criteria

**WHEN to Create:**
- Project initiation
- New initiatives
- Major undertakings
- Resource allocation

**WHERE It's Used:**
- Kickoff meetings
- Stakeholder alignment
- Resource planning
- Progress reviews

**WHY It Matters:**
- Authorizes project
- Aligns stakeholders
- Defines boundaries
- Sets expectations

**Example Trigger:** "Launch a new product line"

---

### RACI Matrix

**WHO Creates It:** Project Managers, Team Leads
**WHO Reads It:** All team members, Stakeholders

**WHAT It Contains:**
- Tasks/deliverables
- Team members
- Responsibility levels
  - R: Responsible
  - A: Accountable
  - C: Consulted
  - I: Informed

**WHEN to Create:**
- Project planning
- Team formation
- Role clarification
- Process definition

**WHERE It's Used:**
- Project planning
- Communication plans
- Escalation paths
- Performance reviews

**WHY It Matters:**
- Clarifies roles
- Prevents gaps/overlaps
- Improves communication
- Reduces confusion

**Example Trigger:** "Who's responsible for what?"

---

### Risk Register

**WHO Creates It:** Project Managers, Risk Managers
**WHO Reads It:** Stakeholders, Team Leads, Executives

**WHAT It Contains:**
- Risk identification
- Probability/impact
- Mitigation strategies
- Risk owners
- Contingency plans

**WHEN to Create:**
- Project planning
- Risk assessments
- Quarterly reviews
- Change management

**WHERE It's Used:**
- Risk reviews
- Project meetings
- Status reports
- Decision making

**WHY It Matters:**
- Proactive management
- Reduces surprises
- Informs decisions
- Protects project

**Example Trigger:** "What could go wrong?"

---

## 🎯 Quick Decision Matrix

| If You Need To... | Use This Document |
|-------------------|-------------------|
| Define what to build | PRD |
| Justify business value | BRD |
| Propose technical change | RFC |
| Detail implementation | Tech Spec |
| Design system architecture | Design Doc |
| Define APIs | API Spec |
| Model data | Database Schema |
| Track development tasks | Task List |
| Define user requirements | User Stories |
| Plan testing | Test Plan |
| Document operations | Runbook |
| Analyze incidents | Post-Mortem |
| Standardize procedures | SOP |
| Record decisions | ADR |
| Initiate project | Project Charter |
| Assign responsibilities | RACI Matrix |
| Track risks | Risk Register |

---

## 📈 Document Progression

```
Business Need
    ↓
BRD (Business Requirements)
    ↓
PRD (Product Requirements)
    ↓
RFC (if needed for technical decisions)
    ↓
Tech Spec (Technical Implementation)
    ↓
Design Doc (Architecture)
    ↓
Task Lists (Development Tasks)
    ↓
Test Plans (Quality Assurance)
    ↓
Runbook (Operations)
    ↓
Post-Mortem (When things go wrong)
```

---

## 💡 Best Practices

1. **Start with Why**: Always begin with business value (BRD)
2. **Document Decisions**: Use ADRs for important choices
3. **Plan Before Building**: PRD → Tech Spec → Tasks
4. **Think Operations Early**: Create runbooks before deployment
5. **Learn from Failures**: Always do post-mortems
6. **Keep Updated**: Documents are living artifacts
7. **Version Control Everything**: Use Git for all documents

---

*Remember: The best documentation is the one that gets used. Choose the right document for the right purpose!*