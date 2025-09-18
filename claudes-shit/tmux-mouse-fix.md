# 🖱️ Tmux Mouse Copy/Paste Fix

**Date:** 2025-09-18
**Problem:** Tmux mouse mode causing crazy panes to pop up during copy/paste
**Solution:** Disable problematic mouse behaviors

---

## 🔧 Permanent Fix (Recommended)

Add these lines to your `~/.tmux.conf` file:

```bash
# Fix mouse copy/paste issues
echo "# Fix mouse copy/paste issues" >> ~/.tmux.conf
echo "set -g mouse off" >> ~/.tmux.conf
echo "unbind -T copy-mode MouseDragEnd1Pane" >> ~/.tmux.conf
echo "unbind -T copy-mode-vi MouseDragEnd1Pane" >> ~/.tmux.conf

# Reload tmux config
tmux source-file ~/.tmux.conf
```

---

## ⚡ Quick Fix (Current Session Only)

```bash
# Disable mouse for current session
tmux set -g mouse off
```

**Or using tmux command mode:**
1. Press `Ctrl+b`
2. Type `:set -g mouse off`
3. Press Enter

---

## 🔄 Nuclear Option (Start Fresh)

If still having issues, kill all sessions and restart:

```bash
# Kill all tmux sessions
tmux kill-server

# Start new clean session
tmux new-session
```

---

## ✅ Verification

After applying fix, test copy/paste:
- Select text with mouse
- Should NOT create new panes
- Copy/paste should work normally

---

**This should stop the crazy pane splitting when trying to copy/paste!**