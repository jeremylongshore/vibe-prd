# 🔓 GitHub Branch Protection Commands

**Date:** 2025-09-18
**Purpose:** Temporarily disable/enable GitHub branch protection for rapid development

---

## 🚨 Disable Branch Protection (For Development)

```bash
# Remove all branch protection rules temporarily
gh api repos/jeremylongshore/vibe-prd/branches/main/protection -X DELETE
```

**Use when:** Need to push directly to main or merge without PR reviews during rapid development.

---

## 🔒 Re-enable Branch Protection (After Development)

```bash
# Restore production-ready branch protection
gh api repos/jeremylongshore/vibe-prd/branches/main/protection -X PUT \
  --field required_status_checks='{"strict":true,"contexts":[]}' \
  --field enforce_admins=true \
  --field required_pull_request_reviews='{"required_approving_review_count":1}'
```

**Settings Restored:**
- ✅ Require PR reviews (minimum 1 approval)
- ✅ Require status checks to pass
- ✅ Enforce rules for administrators
- ✅ Strict status checks (up-to-date branches)

---

## 🎯 Usage Pattern

```bash
# 1. Disable protection for feature work
gh api repos/jeremylongshore/vibe-prd/branches/main/protection -X DELETE

# 2. Do your rapid development work
git push origin main

# 3. Re-enable protection when stable
gh api repos/jeremylongshore/vibe-prd/branches/main/protection -X PUT \
  --field required_status_checks='{"strict":true,"contexts":[]}' \
  --field enforce_admins=true \
  --field required_pull_request_reviews='{"required_approving_review_count":1}'
```

---

## ⚠️ Important Notes

- **Only use during active development sprints**
- **Always re-enable before going public/production**
- **Document when protection is disabled in commit messages**
- **Never leave protection disabled long-term**

---

*Quick reference for Sprint 1 rapid development phase*