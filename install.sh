#!/bin/bash

# Install prepare-commit-msg Git hook

HOOK_PATH=".git/hooks/prepare-commit-msg"
SCRIPT_PATH="$(pwd)/hooks/prepare-commit-msg"

if [ ! -f ".git/config" ]; then
  echo "Not a Git repository. Run this from the root of a Git repo."
  exit 1
fi

mkdir -p .git/hooks
cp "$SCRIPT_PATH" "$HOOK_PATH"
chmod +x "$HOOK_PATH"
echo "✅ Git hook installed at $HOOK_PATH"
