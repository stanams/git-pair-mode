# Git Pair Mode

A lightweight tool to annotate Git commits with pair programming metadata — no backend required.

## 🔧 Features

- Enable/disable pairing mode in your repo
- Automatically appends `(paired with @username)` to commit messages
- Choose where to show pair info (in title or commit body)
- GitHub username verification
- Interactive commit options
- Uses Git hooks, works locally, no login needed

## 🚀 Installation

1. **Clone this repo:**

```bash
git clone https://github.com/stanams/git-pair-mode.git
cd git-pair-mode
```

2. **Make the script executable:**

```bash
chmod +x git-pair
```

3. **Install globally (recommended):**

```bash
sudo mv git-pair /usr/local/bin/
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
# => Prompts for GitHub username and commit options

# Enable pair mode with specific user
git pair --with username
# => Verifies GitHub username and prompts for commit options

# Check pair mode status
git pair status

# Disable pair mode
git pair --off
```

### Commit Options

When pair mode is on, you can choose if pairing info is on the commit title or body by running one of these 2 commands:

1. **In the commit title:**

```bash
git pair-commit -m "your message"
# => your message (paired with @username)
```

2. **In the commit body:**

```bash
git commit -m "your message"
# => your message
#
# (paired with @username)
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
# => Prompts for GitHub username
# => Verifies username exists on GitHub
# => Asks for commit options
# => Shows available commands
```

2. **Check status:**

```bash
git pair status
# => Shows current pair mode and settings
```

3. **Make commits:**

```bash
# The pair info will be added automatically based on your preference
git commit -m "feat: add new feature"
```

4. **End pairing session:**

```bash
git pair --off
```

## 📁 Files

- `git-pair`: Main CLI script for managing pair mode
- `hooks/prepare-commit-msg`: Git hook for commit messages
- `install.sh`: Helper to install Git hook

## 🔍 Troubleshooting

If commands aren't found:

1. Make sure script is executable: `chmod +x git-pair`
2. Verify it's in your PATH: `which git-pair`
3. Check `/usr/local/bin` is in your PATH: `echo $PATH`

If GitHub username verification fails:

1. Ensure you have `curl` installed
2. Check your internet connection
3. Verify the GitHub username exists

---
