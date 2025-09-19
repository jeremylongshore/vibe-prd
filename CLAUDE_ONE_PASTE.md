# Claude One-Paste Setup

Paste this into Claude Code:

```
mkdir -p ~/ai-dev && cd ~/ai-dev
if [ -d .git ]; then git pull --rebase --autostash || true; else git clone https://github.com/jeremylongshore/vibe-prd.git ~/ai-dev; fi
mkdir -p ~/.claude/commands
cp commands/new-project.md ~/.claude/commands/ 2>/dev/null || true
echo "Setup complete. Type /new-project to start."
```

Then type `/new-project` and answer questions to generate professional project documentation.
