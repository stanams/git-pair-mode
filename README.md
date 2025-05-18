# Git Pair Mode

A lightweight tool to annotate Git commits with pair programming metadata — no backend required.

## 🔧 Features

- Enable/disable pairing mode in your repo
- Automatically appends `(paired with @username)` to commit messages
- Choose where to show pair info (in title or commit body)
- Git subcommand for title-line pair info
- Uses Git hooks, works locally, no login needed

## 🚀 Installation

To use the tool, you have two options: run it as a script locally, or make it available globally as a `git pair` command.

1. **Clone this repo:**

```bash
git clone https://github.com/stanams/git-pair-mode.git
cd git-pair-mode
```

2. **Make the install script executable:**

```bash
chmod +x install.sh
```

3. **Install the Git hook:**

```bash
./install.sh
```

4. **Make the scripts executable:**

```bash
chmod +x git-pair git-pair-commit git-pair-status
```

5. **Enable pairing mode:**

```bash
# Basic usage (pair info in title)
git pair --with username

# With pair info in commit body
git pair --with username --location body
```

6. **Check pair mode status:**

```bash
git pair-status
# => Shows if pair mode is on/off and current settings
```

7. **Commit as usual (default behavior):**

```bash
git commit -m "refactor: fix issue with auth"
# => message becomes:
# refactor: fix issue with auth
#
# (paired with @username)
```

8. **Commit with pair info in title:**

```bash
git pair-commit -m "refactor: fix issue with auth"
# => message becomes: refactor: fix issue with auth (paired with @username)
```

9. **Disable pairing mode:**

```bash
git pair --off
```

## 🧪 Using as a Git Subcommand Globally

To use `git pair` and `git pair-commit` just like native Git commands:

1. **Move the scripts to a folder in your PATH:**

```bash
sudo mv git-pair git-pair-commit git-pair-status /usr/local/bin/
```

2. **Use them like this:**

```bash
git pair --with your_username
git pair-status  # check current status
git pair-commit -m "your commit message"
```

> ℹ️ You can check that `/usr/local/bin` is in your path using:
>
> ```bash
> echo $PATH
> ```

---

## 🧪 Test locally

```bash
./git-pair --with alice
# Then make a commit and inspect the message
```

## 📁 Files

- `git-pair`: the CLI script
- `git-pair-commit`: Git subcommand for title-line pair info
- `git-pair-status`: Git subcommand to check pair mode status
- `hooks/prepare-commit-msg`: Git hook
- `install.sh`: helper to install hook

---
