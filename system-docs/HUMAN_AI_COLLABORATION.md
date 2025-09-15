# Human-AI Collaboration Patterns

## Collaboration Models

### AI-First Development
**When:** New features, greenfield projects, well-understood domains
**Human Role:** Direction setting, review, approval
**AI Role:** Document generation, task breakdown, implementation

**Workflow:**
1. Human provides business requirements and context
2. AI generates PRD using template → Human reviews/refines
3. AI creates architecture decisions → Human approves
4. AI generates technical specification → Human validates
5. AI breaks down into tasks → Human prioritizes
6. AI implements incrementally → Human reviews each increment

**Quality Gates:** PRD approval, architecture approval, spec validation, task prioritization

### Human-First Development
**When:** Complex business logic, legacy systems, high-risk changes
**Human Role:** Design leadership, detailed specification, oversight
**AI Role:** Documentation assistance, implementation support

**Workflow:**
1. Human designs architecture and creates ADRs
2. Human defines detailed business requirements
3. AI assists with technical specification details
4. Human reviews and approves all technical decisions
5. AI generates implementation tasks with human oversight
6. Collaborative implementation with human guidance

**Quality Gates:** Human-led design review, technical specification approval, implementation oversight

### Pair Development
**When:** Learning scenarios, complex problems, critical systems
**Human Role:** Real-time collaboration, decision making, knowledge transfer
**AI Role:** Code generation, suggestions, documentation, pattern recognition

**Workflow:**
1. Human and AI collaborate on requirements in real-time
2. Immediate feedback and iteration on all documents
3. Shared decision making with human having final authority
4. AI suggests patterns and approaches, human validates
5. Continuous review and adjustment throughout process

**Quality Gates:** Continuous review, real-time validation, shared understanding

## Role Clarity

### Human Responsibilities
- Business context and domain expertise
- Strategic decisions and trade-offs
- Quality standards and acceptance criteria
- Security and compliance requirements
- Final approval on all architectural decisions

### AI Responsibilities
- Template-based document generation
- Comprehensive technical specifications
- Detailed task breakdown and estimation
- Pattern recognition and best practice application
- Consistency maintenance across documents

## Success Patterns
- Clear handoff points between human and AI work
- Explicit approval gates before moving to next phase
- Regular context refresh for AI understanding
- Documentation-first approach to all development
- Iterative refinement based on human feedback