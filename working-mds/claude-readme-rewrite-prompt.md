# 📝 Prompt for Claude — README Rewrite + Repo Metadata Update

You are Claude Code in my terminal.
Task: Clean up and modernize this repo to reflect the new Claude-only one-paste workflow.
This includes: README rewrite, repo description update, and topics update.

---

## Part 1: Rewrite README.md
1. **Project Title & Badges**
   - Title: 🚀 vibe-prd
   - Badges (replace existing):
     - ![Claude One-Paste](https://img.shields.io/badge/Claude-One--Paste-brightgreen)
     - ![Docs Verified](https://img.shields.io/badge/Docs-Verified-brightgreen)
     - ![Sudo-Free](https://img.shields.io/badge/Sudo-Free-brightgreen)

2. **Tagline**
   - Replace with:
     > Paste once → Claude generates 22 enterprise-grade docs in `completed-docs/`. Beginner-friendly, zero setup, no dependencies.

3. **Quickstart Usage**
   ```markdown
   ### Quickstart
   1. Clone this repo
   2. Open Claude Code CLI
   3. Copy & paste the one-paste prompt from below
   4. Answer: "What's your project about?" (write as much detail as you want)
   5. Claude generates all 22 docs into `completed-docs/<project>/`
   ```

4. **One-Paste Prompt Section**
   ```markdown
   ### One-Paste Prompt
   Copy this into Claude Code CLI:

   ```
   You are Claude Code running in my terminal.
   Goal: Generate a full set of 22 enterprise-grade docs from a project description.
   Output: Place results in completed-docs/<project-name>/.

   Instructions:
   1. Ask me once: "Describe your project. Provide as much or as little detail as you want (a sentence, a paragraph, or even a full page)."
   2. Take that description and auto-complete all reasoning steps yourself (deductive logic, no further questions).
   3. Use the professional-templates/ (22 files, 01–22) as blueprints.
   4. Generate final documents in completed-docs/<project-name>/.
   5. Ensure each doc follows enterprise template structure.
   6. Provide a final index.md summarizing the set.

   Rules:
   - Don't modify professional-templates/.
   - Save everything only to completed-docs/.
   - If errors occur, fix automatically and retry.
   - Always confirm final output folder path to me.
   ```
   ```

5. **Advanced Usage**
   ```markdown
   ### Advanced
   - You can edit any file in `/professional-templates/` to customize your document outputs.
   - When you run the one-paste prompt again, Claude will use your updated templates.
   ```

6. **Remove BMAD**
   - Delete all mentions of BMAD, containers, Renovate, CI/CD for BMAD.
   - Keep only Claude workflow instructions.

---

## Part 2: Repo Metadata Update

Update GitHub metadata to match new focus:
- **Description:**
  ```
  One-paste Claude Code pipeline: paste prompt → 22 enterprise docs → completed-docs/. Beginner-friendly, zero setup.
  ```
- **Topics:**
  ```
  claude
  claude-code
  claude-cli
  one-paste
  docs
  docs-pipeline
  documentation
  ai-docs
  templates
  enterprise
  productivity
  ```

---

## Part 3: Commit & PR
- Save rewritten README.md
- Commit with:
  ```bash
  chore(readme): simplify to Claude-only one-paste workflow
  ```
- Push branch: `chore/readme-claude-only`
- Open PR titled: "Simplify repo: Claude-only one-paste workflow"
- Include note:
  ```
  This PR removes BMAD references, rewrites README for one-paste Claude workflow, and updates repo metadata.
  ```

---

## Part 4: Output for Review
- Show me the full new README.md text before committing.
- Confirm new repo description + topics applied.
- Display PR URL once opened.

---

⚡ **Expected Result:** Clean, beginner-friendly README focused entirely on the one-paste Claude workflow with updated repo metadata to match.