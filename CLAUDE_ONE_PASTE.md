# 🚀 Claude One-Paste Quickstart

1) Open Claude Code. Paste this entire block and send it:

You are Claude Code. Run locally.

mkdir -p ~/ai-dev && cd ~/ai-dev
if [ -d vibe-prd/.git ]; then cd vibe-prd && git fetch –all && git pull; else git clone https://github.com/jeremylongshore/vibe-prd.git && cd vibe-prd; fi

mkdir -p ~/.claude/commands
cp ./commands/new-project.md ~/.claude/commands/new-project.md || true

echo "Type /new-project in this chat to start."

2) Then type `/new-project` and answer 3 questions. Docs will be generated under `~/ai-dev/vibe-prd/completed-docs/<project-name>/`.
