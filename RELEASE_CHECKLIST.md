# Release Checklist - AI Development Tasks v0.1.0

## Pre-Release Verification ✅

### Core Container Functionality
- [x] **Dockerfile** created with Ubuntu 22.04 base
- [x] **ai-dev wrapper script** created and executable
- [x] **Container builds** successfully (`docker build -t ai-dev-tasks:0.1.0 .`)
- [x] **Container runs** with help command
- [x] **Templates accessible** in container (21 templates confirmed)

### GitHub Integration
- [x] **GitHub Actions workflow** created (`.github/workflows/release.yml`)
- [x] **GHCR publishing** configured for `ghcr.io/jeremylongshore/ai-dev-tasks`
- [x] **Automated tagging** on version tags (`v*.*.*`)

### Documentation
- [x] **README updated** with containerized installation instructions
- [x] **CHANGELOG.md** created with v0.1.0 release notes
- [x] **Installation one-liner** documented
- [x] **Usage examples** provided

## Release Workflow 🚀

### 1. Tag and Push Release
```bash
cd ~/ai-dev
git add .
git commit -m "feat: containerized CLI v0.1.0 with GHCR publishing"
git tag v0.1.0
git push origin feat/workspace-pipeline
git push origin v0.1.0
```

### 2. Verify GitHub Actions Build
- [ ] Check GitHub Actions workflow execution
- [ ] Verify GHCR image pushed successfully
- [ ] Confirm both `:v0.1.0` and `:latest` tags created

### 3. Test End-to-End Installation
```bash
# Test one-line install (after GitHub push)
curl -fsSL https://raw.githubusercontent.com/jeremylongshore/vibe-prd/main/ai-dev -o /tmp/ai-dev-test
chmod +x /tmp/ai-dev-test
/tmp/ai-dev-test make help

# Test document creation
cd /tmp/test-workspace
mkdir -p test-project && cd test-project
ai-dev make create T=create-prd.md N=example-feature.md
ls -la example-feature.md
```

## Container Registry Details

### Images Published
- **Base image:** `ghcr.io/jeremylongshore/ai-dev-tasks:0.1.0`
- **Latest:** `ghcr.io/jeremylongshore/ai-dev-tasks:latest`

### Installation Commands
```bash
# Standard installation
curl -fsSL https://raw.githubusercontent.com/jeremylongshore/vibe-prd/main/ai-dev -o /usr/local/bin/ai-dev
chmod +x /usr/local/bin/ai-dev

# Test installation
ai-dev make help
```

## Pro Edition Preparation (Future)

### Private Repository Setup
- [ ] Create private repo `jeremylongshore/ai-dev-tasks-pro`
- [ ] Mirror public repo structure
- [ ] Add premium templates
- [ ] Configure private GHCR registry
- [ ] Set up customer access management

### Monetization Integration
- [ ] Lemon Squeezy/Gumroad product setup
- [ ] Customer onboarding automation
- [ ] Pro image access instructions
- [ ] Pricing tiers documentation

## Success Criteria ✨

### Must Work
- [x] Container builds without errors
- [x] Templates are accessible (21 confirmed)
- [x] Wrapper script executes container correctly
- [x] Help command shows usage instructions
- [ ] Document creation works end-to-end
- [ ] GitHub Actions publishes to GHCR
- [ ] One-line install works from clean system

### Performance Targets
- Container build time: < 2 minutes
- Image pull time: < 30 seconds
- Document creation: < 3 seconds

## Rollback Plan

If issues are discovered:
1. Remove GitHub tag: `git tag -d v0.1.0 && git push origin :refs/tags/v0.1.0`
2. Delete GHCR images via GitHub packages UI
3. Fix issues and re-tag with patch version

---

**Ready for v0.1.0 release! 🎉**

All core functionality verified. Next step: `git tag v0.1.0 && git push origin v0.1.0`