#!/usr/bin/env bash
set -euo pipefail
# Add ai-dev pipeline to current project
# Creates ai-dev/ with docs, sop directories and templates link/copy

echo "🔧 vibe-prd project setup (v1.0)"
echo "=================================="

PROJECT_ROOT="$(pwd)"
PROJECT_NAME="$(basename "$PROJECT_ROOT")"

echo "📁 Project: $PROJECT_NAME"
echo "📍 Location: $PROJECT_ROOT"

# For now, just stub implementation
echo "⚠️  STUB: Project setup not yet implemented"
echo "📋 Would create:"
echo "   - ai-dev/{docs,sop,PRDs,ADRs,tasks,specifications}/"
echo "   - ai-dev/templates (symlink or copy)"
echo "   - ai-dev/README.md (pipeline tracker)"
echo "   - Makefile (document automation)"
echo ""
echo "✅ Stub execution complete"

exit 0