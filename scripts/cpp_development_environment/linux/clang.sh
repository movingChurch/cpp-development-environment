#!/bin/bash

echo "🧱 Installing Clang and clangd (Linux)..."

sudo apt update
sudo apt install -y clang clangd

echo ""
clang --version
clangd --version
