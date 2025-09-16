# BMAD Archive — Restoration Guide

The full BMAD source and notes are preserved here for later use.
Default workflow now uses Claude-only generation.

## Restore (optional)
1) Reintroduce BMAD targets into the Makefile (or a separate `Makefile.bmad`)
2) Pin docker image in `.bmad-version` and re-enable container-based steps
3) Update CI to include BMAD verification jobs

We recommend keeping Claude-only as the default for simplicity, and offering BMAD as an advanced/opt-in path.
