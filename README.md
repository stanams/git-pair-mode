# Git Pair Mode

A lightweight tool to annotate Git commits with pair programming metadata — no backend required.

## 🔧 Features

- Enable/disable pairing mode in your repo
- Automatically appends `(paired with @username)` to commit messages
- Choose where to show pair info (in title or commit body)
- Git subcommand for title-line pair info
- Uses Git hooks, works locally, no login needed

## 🚀 Installation

1. **Clone this repo:**

```bash
git clone https://github.com/stanams/git-pair-mode.git
cd git-pair-mode
```

2. **Make the scripts executable:**

```bash
chmod +x git-pair git-pair-commit
```

3. **Install globally (recommended):**

```bash
sudo mv git-pair git-pair-commit /usr/local/bin/
```

4. **Install the Git hook:**

```bash
chmod +x install.sh
./install.sh
```

## 📝 Usage

### Basic Commands

```bash
# Enable pair mode (interactive)
git pair

# Enable pair mode with specific user
git pair --with username

# Check pair mode status
git pair status

# Disable pair mode
git pair --off
```

### Commit Options

```bash
# Regular commit (pair info in body)
git commit -m "your message"
# => your message
#
# (paired with @username)

# Commit with pair info in title
git pair-commit -m "your message"
# => your message (paired with @username)
```

### Configuration

```bash
# Set pair info location to body
git pair --location body

# Set pair info location to title
git pair --location title
```

## 🧪 Example Workflow

1. **Start a pairing session:**

```bash
git pair
# Enter username when prompted
```

2. **Check status:**

```bash
git pair status
# => Shows current pair mode and settings
```

3. **Make commits:**

```bash
# Using regular commit
git commit -m "feat: add new feature"

# Or using pair-commit for title-line pair info
git pair-commit -m "feat: add new feature"
```

4. **End pairing session:**

```bash
git pair --off
```

## 📁 Files

- `git-pair`: Main CLI script for managing pair mode
- `git-pair-commit`: Git subcommand for title-line pair info
- `hooks/prepare-commit-msg`: Git hook for commit messages
- `install.sh`: Helper to install Git hook

## 🔍 Troubleshooting

If commands aren't found:

1. Make sure scripts are executable: `chmod +x git-pair git-pair-commit`
2. Verify they're in your PATH: `which git-pair`
3. Check `/usr/local/bin` is in your PATH: `echo $PATH`

---
