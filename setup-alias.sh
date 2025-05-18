#!/bin/bash

# Get the absolute path to the git-pair-commit script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PAIR_COMMIT_SCRIPT="$SCRIPT_DIR/git-pair-commit"

# Make sure the script is executable
chmod +x "$PAIR_COMMIT_SCRIPT"

# Create the alias
git config --global alias.commit-pair '!f() { if [ -f ".git/.pair" ]; then "$SCRIPT_DIR/git-pair-commit" "$@"; else git commit "$@"; fi; }; f'

echo "✅ Git alias 'commit-pair' has been set up."
echo "You can now use 'git commit-pair' instead of 'git commit'."
echo "When pair mode is active, it will automatically append the pair info to the title."
echo "When pair mode is off, it will work like a regular git commit." 