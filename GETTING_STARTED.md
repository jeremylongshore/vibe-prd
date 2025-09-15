# Getting Started - AI Development Tasks CLI

**What the hell did we just build?** A professional documentation system in a container that you can install in one line.

## What This Is

**A CLI tool that creates professional documents from templates.** Instead of starting with a blank file, you get enterprise-grade templates for PRDs, tech specs, API docs, etc.

Think of it as **"create-react-app but for documentation"**.

## How to Use It (The Simple Version)

### 1. Install (One Time)
```bash
curl -fsSL https://raw.githubusercontent.com/jeremylongshore/vibe-prd/main/ai-dev -o /usr/local/bin/ai-dev
chmod +x /usr/local/bin/ai-dev
```

### 2. Use It (Every Time)
```bash
# Go to any project directory
cd ~/my-project

# Create a document from a template
ai-dev make create T=create-prd.md N=my-feature.md

# That's it! You now have "my-feature.md" in your current directory
```

### 3. Edit the Document
- Open `my-feature.md` in your editor
- It's a pre-filled template with prompts
- Fill in the blanks, delete what you don't need
- Save it

## What Templates Are Available?

**22 professional templates for everything:**

### Most Useful Ones:
- `create-prd.md` - Product Requirements Document (for new features)
- `create-tech-spec.md` - Technical Specification (how to build it)
- `adr-template.md` - Architecture Decision Record (why we chose X over Y)
- `create-api-spec.md` - API Documentation
- `generate-tasks.md` - Break work into tasks

### See All Templates:
```bash
ai-dev make help
```

## Example: Creating a PRD

```bash
# 1. Go to your project
cd ~/my-awesome-app

# 2. Create a PRD for a new feature
ai-dev make create T=create-prd.md N=user-dashboard-prd.md

# 3. Now you have "user-dashboard-prd.md" with sections like:
#    - Problem Statement
#    - Success Metrics
#    - User Stories
#    - Technical Requirements
#    - etc.

# 4. Edit it with your favorite editor
code user-dashboard-prd.md
vim user-dashboard-prd.md
```

## What's Actually Happening?

### Behind the Scenes:
1. **Docker container** runs with 22 templates inside
2. **Templates are copied** to your current directory
3. **You edit** the copied file locally
4. **Container disappears** - no mess left behind

### Why It's Cool:
- **No installation** beyond Docker
- **Always up-to-date** templates (we update the container)
- **Works anywhere** Docker works
- **No dependencies** on your system

## Common Questions

### "Do I need to understand Docker?"
**No.** Just install the `ai-dev` command and use it. Docker runs in the background.

### "Where do my documents go?"
**Your current directory.** If you're in `/home/user/my-project`, that's where the document appears.

### "Can I modify the templates?"
**The originals? No.** But once you create a document, it's yours to edit however you want.

### "What if I'm offline?"
**First time needs internet** to download the container. After that, works offline.

### "How do I update templates?"
```bash
# Pull latest templates
docker pull ghcr.io/jeremylongshore/ai-dev-tasks:latest
```

## Real-World Usage

### For a New Feature:
```bash
# 1. Create PRD
ai-dev make create T=create-prd.md N=user-auth-prd.md

# 2. Create tech spec
ai-dev make create T=create-tech-spec.md N=user-auth-spec.md

# 3. Break into tasks
ai-dev make create T=generate-tasks.md N=user-auth-tasks.md
```

### For an API:
```bash
# Document the API
ai-dev make create T=create-api-spec.md N=users-api.md
```

### For a Decision:
```bash
# Document why you chose React over Vue
ai-dev make create T=adr-template.md N=adr-001-frontend-framework.md
```

## That's It!

You now have a professional documentation system that works in any project, on any machine, with zero setup.

**TL;DR:** Run `ai-dev make create T=create-prd.md N=whatever.md` to get a professional document template instantly.

---

**Questions?** The templates are self-explanatory - they have prompts and examples built in.