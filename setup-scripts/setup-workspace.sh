#!/usr/bin/env bash
set -euo pipefail
# Set up Jeremy's workspace to use central ~/ai-dev for all AI development
# Configures all projects to route ai-dev commands to ~/ai-dev

echo "🚀 Jeremy's AI-Dev Workspace Setup (v2.0)"
echo "=========================================="

WORKSPACE_ROOT="$HOME/projects"
AI_DEV_ROOT="$HOME/ai-dev"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "📁 Workspace: $WORKSPACE_ROOT"
echo "🎯 Central AI-Dev: $AI_DEV_ROOT"

# Verify central ~/ai-dev workspace exists
echo "📦 Verifying central AI-Dev workspace..."
if [ ! -d "$AI_DEV_ROOT" ]; then
    echo "❌ ~/ai-dev not found! Please run from ~/ai-dev directory."
    exit 1
fi
echo "✅ AI-Dev workspace confirmed at: $AI_DEV_ROOT"

# Find all git projects in workspace
echo "🔍 Scanning for git projects in $WORKSPACE_ROOT..."
projects=()
if [ -d "$WORKSPACE_ROOT" ]; then
    while IFS= read -r -d '' project; do
        projects+=("$project")
    done < <(find "$WORKSPACE_ROOT" -maxdepth 2 -name ".git" -type d -exec dirname {} \; 2>/dev/null | sort -u | tr '\n' '\0')
fi

echo "📊 Found ${#projects[@]} git repositories"

# Process each project
for project in "${projects[@]}"; do
    project_name=$(basename "$project")

    # Skip projects with comprehensive CLAUDE.md (they have their own systems)
    if [ -f "$project/CLAUDE.md" ]; then
        file_size=$(wc -l < "$project/CLAUDE.md" 2>/dev/null || echo "0")
        if [ "$file_size" -gt 50 ]; then
            echo "⏭️  Skipping $project_name (has comprehensive CLAUDE.md system)"
            continue
        fi
    fi

    echo "🔧 Setting up ai-dev integration: $project_name"

    # Run setup-project.sh in each project
    (
        cd "$project"
        "$SCRIPT_DIR/setup-project.sh"
    )

    echo "✅ Setup complete: $project_name"
done

echo ""
echo "🎉 Workspace setup complete!"
echo "📊 Processed: ${#projects[@]} projects"
echo "🎯 Central AI-Dev workspace: $AI_DEV_ROOT"
echo ""
echo "🚀 Usage:"
echo "  cd ~/ai-dev                           # Go to ai-dev workspace"
echo "  make create T=create-prd.md N=prd.md  # Create documents"
echo "  make status                           # Check pipeline status"
echo ""
echo "📍 From any project:"
echo "  make status                           # Routes to ~/ai-dev"
echo "  make create T=template N=name         # Routes to ~/ai-dev"