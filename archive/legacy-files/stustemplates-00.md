# Stustemplates 00 - Original Stulogy Vibe-PRD Repository
**Generated:** 2025-09-16
**Source:** https://github.com/stulogy/vibe-prd
**Purpose:** Original templates that inspired the expanded AI Dev Tasks toolkit

---

# 🎯 OVERVIEW

This document contains all the original templates and files from the stulogy/vibe-prd repository. This is the foundational work that inspired and was expanded into the comprehensive 44-template AI Dev Tasks Professional Documentation Toolkit.

## 📊 Repository Structure
```
stulogy/vibe-prd/
├── README.md                               # Main workflow guide
├── LICENSE                                 # Open source license
├── .gitignore                             # Git ignore rules
├── .cursorrules/                          # AI workflow templates
│   ├── 01-create-prd.mdc                 # PRD creation template
│   ├── 02-setup-postgres-mcp.mdc         # Database assessment
│   ├── 03-generate-tasks.mdc             # Task generation template
│   ├── 04-task-list.mdc                  # Task management template
│   ├── setup-postgres-mcp.md             # PostgreSQL setup guide
│   ├── postgres-mcp-config.example.json  # Database config example
│   └── vibe-basics.md                     # Basic coding rules
└── tasks/                                 # Output directory (empty)
```

## 🔍 Key Differences from Our Expanded Version
- **Original:** 4 core workflow templates (.mdc files)
- **Our Version:** 44 templates (22 auto-fill + 19 complex creation + 3 foundation)
- **Original:** Simple PRD → Tasks → Implementation workflow
- **Our Version:** Complete development lifecycle with BMAD integration

---

# 📚 COMPLETE ORIGINAL REPOSITORY CONTENTS

## 1. README.md - Main Workflow Guide
*The complete guide to using the original vibe-prd workflow*

```markdown
# 🚀 AI Dev Tasks Template for Cursor 🤖

**Note: This is a template repository. Clone this to start new projects with structured AI development workflow.**

## 🎯 How to Use This Template

1. **Clone this repository** for your new project:
   ```bash
   git clone https://github.com/your-username/vibe-prd.git my-new-project
   cd my-new-project
   ```

2. **Follow the workflow below** to generate your PRD and task list

3. **Project files will be updated** automatically during task generation:
   - **README.md** will be rewritten for your specific project (this template content will be replaced)
   - **LICENSE** will be updated with your preferred license or removed if not needed

4. **Important**: The first tasks generated will always be setup tasks to create your project-specific README and handle the license file

### 📁 What Your Final Project Structure Will Look Like

After using this template, your project will have:
```
my-new-project/
├── README.md (rewritten for your specific project)
├── LICENSE (updated with your chosen license or removed)
├── .cursorrules/ (AI workflow files - keep these)
├── tasks/
│   ├── prd-your-feature.md (your PRD)
│   └── tasks-prd-your-feature.md (your task list)
├── src/ (your actual project code)
├── package.json (if applicable)
└── ... (other project files)
```

---

## 📖 About This Template

Welcome to **AI Dev Tasks**! This repository provides a collection of `.mdc` (Markdown Command) files designed to supercharge your feature development workflow within the Cursor editor. By leveraging these commands with Cursor's AI Agent, you can systematically approach building features, from ideation to implementation, with built-in checkpoints for verification.

Stop wrestling with monolithic AI requests and start guiding your AI collaborator step-by-step!

## ✨ The Core Idea

Building complex features with AI can sometimes feel like a black box. This workflow aims to bring structure, clarity, and control to the process by:

1. **Defining Scope:** Clearly outlining what needs to be built with a Product Requirement Document (PRD).
2. **Detailed Planning:** Breaking down the PRD into a granular, actionable task list.
3. **Iterative Implementation:** Guiding the AI to tackle one task at a time, allowing you to review and approve each change.

This structured approach helps ensure the AI stays on track, makes it easier to debug issues, and gives you confidence in the generated code.

## Workflow: From Idea to Implemented Feature 💡➡️💻

Here's the step-by-step process using the `.mdc` files in this repository:

### 1️⃣ Create a Product Requirement Document (PRD)

First, lay out the blueprint for your feature. A PRD clarifies what you're building, for whom, and why.

You can create a lightweight PRD directly within Cursor:

1. Ensure you have the `.cursorrules/01-create-prd.mdc` file from this repository accessible.
2. In Cursor's Agent chat, initiate PRD creation:
```
Use @.cursorrules/01-create-prd.mdc
Here's the feature I want to build: [Describe your feature in detail]
Reference these files to help you: [Optional: @file1.py @file2.ts]
```
_(Pro Tip: For complex PRDs, using MAX mode in Cursor is highly recommended if your budget allows for more comprehensive generation.)_

### 2️⃣ Database Assessment (Optional)

After creating your PRD, determine if your feature needs database functionality:

1. Use the database assessment prompt:
```
Use @.cursorrules/02-setup-postgres-mcp.mdc
Reference my PRD: @tasks/prd-MyFeature.md
```

2. If you need database functionality, follow the PostgreSQL MCP setup guide in `.cursorrules/setup-postgres-mcp.md`
3. If not, skip to step 3

### 3️⃣ Generate Your Task List from the PRD

With your PRD drafted (e.g., `prd-MyFeature.md`), the next step is to generate a detailed, step-by-step implementation plan for your AI Developer.

1. Ensure you have `.cursorrules/03-generate-tasks.mdc` accessible.
2. In Cursor's Agent chat, use the PRD to create tasks:
```
Now take @tasks/prd-MyFeature.md and create tasks using @.cursorrules/03-generate-tasks.mdc
```
_(Note: Replace `@prd-MyFeature.md` with the actual filename of the PRD you generated in step 1.)_

### 4️⃣ Examine Your Task List

You'll now have a well-structured task list, often with tasks and sub-tasks, ready for the AI to start working on. This provides a clear roadmap for implementation.

### 5️⃣ Instruct the AI to Work Through Tasks (and Mark Completion)

To ensure methodical progress and allow for verification, we'll use `task-list.mdc`. This command instructs the AI to focus on one task at a time and wait for your go-ahead before moving to the next.

1. Create or ensure you have the `.cursorrules/04-task-list.mdc` file accessible.
2. In Cursor's Agent chat, tell the AI to start with the first task (e.g., `1.1`):
```
Please start on task 1.1 and use @.cursorrules/04-task-list.mdc
```
_(Important: You only need to reference `@.cursorrules/04-task-list.mdc` for the first task. The instructions within it guide the AI for subsequent tasks.)_

The AI will attempt the task and then prompt you to review.

### 6️⃣ Review, Approve, and Progress ✅

As the AI completes each task, you review the changes.

* If the changes are good, simply reply with "yes" (or a similar affirmative) to instruct the AI to mark the task complete and move to the next one.
* If changes are needed, provide feedback to the AI to correct the current task before moving on.

You'll see a satisfying list of completed items grow, providing a clear visual of your feature coming to life!

While it's not always perfect, this method has proven to be a very reliable way to build out larger features with AI assistance.

## 🗂️ Files in this Repository

### Core Workflow Files (Sequential Order)
* **`.cursorrules/01-create-prd.mdc`**: Guides the AI in generating a Product Requirement Document for your feature.
* **`.cursorrules/02-setup-postgres-mcp.mdc`**: Database assessment prompt - asks if your feature needs database functionality and guides PostgreSQL MCP setup.
* **`.cursorrules/03-generate-tasks.mdc`**: Takes a PRD markdown file as input and helps the AI break it down into a detailed, step-by-step implementation task list.
* **`.cursorrules/04-task-list.mdc`**: Instructs the AI on how to process the generated task list, tackling one task at a time and waiting for your approval before proceeding.

### Database Integration (Optional)
* **`.cursorrules/setup-postgres-mcp.md`**: Detailed guide for PostgreSQL MCP integration with Cursor.
* **`.cursorrules/postgres-mcp-config.example.json`**: Example PostgreSQL MCP configuration for Cursor.

### Output Directory
* **`tasks/`**: Directory where PRDs and task lists will be saved.

## 🌟 Benefits

* **Structured Development:** Enforces a clear process from idea to code.
* **Step-by-Step Verification:** Allows you to review and approve AI-generated code at each small step, ensuring quality and control.
* **Manages Complexity:** Breaks down large features into smaller, digestible tasks for the AI, reducing the chance of it getting lost or generating overly complex, incorrect code.
* **Improved Reliability:** Offers a more dependable approach to leveraging AI for significant development work compared to single, large prompts.
* **Clear Progress Tracking:** Provides a visual representation of completed tasks, making it easy to see how much has been done and what's next.

## 🛠️ How to Use

1. **Clone or Download:** Get these `.mdc` files into your project or a central location where Cursor can access them.
2. **Follow the Workflow:** Systematically use the `.mdc` files in Cursor's Agent chat as described in the 5-step workflow above.
3. **Adapt and Iterate:**
   * Feel free to modify the prompts within the `.mdc` files to better suit your specific needs or coding style.
   * If the AI struggles with a task, try rephrasing your initial feature description or breaking down tasks even further.

## 💡 Tips for Success

* **Be Specific:** The more context and clear instructions you provide (both in your initial feature description and any clarifications), the better the AI's output will be.
* **MAX Mode for PRDs:** As mentioned, using MAX mode in Cursor for PRD creation (`.cursorrules/01-create-prd.mdc`) can yield more thorough and higher-quality results if your budget supports it.
* **Correct File Tagging:** Always ensure you're accurately tagging the PRD filename (e.g., `@tasks/prd-MyFeature.md`) when generating tasks.
* **Patience and Iteration:** AI is a powerful tool, but it's not magic. Be prepared to guide, correct, and iterate. This workflow is designed to make that iteration process smoother.

## 🤝 Contributing

Got ideas to improve these `.mdc` files or have new ones that fit this workflow? Contributions are welcome! Please feel free to:

* Open an issue to discuss changes or suggest new features.
* Submit a pull request with your enhancements.

---

Happy AI-assisted developing!
```

---

## 2. .cursorrules/01-create-prd.mdc - PRD Creation Template
*The original PRD creation workflow*

```markdown
---
description:
globs:
alwaysApply: false
---
# Rule: Generating a Product Requirements Document (PRD)

## Goal

To guide an AI assistant in creating a detailed Product Requirements Document (PRD) in Markdown format, based on an initial user prompt. The PRD should be clear, actionable, and suitable for a junior developer to understand and implement the feature.

## Process

1.  **Receive Initial Prompt:** The user provides a brief description or request for a new feature or functionality.
2.  **Ask Clarifying Questions:** Before writing the PRD, the AI *must* ask clarifying questions to gather sufficient detail. The goal is to understand the "what" and "why" of the feature, not necessarily the "how" (which the developer will figure out).
3.  **Generate PRD:** Based on the initial prompt and the user's answers to the clarifying questions, generate a PRD using the structure outlined below.
4.  **Save PRD:** Save the generated document as `prd-[feature-name].md` inside the `/tasks` directory.

## Clarifying Questions (Examples)

The AI should adapt its questions based on the prompt, but here are some common areas to explore:

*   **Problem/Goal:** "What problem does this feature solve for the user?" or "What is the main goal we want to achieve with this feature?"
*   **Target User:** "Who is the primary user of this feature?"
*   **Core Functionality:** "Can you describe the key actions a user should be able to perform with this feature?"
*   **User Stories:** "Could you provide a few user stories? (e.g., As a [type of user], I want to [perform an action] so that [benefit].)"
*   **Acceptance Criteria:** "How will we know when this feature is successfully implemented? What are the key success criteria?"
*   **Scope/Boundaries:** "Are there any specific things this feature *should not* do (non-goals)?"
*   **Data Requirements:** "What kind of data does this feature need to display or manipulate?"
*   **Design/UI:** "Are there any existing design mockups or UI guidelines to follow?" or "Can you describe the desired look and feel?"
*   **Edge Cases:** "Are there any potential edge cases or error conditions we should consider?"

## PRD Structure

The generated PRD should include the following sections:

1.  **Introduction/Overview:** Briefly describe the feature and the problem it solves. State the goal.
2.  **Goals:** List the specific, measurable objectives for this feature.
3.  **User Stories:** Detail the user narratives describing feature usage and benefits.
4.  **Functional Requirements:** List the specific functionalities the feature must have. Use clear, concise language (e.g., "The system must allow users to upload a profile picture."). Number these requirements.
5.  **Non-Goals (Out of Scope):** Clearly state what this feature will *not* include to manage scope.
6.  **Design Considerations (Optional):** Link to mockups, describe UI/UX requirements, or mention relevant components/styles if applicable.
7.  **Technical Considerations (Optional):** Mention any known technical constraints, dependencies, or suggestions (e.g., "Should integrate with the existing Auth module").
8.  **Success Metrics:** How will the success of this feature be measured? (e.g., "Increase user engagement by 10%", "Reduce support tickets related to X").
9.  **Open Questions:** List any remaining questions or areas needing further clarification.

## Target Audience

Assume the primary reader of the PRD is a **junior developer**. Therefore, requirements should be explicit, unambiguous, and avoid jargon where possible. Provide enough detail for them to understand the feature's purpose and core logic.

## Output

*   **Format:** Markdown (`.md`)
*   **Location:** `/tasks/`
*   **Filename:** `prd-[feature-name].md`

## Final instructions

1. Do NOT start implmenting the PRD
2. Make sure to ask the user clarifying questions
3. Take the user's answers to the clarifying questions and improve the PRD
```

---

## 3. .cursorrules/02-setup-postgres-mcp.mdc - Database Assessment
*Optional database needs assessment*

```markdown
---
description:
globs:
alwaysApply: false
---
# PostgreSQL MCP Setup Prompt

## Goal
After creating a PRD, determine if the project requires database functionality and guide setup of PostgreSQL MCP integration if needed.

## Process
1. **Review the PRD**: Analyze the requirements to see if database functionality is needed
2. **Ask clarifying questions**: Confirm database needs based on PRD requirements
3. **Guide MCP setup**: If yes, provide setup instructions for PostgreSQL MCP integration
4. **Proceed with task generation**: Continue to task generation with or without database setup

## Database Assessment Questions
Based on the PRD, ask the user:
- "Looking at your PRD, this feature will need to store/retrieve data. Do you have an existing PostgreSQL database?"
- "Would you like to set up PostgreSQL MCP integration for real-time database inspection during development?"
- "What type of data storage does this feature require based on the PRD requirements?"

## Setup Instructions
If the user needs database functionality:

1. **Review the setup guide**: Point them to `.cursorrules/setup-postgres-mcp.md` for detailed setup instructions
2. **Configure MCP**: Help them set up the PostgreSQL MCP server using the example config in `.cursorrules/postgres-mcp-config.example.json`
3. **Test connection**: Verify the setup is working before proceeding

## Integration with Workflow
- **After PRD creation**: Run this assessment based on PRD requirements
- **Before task generation**: Ensure database setup is complete if needed
- **During task generation**: Tasks can reference actual database schema and relationships
- **During implementation**: Real-time database queries help validate data requirements

## Output
Once database assessment and setup is complete or skipped, proceed with task generation:
1. Use `@.cursorrules/03-generate-tasks.mdc` for task breakdown (will include database setup tasks if needed)
2. Use `@.cursorrules/04-task-list.mdc` for implementation tracking
```

---

## 4. .cursorrules/03-generate-tasks.mdc - Task Generation Template
*Converts PRDs into detailed task lists*

```markdown
---
description:
globs:
alwaysApply: false
---
# Rule: Generating a Task List from a PRD

## Goal

To guide an AI assistant in creating a detailed, step-by-step task list in Markdown format based on an existing Product Requirements Document (PRD). The task list should guide a developer through implementation.

## Output

- **Format:** Markdown (`.md`)
- **Location:** `/tasks/`
- **Filename:** `tasks-[prd-file-name].md` (e.g., `tasks-prd-user-profile-editing.md`)

## Process

1.  **Receive PRD Reference:** The user points the AI to a specific PRD file
2.  **Analyze PRD:** The AI reads and analyzes the functional requirements, user stories, and other sections of the specified PRD.
3.  **Phase 1: Generate Parent Tasks:** Based on the PRD analysis, create the file and generate the main, high-level tasks required to implement the feature. Use your judgement on how many high-level tasks to use. It's likely to be about 5. Present these tasks to the user in the specified format (without sub-tasks yet). Inform the user: "I have generated the high-level tasks based on the PRD. Ready to generate the sub-tasks? Respond with 'Go' to proceed."
4.  **Wait for Confirmation:** Pause and wait for the user to respond with "Go".
5.  **Phase 2: Generate Sub-Tasks:** Once the user confirms, break down each parent task into smaller, actionable sub-tasks necessary to complete the parent task. Ensure sub-tasks logically follow from the parent task and cover the implementation details implied by the PRD.
6.  **Include Setup Tasks:** Always include as the FIRST tasks:
    - "1.0 Create Project README" with sub-tasks to rewrite the README.md file based on the PRD, replacing the template content with project-specific documentation.
    - "2.0 Setup Project License" with sub-tasks to either update the LICENSE file with the user's preferred license or remove it if not needed.
7.  **Identify Relevant Files:** Based on the tasks and PRD, identify potential files that will need to be created or modified. List these under the `Relevant Files` section, including corresponding test files if applicable. Always include `README.md` in this list.
8.  **Generate Final Output:** Combine the parent tasks, sub-tasks, relevant files, and notes into the final Markdown structure.
9.  **Save Task List:** Save the generated document in the `/tasks/` directory with the filename `tasks-[prd-file-name].md`, where `[prd-file-name]` matches the base name of the input PRD file (e.g., if the input was `prd-user-profile-editing.md`, the output is `tasks-prd-user-profile-editing.md`).

## Output Format

The generated task list _must_ follow this structure:

```markdown
## Relevant Files

- `README.md` - Project documentation that will be rewritten based on the PRD to replace template content.
- `LICENSE` - License file that may need to be updated or removed based on project requirements.
- `path/to/potential/file1.ts` - Brief description of why this file is relevant (e.g., Contains the main component for this feature).
- `path/to/file1.test.ts` - Unit tests for `file1.ts`.
- `path/to/another/file.tsx` - Brief description (e.g., API route handler for data submission).
- `path/to/another/file.test.tsx` - Unit tests for `another/file.tsx`.
- `lib/utils/helpers.ts` - Brief description (e.g., Utility functions needed for calculations).
- `lib/utils/helpers.test.ts` - Unit tests for `helpers.ts`.

### Notes

- Unit tests should typically be placed alongside the code files they are testing (e.g., `MyComponent.tsx` and `MyComponent.test.tsx` in the same directory).
- Use `npx jest [optional/path/to/test/file]` to run tests. Running without a path executes all tests found by the Jest configuration.

## Tasks

- [ ] 1.0 Create Project README
  - [ ] 1.1 Rewrite README.md with project title and description based on PRD
  - [ ] 1.2 Add installation and setup instructions
  - [ ] 1.3 Document key features and usage from PRD requirements
  - [ ] 1.4 Remove template content and replace with project-specific information
- [ ] 2.0 Setup Project License
  - [ ] 2.1 Ask user what license they want (MIT, Apache, GPL, proprietary, or remove LICENSE file)
  - [ ] 2.2 Update LICENSE file with chosen license or delete if not needed
  - [ ] 2.3 Update package.json license field if applicable
- [ ] 3.0 Parent Task Title
  - [ ] 3.1 [Sub-task description 3.1]
  - [ ] 3.2 [Sub-task description 3.2]
- [ ] 4.0 Parent Task Title
  - [ ] 4.1 [Sub-task description 4.1]
- [ ] 5.0 Parent Task Title (may not require sub-tasks if purely structural or configuration)
```

## Interaction Model

The process explicitly requires a pause after generating parent tasks to get user confirmation ("Go") before proceeding to generate the detailed sub-tasks. This ensures the high-level plan aligns with user expectations before diving into details.

## Target Audience

Assume the primary reader of the task list is a **junior developer** who will implement the feature.
```

---

## 5. .cursorrules/04-task-list.mdc - Task Management Template
*Manages task execution and progress tracking*

```markdown
---
description:
globs:
alwaysApply: false
---
# Task List Management

Guidelines for managing task lists in markdown files to track progress on completing a PRD

## Task Implementation
- **One sub-task at a time:** Do **NOT** start the next sub‑task until you ask the user for permission and they say "yes" or "y"
- **Completion protocol:**
  1. When you finish a **sub‑task**, immediately mark it as completed by changing `[ ]` to `[x]`.
  2. If **all** subtasks underneath a parent task are now `[x]`, also mark the **parent task** as completed.
- Stop after each sub‑task and wait for the user's go‑ahead.

## Task List Maintenance

1. **Update the task list as you work:**
   - Mark tasks and subtasks as completed (`[x]`) per the protocol above.
   - Add new tasks as they emerge.

2. **Maintain the "Relevant Files" section:**
   - List every file created or modified.
   - Give each file a one‑line description of its purpose.

## AI Instructions

When working with task lists, the AI must:

1. Regularly update the task list file after finishing any significant work.
2. Follow the completion protocol:
   - Mark each finished **sub‑task** `[x]`.
   - Mark the **parent task** `[x]` once **all** its subtasks are `[x]`.
3. Add newly discovered tasks.
4. Keep "Relevant Files" accurate and up to date.
5. Before starting work, check which sub‑task is next.
6. After implementing a sub‑task, update the file and then pause for user approval.
```

---

## 6. .cursorrules/setup-postgres-mcp.md - Database Setup Guide
*Comprehensive PostgreSQL MCP integration guide*

```markdown
# PostgreSQL MCP Server Setup Guide

## Overview

The PostgreSQL MCP (Model Context Protocol) server enables Cursor and AI assistants to directly query your PostgreSQL database in a secure, read-only manner. This is incredibly useful for database-driven projects where you need to inspect data, analyze schemas, or generate reports.

## Prerequisites

- PostgreSQL database instance (local or remote)
- Node.js and npm installed
- Database credentials with read access
- Cursor IDE with MCP support

## Installation

The PostgreSQL MCP server can be installed and used in two ways:

### Option 1: Global Installation
```bash
npm install -g @modelcontextprotocol/server-postgres
```

### Option 2: Using npx (Recommended)
No installation required - use directly with npx:
```bash
npx -y @modelcontextprotocol/server-postgres postgresql://username:password@hostname:port/database
```

## Configuration for Cursor

To integrate with Cursor IDE, you need to configure the MCP server in your Cursor settings:

### 1. Create or Edit Configuration File

**Location**:
- macOS: `~/Library/Application Support/Cursor/User/settings.json`
- Windows: `%APPDATA%/Cursor/User/settings.json`
- Linux: `~/.config/Cursor/User/settings.json`

### 2. Add PostgreSQL MCP Configuration

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-postgres",
        "postgresql://username:password@hostname:port/database"
      ]
    }
  }
}
```

### 3. Environment Variables (Recommended for Security)

For production or sensitive environments, use environment variables:

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-postgres"
      ],
      "env": {
        "POSTGRES_URL": "postgresql://username:password@hostname:port/database"
      }
    }
  }
}
```

Then set your environment variable:
```bash
export POSTGRES_URL="postgresql://username:password@hostname:port/database"
```

## Security Best Practices

### 1. Create a Read-Only Database User

```sql
-- Create a read-only user
CREATE USER mcp_readonly WITH PASSWORD 'secure_password';

-- Grant connect privileges
GRANT CONNECT ON DATABASE your_database TO mcp_readonly;

-- Grant usage on schema
GRANT USAGE ON SCHEMA public TO mcp_readonly;

-- Grant select on all tables
GRANT SELECT ON ALL TABLES IN SCHEMA public TO mcp_readonly;

-- Grant select on future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO mcp_readonly;
```

### 2. Connection String Security

- Never commit connection strings with credentials to version control
- Use environment variables for sensitive information
- Consider using connection pooling for production environments
- Enable SSL for remote connections: `postgresql://user:pass@host:port/db?sslmode=require`

## Usage Examples

Once configured, you can ask Cursor to:

### Database Schema Exploration
```
"Show me the structure of my users table"
"What are all the tables in my database?"
"Describe the relationships between my tables"
```

### Data Analysis
```
"Analyze the distribution of user registrations by month"
"Show me the top 10 customers by order value"
"What's the average order size in the last quarter?"
```

### Report Generation
```
"Generate a monthly revenue report"
"Create a summary of user activity patterns"
"Analyze product performance metrics"
```

## Testing the Connection

After setup, restart Cursor and test the connection:

1. Open a new chat in Cursor
2. Ask: "Can you show me what tables are available in my database?"
3. The AI should respond with a list of your database tables

## Troubleshooting

### Common Issues

1. **Connection Refused**
   - Check if PostgreSQL server is running
   - Verify host and port are correct
   - Check firewall settings

2. **Authentication Failed**
   - Verify username and password
   - Check user permissions
   - Ensure user has connect privileges

3. **MCP Server Not Found**
   - Restart Cursor after configuration changes
   - Verify the configuration file path
   - Check for JSON syntax errors

### Debug Mode

To see detailed logs, add debug flags:

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-postgres",
        "postgresql://username:password@hostname:port/database",
        "--debug"
      ]
    }
  }
}
```

## Advanced Configuration

### Multiple Databases

You can configure multiple PostgreSQL instances:

```json
{
  "mcpServers": {
    "postgres-prod": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-postgres",
        "postgresql://readonly:pass@prod-db:5432/app_db"
      ]
    },
    "postgres-analytics": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-postgres",
        "postgresql://analyst:pass@analytics-db:5432/warehouse"
      ]
    }
  }
}
```

### Custom Query Limits

To prevent long-running queries, you can set connection parameters:

```
postgresql://user:pass@host:port/db?statement_timeout=30s&lock_timeout=10s
```

## Integration with AI Dev Tasks Workflow

The PostgreSQL MCP server enhances the AI Dev Tasks workflow:

1. **During PRD Creation**: AI can inspect existing database schema to understand current data models
2. **Task Generation**: Tasks can reference actual database structure and relationships
3. **Implementation**: Real-time database queries help validate data requirements and constraints
4. **Testing**: AI can generate test data and validate database changes

## Resources

- [PostgreSQL MCP Server GitHub](https://github.com/modelcontextprotocol/servers/tree/main/src/postgres)
- [Model Context Protocol Documentation](https://modelcontextprotocol.io/)
- [Cursor MCP Integration Guide](https://docs.cursor.com/)
```

---

## 7. .cursorrules/postgres-mcp-config.example.json - Database Config Example
*Example PostgreSQL MCP configuration for Cursor*

```json
{
  "mcpServers": {
    "postgres": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-postgres"
      ],
      "env": {
        "POSTGRES_URL": "postgresql://username:password@localhost:5432/database_name"
      }
    }
  }
}
```

---

## 8. .cursorrules/vibe-basics.md - Basic Coding Rules
*General coding guidelines for the workflow*

```markdown
# Cursor Rules for Vibe Coding

## Deployment Rules
- Do not make any deployments to Vercel or Railway as an agent, unless I give explicit permission
- You can ask to make deployments, but wait for my approval before proceeding

## Git Rules
- Do not make any git commands without my explicit permission
- This includes but is not limited to: commit, push, pull, merge, reset, branch operations, etc.
- Always ask for permission before executing any git-related commands

## Mock Data
- Never generate or suggest mock data, placeholder objects, or fake API responses.
- Always attempt to connect to the real API or endpoint, even if authentication, schemas, or environment variables are missing. If connection details are unclear, explicitly ask the user for the needed information rather than fabricating data.
- Do not write `const mockData = [...]`, `sampleResponse`, `faker`, or similar.
- Only implement actual calls, request/response handling, and error handling for the real API.

## General Guidelines
- Follow the existing code style and patterns in the project
- Use TypeScript and React best practices
- Maintain the existing project structure and naming conventions
```

---

# 📊 ORIGINAL TEMPLATE ANALYSIS

## Core Workflow Philosophy
The original stulogy/vibe-prd approach focuses on:
1. **Simplicity** - 4 core templates covering the essential workflow
2. **Cursor Integration** - Designed specifically for Cursor IDE with .mdc format
3. **Step-by-step Control** - One task at a time with human approval
4. **Database Integration** - Optional PostgreSQL MCP for data-driven projects

## Template Categories:
### Sequential Workflow Templates (4)
- `01-create-prd.mdc` - PRD creation with clarifying questions
- `02-setup-postgres-mcp.mdc` - Optional database needs assessment
- `03-generate-tasks.mdc` - PRD → Task list conversion
- `04-task-list.mdc` - Task execution management

### Supporting Documentation (3)
- `setup-postgres-mcp.md` - Detailed database integration guide
- `postgres-mcp-config.example.json` - Configuration example
- `vibe-basics.md` - General coding rules

## Key Innovations:
✅ **Two-phase task generation** - Parent tasks → User approval → Sub-tasks
✅ **Built-in database assessment** - Determines if PostgreSQL MCP is needed
✅ **Structured clarifying questions** - Ensures PRD completeness
✅ **Project setup tasks** - Always includes README/LICENSE setup
✅ **Human-in-the-loop control** - User approval for each task

## Workflow Strengths:
- **Focused scope** - Does one thing very well (PRD → Tasks → Implementation)
- **Cursor optimized** - .mdc format works seamlessly with Cursor
- **Database awareness** - Can integrate with real databases via MCP
- **Quality control** - Human approval at each step prevents AI drift

## How Our Version Expanded:
- **Original:** 4 workflow templates → **Our Version:** 44 comprehensive templates
- **Original:** Cursor-specific → **Our Version:** Universal AI assistant compatibility
- **Original:** PRD focus → **Our Version:** Complete development lifecycle
- **Original:** Manual workflow → **Our Version:** BMAD automated template filling

---

**This original work by stulogy provided the foundational concepts that we expanded into a comprehensive professional documentation toolkit. The core philosophy of structured AI guidance, human control, and quality checkpoints remains central to both approaches.**

**End of Stustemplates 00**