#!/bin/bash

echo "🔧 Installing Git (Linux)..."

sudo apt update
sudo apt install -y git

echo ""
git --version
