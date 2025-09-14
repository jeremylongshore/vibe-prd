# Rule: Generating an RFC (Request for Comments) Document

## Goal

To guide an AI assistant in creating a detailed Request for Comments (RFC) document for proposing major changes or new features. The RFC should facilitate discussion and gather feedback before implementation.

## Process

1. **Receive Initial Proposal:** The user provides a brief description of the proposed change or feature.
2. **Ask Clarifying Questions:** Before writing the RFC, the AI *must* ask clarifying questions to understand the proposal fully. Provide options in letter/number lists for easy response.
3. **Generate RFC:** Based on the initial proposal and answers, generate an RFC using the structure below.
4. **Save RFC:** Save the generated document as `rfc-[number]-[title].md` inside the `/tasks` directory.
5. **Create Version Control Entry:** Add an entry to `RFC_TRACKING.md` with timestamp and status.

## Clarifying Questions (LLM Must Ask)

**Technical Context:**
1. What problem does this change solve?
   - A) Performance issue
   - B) Security vulnerability
   - C) User experience problem
   - D) Technical debt
   - E) Other (specify)

2. What is the scope of impact?
   - A) Single component
   - B) Multiple components
   - C) Entire system
   - D) External integrations

3. Are there backward compatibility concerns?
   - A) Yes, breaking changes expected
   - B) No, fully backward compatible
   - C) Partially compatible with migration path

**Implementation Details:**
4. What is the estimated effort?
   - A) Days (1-5)
   - B) Weeks (1-4)
   - C) Months (1-3)
   - D) Quarters (3+ months)

5. What alternatives have been considered?
   - Please list at least 2 alternatives

## RFC Structure

```markdown
# RFC-[NUMBER]: [Title]

**Author:** [Name/AI Assistant]
**Created:** [YYYY-MM-DD HH:MM]
**Status:** Draft | Under Review | Accepted | Rejected | Superseded
**Discussion:** [Link to discussion thread/PR]
**Implementation PR:** [Link when available]
**Version:** 1.0

## Summary

[One paragraph explanation of the proposal - what are we doing and why?]

## Motivation

[Why are we doing this? What problem does it solve? What use cases does it support?]

## Detailed Design

[This is the technical meat of the RFC. Explain the design in enough detail for someone familiar with the codebase to understand and implement. Include:
- API changes
- Data model changes
- Algorithm details
- Migration strategy]

## Implementation Timeline

| Phase | Description | Duration | Dependencies |
|-------|-------------|----------|--------------|
| 1 | [Phase description] | [X days] | [Dependencies] |
| 2 | [Phase description] | [X days] | [Phase 1] |

## Drawbacks

[Why should we NOT do this? Be honest about downsides.]

## Alternatives

### Alternative 1: [Name]
[Description of alternative approach]
**Pros:** [List pros]
**Cons:** [List cons]
**Why not chosen:** [Reasoning]

### Alternative 2: [Name]
[Description of alternative approach]
**Pros:** [List pros]
**Cons:** [List cons]
**Why not chosen:** [Reasoning]

## Prior Art

[Are there existing solutions we can learn from? Links to similar implementations.]

## Unresolved Questions

- [ ] [Question 1 that needs to be answered]
- [ ] [Question 2 that needs to be answered]

## Security Considerations

[Any security implications? Authentication, authorization, data privacy concerns?]

## Performance Impact

[Expected performance impact - benchmarks if available]

## Testing Strategy

[How will this be tested? Unit tests, integration tests, performance tests?]

## Documentation Requirements

[What documentation needs to be created or updated?]

## Rollback Plan

[If this goes wrong, how do we rollback? What's the mitigation strategy?]

## Success Metrics

[How do we measure if this was successful?]

## References

- [Link to relevant documentation]
- [Link to related RFCs]
- [External resources]

---

## Discussion Log

### [YYYY-MM-DD] - [Reviewer Name]
[Comments and feedback]

**Response:** [Author response]

### [YYYY-MM-DD] - [Reviewer Name]
[Comments and feedback]

**Response:** [Author response]

---

## Version History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.0 | [Date] | Initial draft | [Author] |
| 1.1 | [Date] | [Changes made] | [Author] |
```

## Version Control Integration

After generating the RFC, the AI must:

1. **Create tracking entry:**
```bash
echo "| RFC-[NUMBER] | [Title] | Draft | $(date +%Y-%m-%d) | [Author] |" >> RFC_TRACKING.md
```

2. **Commit the RFC:**
```bash
git add tasks/rfc-[number]-[title].md RFC_TRACKING.md
git commit -m "RFC-[NUMBER]: [Title]

- Status: Draft
- Author: [Name]
- Summary: [One line summary]"
```

3. **Create a branch for discussion (optional):**
```bash
git checkout -b rfc-[number]-discussion
git push -u origin rfc-[number]-discussion
```

## AI Assistant Instructions

When working with RFCs, the AI must:

1. Always ask the clarifying questions before generating
2. Include specific technical details, not vague descriptions
3. Be honest about drawbacks and alternatives
4. Generate realistic timelines based on scope
5. Include concrete success metrics
6. Update RFC_TRACKING.md with each status change
7. Preserve discussion log when updating RFC versions

## Target Audience

RFCs are read by **technical team members** who will review, discuss, and potentially implement the proposal.

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `rfc-[number]-[title].md`
- **Tracking File:** `RFC_TRACKING.md`

## Status Workflow

```
Draft → Under Review → [Accepted/Rejected]
                ↓
            Superseded (if replaced by new RFC)
```

## Example Usage

User: "Create an RFC for implementing a caching layer"

AI: *Asks clarifying questions, then generates:*
`tasks/rfc-001-caching-layer.md`