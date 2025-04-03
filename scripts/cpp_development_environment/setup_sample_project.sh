#!/bin/bash

echo "📁 Creating sample C++ project..."

PROJECT_DIR="$HOME/cpp-sample"
SRC_DIR="$PROJECT_DIR/src"
BUILD_DIR="$PROJECT_DIR/build"

# 기존 디렉토리 존재 시 알림
if [[ -d "$PROJECT_DIR" ]]; then
    echo "⚠️ Directory $PROJECT_DIR already exists."
    echo "   Contents may be overwritten."
fi

mkdir -p "$SRC_DIR"
cd "$PROJECT_DIR"

# Create CMakeLists.txt
cat <<EOF >CMakeLists.txt
cmake_minimum_required(VERSION 3.20)
project(HelloWorld LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_BUILD_TYPE Debug)
add_executable(hello_world src/main.cpp)
EOF

# Create main.cpp
cat <<EOF >"$SRC_DIR/main.cpp"
#include <iostream>
int main() {
    int x = 42;
    int y = x * 2;
    std::cout << "Hello, Modern C++! y = " << y << std::endl;
    return 0;
}
EOF

# Build project
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

echo "🔨 Running CMake configure & build..."
if cmake .. && cmake --build .; then
    echo "✅ Sample project built successfully!"
    echo ""
    echo "🚀 Running executable:"
    echo "------------------------"
    ./hello_world
    echo "------------------------"
else
    echo "❌ Build failed. Please check CMake and compiler installation."
    exit 1
fi
