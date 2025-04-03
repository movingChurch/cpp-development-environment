#!/bin/bash

echo "🖥️ Installing Visual Studio Code (Linux)..."

if ! command -v snap &>/dev/null; then
  echo "📦 snap is not installed. Installing snapd..."
  sudo apt update
  sudo apt install -y snapd

  sudo systemctl enable snapd
  sudo systemctl start snapd

  if [[ ! -e /snap ]]; then
    sudo ln -s /var/lib/snapd/snap /snap
  fi

  echo "✅ snapd installed and started."
fi

if sudo snap install --classic code; then
  echo "✅ VS Code installed successfully via snap."
else
  echo "⚠️ Failed to install VS Code using snap."
  echo "   Please install it manually: https://code.visualstudio.com/docs/setup/linux"
  exit 1
fi

echo ""
echo "✅ Visual Studio Code setup completed."
