# CI/CD Pipeline Failure Postmortem

**Date:** 2025-09-15
**Duration:** Multiple failures over 6 hours
**Status:** RESOLVED

## Executive Summary

The GitHub Actions CI pipeline was failing on the "Test document creation" step due to incorrect container working directory and file path resolution when testing the containerized CLI functionality.

## Failing Step and Log Excerpt

**Failed Step:** `test-containerized-cli` → `Test document creation`

**Key Error Log:**
```
2025-09-15T22:43:05.7628000Z 🧪 Testing document creation...
2025-09-15T22:43:05.9647388Z ❌ Document not created
2025-09-15T22:43:05.9663424Z ##[error]Process completed with exit code 1.
```

**Command that failed:**
```bash
docker run --rm -v "$PWD/test-workspace":/workspace ai-dev-tasks-test bash -c "cd /app && make create T=create-prd.md N=test-prd.md"
```

## Root Cause Analysis

1. **Working Directory Mismatch**: The container's Makefile (`WORKSPACE=/workspace`) expects to write to `/workspace`, but the test was running `make` from `/app` directory
2. **Path Resolution Issue**: The `make create` command was not properly setting the workspace path for file output
3. **Inadequate Container Testing**: The CI wasn't properly validating the end-to-end document creation workflow

## Fix Applied

### 1. Corrected Container Command
**Before:**
```bash
docker run --rm -v "$PWD/test-workspace":/workspace ai-dev-tasks-test bash -c "cd /app && make create T=create-prd.md N=test-prd.md"
```

**After:**
```bash
docker run --rm -v "$PWD/test-workspace":/workspace -w /workspace \
  ghcr.io/${{ github.repository }}:${{ github.sha }} \
  bash -c "WORKSPACE=/workspace make -C /app create T=create-prd.md N=test-prd.md"
```

**Key changes:**
- Added `-w /workspace` to set working directory
- Used `WORKSPACE=/workspace` environment variable
- Used `make -C /app` to run make from correct directory while maintaining workspace path

### 2. Hardened CI Workflow
Applied production-ready workflow with:
- ✅ Proper permissions (`contents: write`, `packages: write`)
- ✅ Concurrency control to prevent race conditions
- ✅ Docker Buildx with caching (`cache-from/to: type=gha`)
- ✅ Conditional GHCR push (only on tags, not PRs)
- ✅ Comprehensive shellcheck validation
- ✅ End-to-end document creation testing with content verification

### 3. Simplified Release Workflow
- Separated release logic from CI
- Added automatic release notes generation
- Proper tag-based triggering

## Guardrails Added

1. **Concurrency Control**: Prevents multiple CI runs from interfering
2. **Comprehensive Testing**: Tests actual CLI workflow, not just container build
3. **Cache Optimization**: GitHub Actions cache reduces build times
4. **Content Verification**: Validates created documents contain expected content
5. **Proper Permissions**: Explicitly set required token scopes

## How to Reproduce and Verify

### Local Reproduction:
```bash
# Reproduce the original failure
mkdir test-workspace
docker run --rm -v "$PWD/test-workspace":/workspace ai-dev-tasks-test \
  bash -c "cd /app && make create T=create-prd.md N=test-prd.md"
ls test-workspace/  # Empty - failure reproduced

# Verify the fix
docker run --rm -v "$PWD/test-workspace":/workspace -w /workspace \
  ai-dev-tasks-test bash -c "WORKSPACE=/workspace make -C /app create T=create-prd.md N=test-prd.md"
ls test-workspace/  # Should contain test-prd.md
```

### CI Verification:
```bash
# Create test tag to trigger release workflow
git tag v0.1.1 && git push origin v0.1.1

# Monitor CI status
gh pr checks --watch
```

## Impact

- **Before**: 7 consecutive CI failures, blocking development workflow
- **After**: Green CI on main, PRs, and tag builds
- **Container Publishing**: Successfully publishing to GHCR on releases
- **User Experience**: One-line install works correctly

## Lessons Learned

1. **Container Testing Must Be End-to-End**: Testing container build ≠ testing container functionality
2. **Working Directory Matters**: Always verify file paths when mounting volumes
3. **Environment Variables**: Critical for containerized workflows to maintain path consistency
4. **Fail Fast with Debugging**: Add verbose output to CI steps for faster troubleshooting

## Prevention Measures

- Added content verification to document creation tests
- Implemented proper error messaging in CI steps
- Added smoke tests for core container functionality
- Established clear separation between CI and release workflows

---

**Status:** ✅ RESOLVED - All CI checks now green, container publishing working correctly