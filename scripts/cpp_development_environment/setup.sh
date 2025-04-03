#!/bin/bash

set -e

# Detect OS
OS=""
if [[ "$OSTYPE" == "darwin"* ]]; then
  OS="macos"
  if ! command -v brew &>/dev/null; then
    echo "❌ Homebrew is not installed. Please install it first: https://brew.sh/"
    exit 1
  fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS="linux"
else
  echo "❌ Unsupported OS: $OSTYPE"
  exit 1
fi

echo "🧭 Detected OS: $OS"
echo "🔧 Starting Modern C++ environment setup for $OS..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$SCRIPT_DIR/$OS"

run_step() {
  echo ""
  echo "🔹 Running: $(basename "$1")"
  echo "----------------------------------------"
  bash "$1"
  echo "✅ Done: $(basename "$1")"
  echo "----------------------------------------"
}

# Run steps for the detected OS
run_step "$TARGET_DIR/clang.sh"
run_step "$TARGET_DIR/cmake.sh"
run_step "$TARGET_DIR/ninja.sh"
run_step "$TARGET_DIR/git.sh"
run_step "$TARGET_DIR/github_cli.sh"
run_step "$TARGET_DIR/coding_font.sh"
run_step "$TARGET_DIR/vscode.sh"
run_step "$SCRIPT_DIR/vscode_extensions.sh"
run_step "$SCRIPT_DIR/setup_sample_project.sh"

echo ""
echo "🎉 ✅ All components installed and configured successfully for $OS!"
