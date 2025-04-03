#!/bin/bash

echo "🧱 Installing Clang and clangd (macOS)..."

xcode-select --install || true

if ! command -v clangd &>/dev/null; then
  echo "📦 Installing clangd via Homebrew..."
  brew install clangd
else
  echo "✅ clangd already installed."
fi

echo ""
clang --version
clangd --version
