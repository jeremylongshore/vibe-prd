# 🚀 vibe-prd: Enhanced for BOTH Cursor & CLI Users

> Original by [@stulogy](https://github.com/stulogy) | Enhanced with 16 Professional Templates + CLI Support by [@jeremylongshore](https://github.com/jeremylongshore)

## 🎯 What's New in This Fork

This fork adds **TWO major enhancements**:

1. **16 Professional Documentation Templates** - Complete SDLC coverage
2. **Full CLI Support** - For developers who prefer terminal over Cursor

## 🖱️ For Cursor Users (Original Workflow)

Use exactly as stulogy intended:

```cursor
1. Use @.cursorrules/01-create-prd.mdc
2. Use @.cursorrules/03-generate-tasks.mdc
3. Use @.cursorrules/04-process-task-list.mdc
```

## 🐧 For CLI Users (NEW!)

### Quick Start
```bash
# Interactive mode - easiest way!
./cli-workflow/interactive.sh

# Or direct commands
./cli-workflow/create-prd.sh "user authentication"
./cli-workflow/generate-tasks.sh tasks/prd-user-auth.md
```

### Features for CLI Users
- ✅ **No Cursor required** - Works with any editor
- ✅ **AI agnostic** - Use with Claude, ChatGPT, Gemini, local LLMs
- ✅ **Shell scripts** - Automate everything
- ✅ **Interactive TUI** - Menu-driven interface
- ✅ **Clipboard support** - Auto-copy templates

## 📚 16 Professional Templates (NEW!)

### Planning Phase
- `create-prd.md` - Enhanced Product Requirements
- `create-brd.md` - Business Requirements Document
- `create-rfc.md` - Request for Comments
- `create-tech-spec.md` - Technical Specification

### Design Phase
- `create-design-doc.md` - System Design
- `create-api-spec.md` - API Specification
- `create-database-schema.md` - Database Schema
- `create-user-story.md` - User Stories

### Operations Phase
- `create-runbook.md` - Operational Runbook
- `create-post-mortem.md` - Incident Analysis
- `create-sop.md` - Standard Operating Procedure
- `create-test-plan.md` - Test Strategy

### Project Management
- `create-project-charter.md` - Project Authorization
- `create-raci-matrix.md` - Responsibility Matrix
- `create-risk-register.md` - Risk Management
- `adr-template.md` - Architecture Decision Records

## 🔄 Usage Comparison

| Task | Cursor Users | CLI Users |
|------|-------------|-----------|
| Create PRD | `@.cursorrules/01-create-prd.mdc` | `./cli-workflow/create-prd.sh` |
| Generate Tasks | `@.cursorrules/03-generate-tasks.mdc` | `./cli-workflow/generate-tasks.sh` |
| Process Tasks | `@.cursorrules/04-process-task-list.mdc` | `./cli-workflow/process-tasks.sh` |
| Use Templates | Open in Cursor | `./cli-workflow/interactive.sh` |

## 🚀 Installation

### For Everyone
```bash
git clone https://github.com/jeremylongshore/vibe-prd.git
cd vibe-prd
```

### Additional for CLI Users
```bash
chmod +x cli-workflow/*.sh
./cli-workflow/interactive.sh  # Start here!
```

## 📖 Documentation

- **Original vibe-prd**: See original [README.md](README.md)
- **Professional Templates**: See [PROFESSIONAL_TEMPLATES.md](PROFESSIONAL_TEMPLATES.md)
- **CLI Workflow**: See [cli-workflow/README.md](cli-workflow/README.md)

## 🤝 Contributing

### To This Fork
- CLI improvements welcome!
- More templates welcome!
- Create PR to `jeremylongshore/vibe-prd`

### To Original
- For core vibe-prd changes, contribute to `stulogy/vibe-prd`

## 🌟 Credits

- **Original vibe-prd**: [@stulogy](https://github.com/stulogy) - Brilliant concept!
- **Professional Templates**: [@jeremylongshore](https://github.com/jeremylongshore)
- **CLI Support**: [@jeremylongshore](https://github.com/jeremylongshore)

## 📊 What This Fork Adds

```diff
+ 16 Professional Documentation Templates
+ Full CLI workflow support
+ Interactive shell interface
+ 7,852 lines of templates
+ Works without Cursor
+ AI-agnostic approach
+ Linux/Mac/WSL support
```

## 🎯 Why This Fork?

1. **Not everyone uses Cursor** - Many developers prefer vim/emacs/terminal
2. **Professional templates** - Real-world documentation beyond PRDs
3. **Automation friendly** - Shell scripts for CI/CD integration
4. **AI flexibility** - Use any AI, not just Cursor's

---

**Choose your style**: Cursor IDE or Terminal CLI - Both work great! 🚀