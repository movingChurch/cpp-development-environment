#!/bin/bash

echo "⚡ Installing Ninja (Linux)..."

sudo apt update
sudo apt install -y ninja-build

echo ""
ninja --version
