# 🏗️ Architecture Decision Record (ADR)

**Metadata**
- Last Updated: 2025-09-18
- Maintainer: AI-Dev Toolkit
- Related Docs: 01_prd.md, 03_generate_tasks.md, 04_process_task_list.md

> **🎯 Purpose**
> This ADR documents the architectural decisions for implementing the /new-project intelligent intake command within the vibe-prd system. These decisions balance user experience optimization, technical maintainability, and cross-platform compatibility for both Claude Code CLI and Cursor IDE.

---

## 📋 ADR Metadata

| Field | Value |
|-------|-------|
| **ADR Number** | ADR-001 |
| **Title** | Dual-Platform Intelligent Documentation Generation Architecture |
| **Status** | 🟢 Accepted |
| **Date** | 2025-09-18 |
| **Authors** | AI-Dev Toolkit Enhancement Team |
| **Reviewers** | Strategic Planning Team |
| **Stakeholders** | Claude CLI Users, Cursor IDE Users, Enterprise Customers |

### Status Definitions
- **🟡 Proposed:** Under discussion and review
- **🟢 Accepted:** Approved and ready for implementation
- **🔴 Deprecated:** No longer recommended for new implementations
- **🔄 Superseded:** Replaced by a newer ADR (link to replacement)

---

## 🎯 1. Context & Problem Statement

### 1.1 Business Context
The vibe-prd repository currently provides 22 professional templates through:
- **Dual AI Support:** Claude Code CLI one-paste workflow + Cursor IDE structured workflow
- **Individual Commands:** 4 separate commands (/create-prd, /create-adr, /generate-tasks, /process-tasks)
- **Template Library:** Static templates with {{DATE}} placeholders in `professional-templates/`
- **Form System:** Basic intake via `form-system/cli.js` with 7 hardcoded questions

### 1.2 Problem Statement
**Primary Challenge:** Transform static template library into intelligent documentation generator while maintaining cross-platform compatibility and zero-setup philosophy.

**Key Pain Points:**
- **User Friction:** 15+ minute setup time, cognitive overhead of question formulation
- **Command Sprawl:** Multiple separate commands reduce user experience flow
- **Platform Fragmentation:** Different workflows for Claude CLI vs Cursor IDE users
- **Template Coordination:** Manual cross-referencing between related documents
- **Market Position:** Risk of being overtaken by AI-first documentation tools

### 1.3 Decision Drivers
- **User Experience:** Single command should replace 4+ separate workflows
- **Platform Equity:** Both Claude CLI and Cursor IDE users deserve first-class experience
- **Maintainability:** Solution must be simple enough for community contributions
- **Performance:** Sub-30 second generation time for comprehensive documentation
- **Backwards Compatibility:** Cannot disrupt existing successful workflows

---

## 🏗️ 2. Architectural Decisions

### 2.1 **Decision 1: Dual-Platform Implementation Strategy**

#### **Problem**
How to support both Claude Code CLI conversational interface and Cursor IDE structured workflow without duplicating maintenance overhead?

#### **Options Considered**

**Option A: Claude CLI Only**
```markdown
Pros:
+ Leverages conversational AI strengths
+ Simpler single-platform maintenance
+ Natural questioning flow

Cons:
- Excludes significant Cursor IDE user base
- Platform lock-in reduces adoption
- Misses IDE-integrated workflow benefits
```

**Option B: Cursor IDE Only**
```markdown
Pros:
+ IDE-integrated file generation
+ Structured form-based approach
+ Visual feedback in editor

Cons:
- Loses conversational intelligence benefits
- Excludes Claude CLI power users
- Limited questioning adaptability
```

**Option C: Dual Implementation with Shared Logic**
```markdown
Pros:
+ Universal platform support
+ Platform-optimized user experiences
+ Shared template generation logic
+ Maximum market addressability

Cons:
- Two implementations to maintain
- Cross-platform testing complexity
- Documentation overhead
```

#### **Decision: Option C - Dual Implementation**

**Rationale:**
- **Market Opportunity:** AI documentation space is competitive; cannot exclude any major user segment
- **User Experience:** Each platform has distinct workflow expectations (conversational vs structured)
- **Technical Feasibility:** Shared template generation logic minimizes duplication
- **Strategic Value:** Platform diversity increases GitHub algorithm ranking factors

#### **Implementation Architecture**
```markdown
Claude Code CLI Implementation:
├── File: /home/jeremy/.claude/commands/new-project.md
├── Strategy: Conversational flow with intelligent questioning
├── Features: Real-time adaptation, natural language processing
└── Access: Direct /new-project command + GUI instructions

Cursor IDE Implementation:
├── File: .cursorrules/new-project.mdc
├── Strategy: Structured workflow with @-commands
├── Features: Form-like presentation, IDE integration
└── Access: @.cursorrules/new-project.mdc [description]

Shared Components:
├── Template Library: professional-templates/ (unchanged)
├── Generation Logic: Identical output across platforms
├── Metadata System: {{DATE}} replacement and cross-references
└── Quality Gates: Consistent validation and testing
```

---

### 2.2 **Decision 2: Intelligent Question Flow Architecture**

#### **Problem**
How to create adaptive questioning that provides appropriate documentation depth for different project types and user contexts?

#### **Options Considered**

**Option A: Static Question Trees**
```markdown
Pros:
+ Predictable and testable
+ Simple to implement and maintain
+ Clear user expectations

Cons:
- Inflexible for diverse use cases
- Cannot adapt to user responses
- Generic documentation output
```

**Option B: AI-Driven Dynamic Questioning**
```markdown
Pros:
+ Fully adaptive to user context
+ Natural conversation flow
+ High-quality personalized output

Cons:
- Unpredictable behavior
- Difficult to test and debug
- Potential for conversation dead-ends
```

**Option C: Structured Adaptive Branching**
```markdown
Pros:
+ Predictable branching logic
+ Adapts to user classification
+ Testable and maintainable
+ AI-enhanced follow-ups

Cons:
- More complex than static trees
- Requires careful design
- Medium implementation complexity
```

#### **Decision: Option C - Structured Adaptive Branching**

**Rationale:**
- **User Experience:** Balances personalization with predictability
- **Technical Feasibility:** Complex enough to be intelligent, simple enough to maintain
- **Quality Assurance:** Testable branching paths with defined outcomes
- **Scalability:** Easy to add new project types and audience categories

#### **Question Flow Architecture**
```mermaid
graph TD
    A[/new-project] --> B[Classification Questions - 3 total]
    B --> C{Project Type}
    C -->|Greenfield| D[Concept Validation Flow]
    C -->|Brownfield| E[Integration Impact Flow]
    D --> F{Audience Type}
    E --> F
    F -->|Startup| G[Lean Question Set - 5-7 questions]
    F -->|Business| H[Standard Question Set - 10-15 questions]
    F -->|Enterprise| I[Compliance Question Set - 15-20 questions]
    G --> J{Scope Selection}
    H --> J
    I --> J
    J -->|MVP| K[4 Foundation Templates]
    J -->|Standard| L[12 Strategic Templates]
    J -->|Comprehensive| M[22 Enterprise Templates]
```

#### **Implementation Details**
```yaml
Classification Questions (Phase 1):
  1. Starting Point: "Greenfield (new idea) vs Brownfield (existing system)"
  2. Audience: "Startup vs Business vs Enterprise"
  3. Scope: "MVP (4 docs) vs Standard (12 docs) vs Comprehensive (22 docs)"

Adaptive Flows (Phase 2):
  Greenfield + Startup:
    - Focus: Concept validation, MVP definition, resource constraints
    - Questions: 5-7 lean questions about problem, users, solution

  Brownfield + Enterprise:
    - Focus: Integration impact, compliance, audit requirements
    - Questions: 15-20 detailed questions about systems, regulations, risks

Smart Follow-ups (Phase 3):
  - IF response_length < 10_words: Ask clarifying follow-up
  - IF mentions_technical_terms: Ask about technical constraints
  - IF mentions_compliance: Ask about regulatory requirements
  - IF mentions_timeline: Ask about dependencies and risks
```

---

### 2.3 **Decision 3: Template Generation and Organization Strategy**

#### **Problem**
How to generate populated templates while preserving the integrity of the professional template library?

#### **Options Considered**

**Option A: Modify Templates In-Place**
```markdown
Pros:
+ Simple direct modification
+ Single source of truth

Cons:
- Corrupts clean template library
- Version control conflicts
- Cannot support multiple projects simultaneously
```

**Option B: Template Duplication Per Project**
```markdown
Pros:
+ Preserves original templates
+ Project-specific customization

Cons:
- Template bloat (22 × projects)
- Maintenance nightmare for updates
- Disk space inefficiency
```

**Option C: Dynamic Template Composition**
```markdown
Pros:
+ Preserves template library integrity
+ Infinite project variations
+ Maintainable template updates
+ Efficient storage

Cons:
- More complex generation logic
- Requires mapping system
```

#### **Decision: Option C - Dynamic Template Composition**

**Rationale:**
- **Template Integrity:** Never modifies source templates in professional-templates/
- **Scalability:** Can generate unlimited project variations from same base templates
- **Maintainability:** Template improvements benefit all future generations
- **Flexibility:** Supports different project types without template explosion

#### **Generation Architecture**
```python
# Template Generation Flow
def generate_project_documentation(user_responses, selected_templates, project_name):
    """
    Dynamic template composition without modifying source templates
    """
    project_dir = f"completed-docs/{project_name}/"
    create_directory(project_dir)

    for template in selected_templates:
        # Read base template from professional-templates/
        base_template = read_template(f"professional-templates/{template}")

        # Map user responses to template sections
        populated_template = populate_template(base_template, user_responses)

        # Replace {{DATE}} with current timestamp
        final_template = replace_date_placeholders(populated_template)

        # Generate cross-references to related docs
        final_template = add_cross_references(final_template, selected_templates)

        # Write populated template to project directory
        write_file(f"{project_dir}/{template}", final_template)

    # Generate project index and summary
    create_project_index(project_dir, selected_templates, user_responses)

    return project_dir
```

#### **Project Structure Output**
```markdown
completed-docs/{project-name}/
├── index.md                    # Project summary + navigation
├── 01_prd.md                   # Populated Product Requirements
├── 02_adr.md                   # Populated Architecture Decisions
├── 03_generate_tasks.md        # Populated Task Breakdown
├── 04_process_task_list.md     # Populated Task Management
├── [additional templates...]    # Based on scope selection
└── .metadata/                  # Generation audit trail
    ├── generation-log.json     # Timestamp, user inputs, templates used
    ├── user-responses.json     # Complete question/answer history
    └── template-mapping.json   # Response to template section mapping
```

---

### 2.4 **Decision 4: Cross-Platform Output Consistency**

#### **Problem**
How to ensure Claude CLI and Cursor IDE implementations produce identical, high-quality documentation?

#### **Decision: Shared Generation Engine with Platform-Specific Interfaces**

#### **Architecture**
```markdown
Platform-Specific Layer:
├── Claude CLI: Conversational question collection
├── Cursor IDE: Structured form-based collection
└── Both: Normalize to standard response format

Shared Generation Layer:
├── Response validation and enrichment
├── Template selection logic
├── Dynamic template composition
├── Cross-reference generation
├── Project structure creation
└── Quality validation

Output Layer:
├── Identical file structure across platforms
├── Consistent template population
├── Standardized metadata and cross-references
└── Platform-agnostic project directories
```

#### **Quality Assurance Strategy**
```yaml
Automated Testing:
  - Cross-platform output comparison tests
  - Template generation validation
  - {{DATE}} replacement accuracy
  - Cross-reference integrity checks

Manual Validation:
  - User acceptance testing on both platforms
  - Documentation quality scoring
  - Time-to-completion measurement
  - User satisfaction surveys
```

---

### 2.5 **Decision 5: GitHub Algorithm Optimization Integration**

#### **Problem**
How to integrate GitHub discoverability improvements without disrupting core functionality?

#### **Decision: Additive Enhancement Strategy**

#### **Repository Optimization Components**
```markdown
SEO Enhancement:
├── Repository description with trending keywords
├── Comprehensive GitHub topics for search
├── README.md optimization for algorithm ranking
└── Essential files (SECURITY.md, CODE_OF_CONDUCT.md)

Community Features:
├── GitHub issue templates for structured feedback
├── Pull request templates for contributions
├── Contributor recognition system
└── Template marketplace for community contributions

Growth Mechanisms:
├── GitHub Pages site with live demo
├── Social sharing integration
├── "Generated with vibe-prd" attribution
└── Team invitation and collaboration features
```

---

## 📊 3. Decision Consequences

### 3.1 Positive Outcomes

#### **User Experience**
- **Single Command:** /new-project replaces 4+ separate commands
- **Universal Access:** Both Claude CLI and Cursor IDE users supported
- **Intelligent Guidance:** Eliminates "what questions to ask" problem
- **Professional Output:** Maintains template quality while adding intelligence

#### **Technical Benefits**
- **Zero Breaking Changes:** Existing workflows preserved and functional
- **Maintainable Architecture:** Simple enough for community contributions
- **Scalable Design:** Easy to add new project types and templates
- **Quality Assurance:** Testable branching logic and output validation

#### **Business Impact**
- **Market Expansion:** Addresses both major AI coding platforms
- **Competitive Advantage:** First intelligent documentation generator with enterprise depth
- **Community Growth:** GitHub optimization drives organic discovery
- **Revenue Validation:** Tiered system enables freemium business model

### 3.2 Trade-offs Accepted

#### **Implementation Complexity**
- **Dual Platform Maintenance:** Two command implementations to maintain
- **Testing Overhead:** Cross-platform consistency requires additional validation
- **Documentation Burden:** User guides needed for both platforms

#### **Performance Considerations**
- **Generation Time:** Complex questioning may increase time-to-first-doc
- **Resource Usage:** Template composition requires more processing than static copying
- **Network Dependencies:** GitHub optimization features require online connectivity

### 3.3 Mitigation Strategies

#### **Complexity Management**
- **Shared Logic:** Template generation engine used by both platforms
- **Automated Testing:** Comprehensive test suite for all branching paths
- **Clear Separation:** Platform interface layer separate from core logic

#### **Performance Optimization**
- **Caching:** Template reading and parsing optimization
- **Progressive Enhancement:** Core functionality works offline, enhancements require connectivity
- **User Control:** Users can skip optional features for faster generation

---

## 🔄 4. Implementation Plan

### 4.1 Development Phases

#### **Phase 1: Foundation (Week 1)**
```markdown
Repository Infrastructure:
├── GitHub optimization (description, topics, essential files)
├── Documentation restructuring (README.md, user guides)
├── CI/CD pipeline setup (automated testing, quality gates)
└── Community features (issue templates, contribution guidelines)
```

#### **Phase 2: Core Implementation (Week 2)**
```markdown
Command Development:
├── Claude CLI /new-project command implementation
├── Cursor IDE .cursorrules/new-project.mdc integration
├── Shared template generation engine
├── Cross-platform testing and validation
└── User guide creation for both platforms
```

#### **Phase 3: Advanced Features (Week 3)**
```markdown
Enhancement Layer:
├── GitHub Pages site with live demo
├── Export capabilities (PDF, Confluence)
├── Analytics and metrics collection
├── Performance optimization and caching
└── Integration testing and quality assurance
```

#### **Phase 4: Launch and Growth (Week 4)**
```markdown
Community and Marketing:
├── Template marketplace development
├── Social sharing and viral mechanisms
├── Partnership integrations (Anthropic, Cursor)
├── Content marketing and community engagement
└── Success metrics tracking and optimization
```

### 4.2 Quality Gates

#### **Week 1 Validation**
- [ ] Repository description optimized with trending keywords
- [ ] All essential GitHub files created and compliant
- [ ] README.md rewritten for algorithm optimization
- [ ] CI/CD pipeline functional with automated testing

#### **Week 2 Validation**
- [ ] /new-project command functional on both platforms
- [ ] Cross-platform output consistency validated
- [ ] User completion rate >90% for MVP tier
- [ ] Documentation quality score >4.5/5

#### **Week 3 Validation**
- [ ] GitHub Pages site live with functional demo
- [ ] Export capabilities tested and working
- [ ] Performance benchmarks met (<30s for 22 docs)
- [ ] Integration testing passed

#### **Week 4 Validation**
- [ ] Community features deployed and functional
- [ ] Social sharing mechanisms active
- [ ] Success metrics dashboard operational
- [ ] Target: #1 trending in AI documentation space

---

## 📚 5. Related Decisions and Future Considerations

### 5.1 Dependencies

#### **External Dependencies**
- **Claude Code CLI:** Command system must remain stable and accessible
- **Cursor IDE:** .cursorrules/ system must continue supporting custom workflows
- **GitHub Platform:** Algorithm and features must remain compatible with optimization strategy

#### **Internal Dependencies**
- **Template Library:** professional-templates/ structure must remain consistent
- **Form System:** form-system/cli.js should remain available for advanced users
- **Documentation:** CLAUDE.md and README.md must stay current with new features

### 5.2 Future ADRs

#### **Potential Future Decisions**
- **ADR-002:** Template Marketplace Architecture (if community contributions grow)
- **ADR-003:** Enterprise SSO and Compliance Features (if enterprise adoption validates)
- **ADR-004:** API and Webhook Integration Strategy (if programmatic access needed)
- **ADR-005:** Multi-language Template Support (if international adoption grows)

### 5.3 Review and Evolution

#### **Review Triggers**
- User feedback indicates significant UX improvements needed
- Template library undergoes major restructuring
- Claude CLI or Cursor IDE architecture changes significantly
- Competitive landscape shifts require feature parity

#### **Success Metrics for Architecture Review**
- **Performance:** Command execution consistently <30 seconds for comprehensive docs
- **Reliability:** >99% successful template generation rate across both platforms
- **Maintainability:** New features require <2 days implementation time
- **User Adoption:** >70% of new users choose /new-project over individual commands

---

**This ADR establishes the architectural foundation for transforming vibe-prd into the leading AI documentation generator through intelligent user experience, cross-platform compatibility, and strategic GitHub optimization.**