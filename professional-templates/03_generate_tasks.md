# Task Generation (from PRD)
**Last Updated:** {{DATE}}  
**Maintainer:** AI-Dev Toolkit  
**Upstream (BMAD):** story-tmpl.yaml / qa-gate-tmpl.yaml  
**Cross-links:** Uses 01_prd.md → feeds 04_process_task_list.md

## Inputs
- PRD sections → features → user stories

## Method
1) For each PRD feature, write user story(ies)  
2) Add acceptance criteria (testable)  
3) Break into engineering tasks (≤2 days each)

## Output Format
- Story ID, title, ACs
- Tasks: ID, description, estimate, dependency

## Quality Gates
- Each AC is verifiable
- No task > 2 days
- Critical path identified