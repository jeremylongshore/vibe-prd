# Project Pipeline Setup

## Overview

Add ai-dev pipeline to a single existing project. This mode is perfect for:

- Adding structured AI workflow to existing projects
- Teams wanting to try vibe-prd on one project first
- Projects that need customized template configurations

## Setup Process

### 1. Navigate to Your Project

```bash
cd your-existing-project
```

### 2. Run Project Setup

```bash
curl -sSL https://raw.githubusercontent.com/jeremylongshore/vibe-prd/main/setup-scripts/setup-project.sh | bash
```

Or manually:
```bash
git clone https://github.com/jeremylongshore/vibe-prd /tmp/vibe-prd
/tmp/vibe-prd/setup-scripts/setup-project.sh
```

### 3. Choose Template Method

The setup script offers three options:
1. **Symlink** - Links to vibe-prd installation (best for local development)
2. **Copy** - Copies templates into project (portable, no external dependencies)
3. **Git Submodule** - Links via git submodule (best for team collaboration)

## Document Lifecycle

### Phase 1: Planning
1. **PRD** - Define what you're building and why
2. **ADR** - Make architecture decisions with rationale
3. **Tech Spec** - Detail the technical implementation

### Phase 2: Implementation
4. **Tasks** - Break work into manageable chunks
5. **API Spec** - Define interfaces and contracts
6. **Database Schema** - Design data structures

### Phase 3: Quality
7. **Test Plan** - Strategy for validation
8. **Runbook** - Operations and deployment
9. **Risk Register** - Identify and mitigate risks

## Required Documents Checklist

For a complete ai-dev pipeline, ensure you have:

- [ ] **PRD** (Product Requirements Document) - Business requirements
- [ ] **ADR-001** (Architecture Decision Record) - Core technical decisions
- [ ] **Tech Spec** (Technical Specification) - Implementation details
- [ ] **Tasks** (Task Breakdown) - Work items with estimates
- [ ] **API Spec** (API Documentation) - Interface contracts
- [ ] **Test Plan** (Testing Strategy) - Quality assurance approach
- [ ] **Runbook** (Operations Guide) - Deployment and maintenance
- [ ] **Risk Register** (Risk Management) - Risk identification and mitigation
- [ ] **SOP** (Standard Operating Procedures) - Team processes
- [ ] **Database Schema** (Data Design) - Data structures and relationships

## Integration with Development

### Git Workflow
```bash
# Start feature development
git checkout -b feature/user-auth

# Create documentation first
make create T=create-prd.md N=user-auth-prd.md
# Edit and commit PRD
git add ai-dev/docs/user-auth-prd.md
git commit -m "docs: add PRD for user authentication"

# Continue with architecture decisions
make create T=adr-template.md N=adr-003-auth-strategy.md
# Edit and commit ADR
git add ai-dev/docs/adr-003-auth-strategy.md
git commit -m "docs: add ADR for authentication strategy"

# Generate implementation tasks
make create T=generate-tasks.md N=user-auth-tasks.md
# Break down work and commit
git add ai-dev/docs/user-auth-tasks.md
git commit -m "docs: add implementation tasks for user auth"

# Implement feature...
# Commit code changes...

# Update documentation as needed
```

### Review Cadence

- **Weekly:** Review pipeline status across all features
- **Per Feature:** Complete documentation before implementation
- **Per Sprint:** Update risk register and test plans
- **Monthly:** Review and update standard procedures