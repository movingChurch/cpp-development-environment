#!/bin/bash

echo "🧭 Installing GitHub CLI (Linux)..."

type -p curl >/dev/null || sudo apt install -y curl

echo "📥 Adding GitHub CLI apt repository..."
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg |
  sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg

sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" |
  sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null

sudo apt update
sudo apt install -y gh

echo ""
gh --version
