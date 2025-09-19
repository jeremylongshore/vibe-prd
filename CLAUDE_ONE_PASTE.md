# Claude One-Paste Setup

Paste this into Claude Code:

```
mkdir -p ~/ai-dev && cd ~/ai-dev
if [ -d vibe-prd/.git ]; then cd vibe-prd && git pull; else git clone https://github.com/jeremylongshore/vibe-prd.git && cd vibe-prd; fi
mkdir -p ~/.claude/commands
cp commands/new-project.md ~/.claude/commands/
echo "Setup complete. Type /new-project to start."
```

Then type `/new-project` and answer questions to generate professional project documentation.
