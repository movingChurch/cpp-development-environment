#!/bin/bash

echo "🏗️ Installing CMake (Linux)..."

sudo apt update
sudo apt install -y cmake

echo ""
cmake --version
