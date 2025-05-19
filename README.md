# Git Pair Mode

A lightweight tool to annotate Git commits with pair programming metadata - and get pairing stats.

## 🔧 Features

- Enable/disable pairing mode in your repo
- Automatically appends `(paired with @username)` to commit messages
- Choose between title or body placement using different commit commands
- GitHub username verification
- Interactive commit options
- Pair programming statistics (works even when pair mode is off)
- Uses Git hooks, works locally, no login needed

## 🚀 Installation

### 🍺 Homebrew Installation

```bash
# Install Git Pair Mode via Homebrew
brew tap stanams/tap
brew install git-pair-mode
```

### Manual installation

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

# Enable pair mode with specific user
git pair --with username

# Check pair mode status
git pair status

# Show pairing statistics (works even when pair mode is off)
git pair stats        # Show today's stats
git pair stats week   # Show this week's stats
git pair stats month  # Show this month's stats

# Disable pair mode
git pair --off
```

### Commit Commands

When pair mode is on, you have two options for adding pair info to your commits:

1. **In the commit body (default):**

```bash
git commit -m "your message"
# => your message
#
# (paired with @username)
```

2. **In the commit title:**

```bash
git pair-commit -m "your message"
# => your message (paired with @username)
```

> **Note:** Why we can't replace `git commit` itself to directly append "(paired with @username)" to the commit's title:
>
> Git's built-in sub-commands always take precedence over aliases or external helpers that share the same name. Because `commit` is one of those built-ins, Git will never execute a custom `git-commit` script, nor accept an alias that shadows it. Hooks can only edit the message after Git has created the commit (and they can't remove the blank line that separates title and body), so they can't force the pair info onto the same line either.
>
> Check this [Stack Overflow thread](https://stackoverflow.com/questions/3538774/is-it-possible-to-override-git-command-by-git-alias) for more details.

## 🧪 Example Workflow

1. **Start a pairing session:**

```bash
git pair
# => Prompts for GitHub username
# => Verifies username exists on GitHub
# => Shows available commands
```

2. **Check status:**

```bash
git pair status
# => Shows current pair mode and settings
```

3. **Make commits:**

```bash
# Add pair info to commit body
git commit -m "feat: add new feature"

# Or add pair info to commit title
git pair-commit -m "feat: add new feature"
```

4. **View statistics:**

```bash
git pair stats
# => Shows today's pairing statistics:
#    - Total commits
#    - Paired commits
#    - Pair percentage
#    - List of pairing partners
```

5. **End pairing session:**

```bash
git pair --off
```

## 📁 Files

- `git-pair`: Main CLI script for managing pair mode
- `hooks/prepare-commit-msg`: Git hook for commit messages
- `install.sh`: Helper to install Git hook
- `tests/`: Directory containing test scripts and documentation

## 🧪 Testing

The project includes a comprehensive test suite to ensure all features work correctly. The tests cover:

- GitHub username verification
- Pair mode commands (enable/disable/status)
- Commit commands (regular and pair-commit)
- Statistics functionality

To run the tests:

```bash
chmod +x tests/test-git-pair.sh
./tests/test-git-pair.sh
```

For more details about the test suite, see the [tests README](tests/README.md).

## 🔍 Troubleshooting

If commands aren't found:

1. If installed via Homebrew:

   - Verify installation: `brew list git-pair-mode`
   - Check Homebrew's bin directory is in your PATH: `echo $PATH`

2. If installed manually:
   - Make sure script is executable: `chmod +x git-pair`
   - Verify it's in your PATH: `which git-pair`
   - Check `/usr/local/bin` is in your PATH: `echo $PATH`

If GitHub username verification fails:

1. Ensure you have `curl` installed
2. Check your internet connection
3. Verify the GitHub username exists

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
