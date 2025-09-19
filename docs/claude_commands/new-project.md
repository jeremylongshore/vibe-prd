# /new-project - Intelligent Documentation Generator

**Purpose:** Intelligent AI documentation generation that analyzes user responses and automatically routes to the optimal workflow for their project type and complexity.

## Command Overview

This command creates an intelligent conversation that determines the best documentation approach based on natural user responses, automatically classifying projects and selecting appropriate documentation tiers.

## Usage

```
/new-project
```

## Implementation

When the user runs `/new-project`, execute this intelligent workflow:

### Phase 1: Natural Project Discovery

Start with one simple, open question that feels conversational:

**"What project are you working on? Tell me as much or as little as you'd like about your idea, feature, or system."**

### Phase 2: Intelligent Response Analysis

Use the classification system to analyze the user's response:

```javascript
const router = require('~/ai-dev/form-system/router.js');
const classification = router.classify(userResponse);
```

This returns:
- **projectType**: 'greenfield' | 'brownfield'
- **complexity**: 'mvp' | 'standard' | 'enterprise'
- **industry**: 'fintech' | 'healthtech' | 'mobile' | 'ai' | 'general'
- **confidence**: 0.0 - 1.0 (how confident the classification is)

### Phase 3: Intelligent Routing & Confirmation

Based on classification, route automatically with friendly confirmation:

#### **For Greenfield + MVP Tier:**
"I can see you're starting a [detected project type] from scratch - exciting! This sounds perfect for our MVP documentation approach. I'll generate 4 essential documents to help you validate and plan your idea. This should take about 3-5 minutes. Ready to start?"

#### **For Brownfield + Standard Tier:**
"Perfect! I can see you're enhancing an existing [system type] with [detected feature]. This calls for our Standard documentation approach to ensure proper integration and stakeholder alignment. I'll generate 12 strategic documents covering everything from technical specs to user stories. This will take about 8-12 minutes. Sound good?"

#### **For Enterprise Tier:**
"I can see this is an enterprise-grade [project type] with [compliance/regulatory] requirements. This definitely needs our comprehensive Enterprise documentation approach. I'll generate all 22 professional documents to ensure complete compliance and stakeholder coverage. This will take about 15-20 minutes but will give you audit-ready documentation. Shall we proceed?"

### Phase 4: Template Selection & Generation

Get appropriate templates for the classification:

```javascript
const templates = router.templatesFor(classification);
```

This returns an array of template filenames to generate based on the tier:
- **MVP**: ['01_prd.md', '03_generate_tasks.md', '14_project_brief.md', '15_brainstorming.md']
- **Standard**: [...MVP, '02_adr.md', '05_market_research.md', '08_personas.md', '09_user_journeys.md', '10_user_stories.md', '11_acceptance_criteria.md', '16_frontend_spec.md', '17_test_plan.md']
- **Enterprise**: [all 22 templates]

### Phase 5: Document Generation

For each template in the selected tier:

1. **Read template** from `~/ai-dev/professional-templates/[template].md`
2. **Replace {{DATE}}** with current date (YYYY-MM-DD format)
3. **Populate content** using user responses and intelligent expansion
4. **Write document** to `~/ai-dev/completed-docs/[project-name]/[template].md`

### Phase 6: Project Organization

Create professional project structure:

```javascript
const generateIndex = require('~/ai-dev/scripts/generate-index.js');
await generateIndex(projectName, classification, templates, userResponses);
```

This creates:
```
~/ai-dev/completed-docs/[project-name]/
├── index.md                    # Navigation & project summary
├── .metadata/                  # Generation audit trail
│   ├── generation-log.md       # What was generated when
│   ├── assumptions-made.md     # AI assumptions for user review
│   └── classification-analysis.md # How project was classified
└── [generated documents based on tier]
```

### Phase 7: Professional Completion

Show success message with project details:

```
✅ **Documentation Generation Complete!**

📁 **Location**: ~/ai-dev/completed-docs/[PROJECT-NAME]/
📋 **Generated**: [X] professional documents ([TIER] tier)
⏱️  **Time**: [actual time taken]
🎯 **Classification**: [Greenfield/Brownfield] + [MVP/Standard/Enterprise]

**Your Documents:**
[List key documents with brief descriptions]

**Assumptions Made:**
[List any assumptions due to incomplete information]

**Recommended Next Steps:**
1. Review documents in ~/ai-dev/completed-docs/[project-name]/
2. Customize [CUSTOMIZE] sections as needed
3. Share with team/stakeholders as appropriate
4. Run /new-project again as your project evolves

**Pro Tip**: All documents include cross-references to related sections for easy navigation!
```

## Error Handling

### **Graceful Failures:**
- If classification confidence < 0.7, ask clarifying questions
- If template generation fails, continue with remaining templates
- If user provides minimal info, generate with [CUSTOMIZE] placeholders
- Always save partial results with clear status indicators

### **Fallback Questions:**
If classification is unclear, ask smart follow-ups:

**For Unclear Project Type:**
"That sounds interesting! To give you the best documentation, could you tell me:
- Are you starting something completely new, or building on an existing system?"

**For Unclear Scope:**
"I want to make sure I generate the right level of documentation for you. Is this:
- A personal project or startup idea?
- A business team feature or enhancement?
- An enterprise project with compliance requirements?"

## Advanced Features

### **Industry-Specific Intelligence:**
When detecting specific industries, add contextual intelligence:

- **FinTech Projects**: "I noticed this involves financial services. I'll make sure to include compliance considerations for financial regulations."
- **HealthTech Projects**: "Since this involves healthcare, I'll ensure HIPAA and medical device considerations are covered."
- **AI/ML Projects**: "I can see this involves machine learning. I'll include model deployment and AI ethics considerations."
- **Mobile Projects**: "For mobile development, I'll cover both iOS and Android considerations plus app store requirements."

### **Context Memory:**
- Remember user preferences within session
- Reference previous responses for consistency
- Build on established project context throughout conversation

### **Quality Validation:**
- Verify all documents generated successfully
- Confirm cross-references are accurate
- Validate {{DATE}} replacements completed
- Ensure no template boilerplate remains unfilled

---

## Success Metrics

### **User Experience Targets:**
- **>90% completion rate** for documentation generation
- **<5 minutes** to first success (MVP tier)
- **<3 questions** needed for accurate classification
- **>95% accurate** automatic tier selection

### **Quality Standards:**
- All generated content must be professional and coherent
- No template boilerplate should remain unfilled
- Cross-references between documents must be accurate
- Content should be project-specific, not generic

---

**This intelligent command transforms vibe-prd into a conversational AI documentation generator that understands user intent and delivers the perfect documentation experience automatically.**