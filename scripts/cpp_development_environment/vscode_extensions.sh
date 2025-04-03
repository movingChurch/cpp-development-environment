#!/bin/bash

echo "🧩 Installing VS Code extensions..."

if ! command -v code &>/dev/null; then
  echo "❌ VS Code CLI (code) not found."
  echo "👉 Open VS Code → Cmd+Shift+P → 'Shell Command: Install code in PATH'"
  exit 1
fi

code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension ms-vscode.cmake-tools
code --install-extension vadimcn.vscode-lldb

echo "✅ VS Code extensions installed!"
