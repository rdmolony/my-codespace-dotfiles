#!/bin/bash

echo "🚀 Setting up Codespace environment..."

# Install global npm packages
echo "📦 Installing npm packages..."
npm install -g @anthropic-ai/claude-code

# Determine which shell config file to use
if [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
else
    SHELL_CONFIG="$HOME/.bashrc"  # Default to bashrc
fi

# Add aliases (checking if they already exist to avoid duplicates)
echo "⚙️ Adding aliases to $SHELL_CONFIG..."
grep -q 'alias dsp=' "$SHELL_CONFIG" || echo 'alias dsp="claude --dangerously-skip-permissions"' >> "$SHELL_CONFIG"
grep -q 'alias dspc=' "$SHELL_CONFIG" || echo 'alias dspc="claude --dangerously-skip-permissions -c"' >> "$SHELL_CONFIG"

echo "✅ Setup complete!"