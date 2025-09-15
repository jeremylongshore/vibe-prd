# 🐧 CLI Workflow for vibe-prd

For developers who prefer the command line over Cursor IDE. Use these templates with any AI assistant (Claude, ChatGPT, etc.) directly from your terminal.

## 🚀 Quick Start (Linux/Mac/WSL)

```bash
# Clone the repo
git clone https://github.com/jeremylongshore/vibe-prd.git
cd vibe-prd

# Make CLI scripts executable
chmod +x cli-workflow/*.sh

# Generate a PRD
./cli-workflow/create-prd.sh "My Awesome Feature"

# Generate tasks from PRD
./cli-workflow/generate-tasks.sh tasks/prd-my-awesome-feature.md

# Process tasks one by one
./cli-workflow/process-tasks.sh tasks/tasks-my-awesome-feature.md
```

## 📝 Manual CLI Usage (Without Scripts)

### Method 1: Copy/Paste with cat

```bash
# View template and copy to your AI
cat professional-templates/create-prd.md

# Or pipe directly to clipboard (Linux)
cat professional-templates/create-prd.md | xclip -selection clipboard

# Or on Mac
cat professional-templates/create-prd.md | pbcopy
```

### Method 2: Use with Claude CLI or API

```bash
# If you have Claude CLI installed
claude < professional-templates/create-prd.md

# Or with OpenAI's CLI
openai api completions.create -m gpt-4 -p "$(cat professional-templates/create-prd.md)"
```

### Method 3: Interactive Session

```bash
# Start an interactive session
./cli-workflow/interactive.sh

> Select template:
1) PRD - Product Requirements
2) BRD - Business Requirements
3) Tech Spec
4) API Documentation
...

> Enter your choice: 1
> Describe your feature: User authentication system
> Generating PRD...
```

## 🛠️ Available CLI Tools

### Core Templates
- `create-prd.sh` - Generate Product Requirements Document
- `create-brd.sh` - Generate Business Requirements Document
- `create-tech-spec.sh` - Generate Technical Specification
- `generate-tasks.sh` - Break PRD into actionable tasks
- `process-tasks.sh` - Execute tasks one by one

### Professional Templates
- `create-api-spec.sh` - API documentation
- `create-database-schema.sh` - Database design
- `create-runbook.sh` - Operational runbooks
- `create-test-plan.sh` - Test strategies
- `create-risk-register.sh` - Risk management

## 🔄 Workflow Comparison

### Cursor Users
```
1. Open Cursor
2. Use @.cursorrules/create-prd.mdc
3. AI generates in editor
4. Save file
```

### CLI Users
```bash
1. Run: ./cli-workflow/create-prd.sh "feature"
2. AI generates in terminal
3. Auto-saves to tasks/
4. Opens in $EDITOR (vim/nano/emacs)
```

## 🎯 Environment Setup

```bash
# Set your preferred editor
echo "export EDITOR=vim" >> ~/.bashrc

# Set your AI preference (for future API integration)
echo "export AI_PROVIDER=claude" >> ~/.bashrc
echo "export AI_MODEL=claude-3-opus" >> ~/.bashrc

# Optional: Set API keys for direct AI access
echo "export ANTHROPIC_API_KEY=your-key" >> ~/.bashrc
echo "export OPENAI_API_KEY=your-key" >> ~/.bashrc

source ~/.bashrc
```

## 📂 CLI Output Structure

```
vibe-prd/
├── tasks/                      # All generated documents
│   ├── prd-*.md               # PRDs
│   ├── brd-*.md               # BRDs
│   ├── tasks-*.md             # Task lists
│   └── archive/               # Completed projects
├── cli-workflow/              # CLI tools
│   ├── *.sh                   # Shell scripts
│   └── templates/             # CLI-optimized templates
└── output/                    # Generated code
```

## 🔗 Integration with Other Tools

### With tmux (Multiple Panes)
```bash
# Split screen: documentation | code | terminal
./cli-workflow/tmux-setup.sh
```

### With Git Workflow
```bash
# Auto-commit after each task
./cli-workflow/process-tasks.sh --git-commit

# Create feature branch for tasks
./cli-workflow/process-tasks.sh --branch feature/auth
```

### With Docker
```bash
# Run in container
docker run -v $(pwd):/workspace vibe-prd-cli

# Or use docker-compose
docker-compose run cli create-prd "My Feature"
```

## 🎨 Customization

### Add Your Own Templates

1. Create template in `cli-workflow/templates/`
2. Add shell script in `cli-workflow/`
3. Register in `cli-workflow/config.sh`

Example:
```bash
#!/bin/bash
# cli-workflow/create-custom.sh

TEMPLATE="cli-workflow/templates/custom.md"
OUTPUT="tasks/custom-$(date +%Y%m%d-%H%M%S).md"

echo "Creating custom document..."
cat $TEMPLATE | your-ai-tool > $OUTPUT
echo "Saved to $OUTPUT"
```

## 🤖 AI Provider Support

Currently supports (via copy/paste or API):
- ✅ Claude (Anthropic)
- ✅ ChatGPT (OpenAI)
- ✅ Gemini (Google)
- ✅ Local LLMs (Ollama)
- ✅ Any AI with text interface

## 📚 Examples

### Full Feature Development (CLI)
```bash
# 1. Create business requirements
./cli-workflow/create-brd.sh "E-commerce checkout"

# 2. Create technical PRD
./cli-workflow/create-prd.sh "Payment processing"

# 3. Generate task list
./cli-workflow/generate-tasks.sh tasks/prd-payment.md

# 4. Create API specification
./cli-workflow/create-api-spec.sh "Payment API"

# 5. Execute tasks
./cli-workflow/process-tasks.sh tasks/tasks-payment.md
```

## 🔍 Tips for CLI Users

1. **Use shell aliases** for frequently used commands:
```bash
alias prd='~/vibe-prd/cli-workflow/create-prd.sh'
alias tasks='~/vibe-prd/cli-workflow/generate-tasks.sh'
```

2. **Pipe to AI tools** directly:
```bash
cat professional-templates/create-prd.md | llm -m claude-3
```

3. **Use watch** for live updates:
```bash
watch -n 1 tail -n 50 tasks/current-task.md
```

4. **Combine with fzf** for interactive selection:
```bash
ls professional-templates/*.md | fzf | xargs cat | pbcopy
```

## 📝 Contributing

CLI users are welcome to contribute! We especially need:
- More shell scripts for automation
- Integration with popular CLI tools
- Terminal-based UI (TUI) options
- Vim/Emacs plugins

## 🆘 Support

- **CLI Issues**: Open issue with `[CLI]` tag
- **Feature Requests**: PRs welcome!
- **Discord**: Join #cli-users channel

---

Made with ❤️ for developers who live in the terminal