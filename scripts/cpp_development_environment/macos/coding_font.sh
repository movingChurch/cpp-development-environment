#!/bin/bash

echo "✍️ Installing Fira Code font (macOS)..."

FONT_PATH="$HOME/Library/Fonts/FiraCode-Bold.ttf"
if [[ -f "$FONT_PATH" ]]; then
  echo "✅ Fira Code font already installed at $FONT_PATH"
else
  echo "📥 Downloading Fira Code font..."
  curl -L -o /tmp/FiraCode.zip https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
  unzip -o /tmp/FiraCode.zip -d /tmp/FiraCode
  cp /tmp/FiraCode/ttf/*.ttf "$HOME/Library/Fonts/"
  echo "✅ Fira Code font installed successfully."
  echo "📌 Restart your terminal or apps to apply the font."
fi
