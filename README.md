# Git Pair Mode

A lightweight tool to annotate Git commits with pair programming metadata — no backend required.

## 🔧 Features
- Enable/disable pairing mode in your repo
- Automatically appends `(paired with @username)` to commit messages
- Uses Git hooks, works locally, no login needed

## 🚀 Installation

1. **Clone this repo:**
```bash
git clone https://github.com/your-username/git-pair-mode.git
cd git-pair-mode
```

2. **Install the Git hook:**
```bash
./install.sh
```

3. **Enable pairing mode:**
```bash
git pair --with username
```

4. **Commit as usual:**
```bash
git commit -m "refactor: fix issue with auth"
# => message becomes: refactor: fix issue with auth (paired with @username)
```

5. **Disable pairing mode:**
```bash
git pair --off
```

## 🧪 Test locally
```bash
./git-pair --with alice
# Then make a commit and inspect the message
```

## 📁 Files
- `git-pair`: the CLI script
- `hooks/prepare-commit-msg`: Git hook
- `install.sh`: helper to install hook

---

MIT License
