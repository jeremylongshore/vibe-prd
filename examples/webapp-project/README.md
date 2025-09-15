# TaskFlow Web Application

**Example project demonstrating complete ai-dev pipeline integration**

## Overview

This is a React/TypeScript web application that demonstrates how to integrate the vibe-prd AI development workflow system. The project includes a complete ai-dev pipeline with realistic documentation for a user authentication system.

## Project Structure

```
webapp-project/
├── ai-dev/                    # AI development pipeline
│   ├── README.md             # Pipeline status tracker
│   ├── docs/                 # Working documents
│   │   ├── claude.md         # AI agent guidance
│   │   ├── prd.md           # Product Requirements Document
│   │   ├── adr-001.md       # Architecture Decision Record
│   │   ├── tech-spec.md     # Technical Specification
│   │   ├── tasks.md         # Implementation Tasks
│   │   └── api-spec.md      # API Documentation
│   ├── sop/                  # Standard Operating Procedures
│   └── templates/            # Link to vibe-prd templates
├── src/                      # Application source code
├── public/                   # Static assets
├── package.json              # Project dependencies
├── Makefile                  # AI-dev automation
└── README.md                 # This file
```

## AI-Dev Pipeline Integration

This project demonstrates the complete vibe-prd workflow:

### 1. Documentation-First Development
- **PRD:** Complete user authentication requirements
- **ADR:** Architecture decisions for React + Node.js + PostgreSQL
- **Tech Spec:** Detailed implementation specifications
- **Tasks:** Granular implementation breakdown

### 2. Template Usage
All documents created from vibe-prd professional templates:
- `ai-dev/templates/create-prd.md` → `ai-dev/docs/prd.md`
- `ai-dev/templates/adr-template.md` → `ai-dev/docs/adr-001.md`
- `ai-dev/templates/create-tech-spec.md` → `ai-dev/docs/tech-spec.md`

### 3. Pipeline Automation
```bash
# Check pipeline status
make status

# Create new documents from templates
make create T=create-prd.md N=feature-dashboard.md
make create T=adr-template.md N=adr-002-state-management.md

# List available templates
make list-templates
```

## Getting Started

### Prerequisites
- Node.js 18+
- npm or yarn

### Installation
```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Check AI-dev pipeline
npm run ai-dev:status
```

### Using the AI-Dev Pipeline

1. **Review existing documentation:**
   ```bash
   cat ai-dev/docs/prd.md        # See example PRD
   cat ai-dev/docs/adr-001.md    # See architecture decisions
   ```

2. **Create new features:**
   ```bash
   make create T=create-prd.md N=feature-dashboard.md
   # Edit ai-dev/docs/feature-dashboard.md
   # Update ai-dev/README.md checklist
   ```

3. **Follow the workflow:**
   - Start with PRD (business requirements)
   - Create ADR (architecture decisions)
   - Write tech spec (implementation details)
   - Generate tasks (work breakdown)
   - Implement with AI assistance

## Example Documents

This project includes realistic examples of:

- **Product Requirements Document** - Complete user authentication specification
- **Architecture Decision Record** - Technology stack selection rationale
- **Technical Specification** - Implementation details and API design
- **Task Breakdown** - Granular development tasks
- **Standard Operating Procedures** - Team workflow documentation

## Learning Objectives

By studying this example, you'll learn:

1. **How to integrate ai-dev pipeline** into existing projects
2. **Template-driven development** with professional documentation
3. **Human-AI collaboration patterns** for feature development
4. **Documentation-first workflow** that scales with teams
5. **Quality gates and review processes** for AI-assisted development

## Integration with Development

### Git Workflow
```bash
# Feature development with ai-dev
git checkout -b feature/user-dashboard
make create T=create-prd.md N=dashboard-prd.md
# Document first, then implement
git add ai-dev/docs/dashboard-prd.md
git commit -m "docs: add PRD for user dashboard"
# Continue with implementation...
```

### Team Collaboration
- **Product Manager:** Creates PRDs, reviews business requirements
- **Tech Lead:** Creates ADRs, reviews architecture decisions
- **Developers:** Create tech specs and task breakdowns
- **QA:** Creates test plans, validates acceptance criteria

## Benefits Demonstrated

- ✅ **Consistent Documentation** - Professional format across all documents
- ✅ **Clear Requirements** - Detailed specifications before implementation
- ✅ **Architecture Decisions** - Recorded rationale for future reference
- ✅ **Task Breakdown** - Manageable work items with clear acceptance criteria
- ✅ **Quality Gates** - Review points prevent scope creep and ensure quality
- ✅ **Team Alignment** - Shared understanding through comprehensive documentation

## Related Resources

- **vibe-prd:** https://github.com/jeremylongshore/vibe-prd
- **Setup Guide:** [../../docs/PROJECT_PIPELINE.md](../../docs/PROJECT_PIPELINE.md)
- **Methodology:** [../../METHODOLOGY.md](../../METHODOLOGY.md)
- **Human-AI Collaboration:** [../../HUMAN_AI_COLLABORATION.md](../../HUMAN_AI_COLLABORATION.md)

---

**This is an example project for demonstration purposes.**
**Use it as a template for your own ai-dev pipeline integration.**