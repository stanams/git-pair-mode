# Git Pair Mode

A lightweight tool to annotate Git commits with pair programming metadata — no backend required.

## 🔧 Features

- Enable/disable pairing mode in your repo
- Automatically appends `(paired with @username)` to commit messages
- Choose where to show pair info (in title or commit body)
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

4. **Enable pairing mode:**

```bash
# Basic usage (pair info in title)
git pair --with username

# With pair info in commit body
git pair --with username --location body
```

5. **Commit as usual (default behavior):**

```bash
git commit -m "refactor: fix issue with auth"
# => message becomes:
# refactor: fix issue with auth
#
# (paired with @username)
```

6. **[Optional] Commit with pair info on the same line as the title:**

```bash
./git-pair-commit -m "refactor: fix issue with auth"
# => message becomes: refactor: fix issue with auth (paired with @username)
# Note: The pair info is only in the title, not duplicated in the body.
```

7. **Disable pairing mode:**

```bash
git pair --off
```

## 🧪 Using as a Git Subcommand Globally

To use `git pair` just like native Git commands:

1. **Make the script executable:**

```bash
chmod +x git-pair
```

2. **Move it to a folder in your PATH:**

```bash
sudo mv git-pair /usr/local/bin/git-pair
```

3. **Use it like this:**

```bash
git pair --with your_username
git pair --with your_username --location body
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
- `git-pair-commit`: optional commit wrapper for pair info in title
- `hooks/prepare-commit-msg`: Git hook
- `install.sh`: helper to install hook

---
