# BMAD Method Archive

**Archived:** 2025-09-16T17:13:00Z
**Reason:** Simplified repo to one-paste Claude workflow; BMAD removed from default path

## What's Archived Here

- `src/` - Complete BMAD source code (node_modules removed to shrink footprint)
- `native-outputs/` - BMAD native analysis outputs from previous runs

## Why Archived

BMAD was a powerful AI-assisted analysis tool, but added complexity for beginners. The repo now focuses on a simple "one-paste Claude prompt" workflow that generates docs directly from the 22 enhanced templates without additional dependencies.

## How to Reactivate BMAD Later

1. **Restore source:**
   ```bash
   cp -r archive/bmad-method/src ./bmad
   cd bmad && npm install  # Reinstall dependencies
   ```

2. **Update Makefile** to include BMAD targets:
   ```makefile
   bmad-run:
       docker run --rm -v "$(PWD)":/workspace ghcr.io/jeremylongshore/bmad:5.1.3
   ```

3. **Restore CI/CD** if needed (check `.github/workflows/` for BMAD-specific actions)

## Note About Dependencies

- **No node_modules checked in** - Run `npm install` after restoration
- BMAD container image still available: `ghcr.io/jeremylongshore/bmad:5.1.3`
- Native outputs preserved in `native-outputs/` for reference

## Integration Notes

BMAD was designed to:
- Analyze project context through AI
- Generate comprehensive technical analysis
- Populate templates with AI-driven insights
- Provide enterprise-grade documentation workflow

The simplified workflow now uses Claude Code directly with the enhanced template library for immediate results.