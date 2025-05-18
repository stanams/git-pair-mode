# Git Pair Mode

A lightweight tool to annotate Git commits with pair programming metadata — no backend required.

## 🔧 Features

- Enable/disable pairing mode in your repo
- Automatically appends `(paired with @username)` to commit messages
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
git pair --with username
```

5. **Commit as usual:**

```bash
git commit -m "refactor: fix issue with auth"
# => message becomes: refactor: fix issue with auth (paired with @username)
```

6. **Disable pairing mode:**

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
```

> ℹ️ You can check that `/usr/local/bin` is in your path using:
>
> ```bash
> echo $PATH
> ```

````

---

## 🧪 Test locally
```bash
./git-pair --with alice
# Then make a commit and inspect the message
````

## 📁 Files

- `git-pair`: the CLI script
- `hooks/prepare-commit-msg`: Git hook
- `install.sh`: helper to install hook

---
