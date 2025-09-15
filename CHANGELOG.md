# Changelog

All notable changes to the AI Development Tasks containerized CLI will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2025-09-15

### Added
- **Containerized CLI** - Zero-ops deployment via Docker container
- **One-line install** - `curl | bash` installation for the `ai-dev` wrapper
- **GitHub Container Registry** - Automated builds and publishing to GHCR
- **22 Professional Templates** - Enterprise-grade documentation templates
  - Core Development: PRDs, Tech Specs, API Docs, Test Plans, Database Schema, ADRs
  - Project Management: Project Charters, RACI Matrices, Risk Registers, Task Generation
  - Business Documents: BRDs, User Stories, Design Docs, Post-Mortems
  - Operations: Runbooks, SOPs, RFCs, Task Processing
- **GitHub Actions** - Automated container builds on version tags
- **Version controlled** - Semantic versioning for reproducible deployments

### Features
- **Template System** - Read-only templates with working document generation
- **Container Isolation** - No local dependencies beyond Docker
- **Cross-platform** - Works on any system with Docker
- **Makefile Commands** - `make create`, `make status`, `make help`
- **Workspace Integration** - Optional local project setup scripts

### Container Images
- `ghcr.io/jeremylongshore/ai-dev-tasks:0.1.0` - Initial release
- `ghcr.io/jeremylongshore/ai-dev-tasks:latest` - Always points to latest stable

### Installation
```bash
curl -fsSL https://raw.githubusercontent.com/jeremylongshore/vibe-prd/main/ai-dev -o /usr/local/bin/ai-dev
chmod +x /usr/local/bin/ai-dev
ai-dev make help
```

### System Requirements
- Docker installed and running
- Internet connection for initial image pull

---

**Note:** This changelog starts with v0.1.0 as the first containerized release. Previous versions were local workspace implementations.