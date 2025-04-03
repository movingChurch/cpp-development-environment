#!/bin/bash

echo "✍️ Installing Fira Code font (Linux)..."

if command -v fc-list >/dev/null && fc-list | grep -i "FiraCode" >/dev/null; then
  echo "✅ Fira Code font is already installed."
else
  sudo apt update
  sudo apt install -y fonts-firacode
  echo "✅ Fira Code font installed. Restart your apps to apply it."
fi
