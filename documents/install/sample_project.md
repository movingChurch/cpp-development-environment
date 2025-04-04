# 🧪 Sample C++ Project Setup and Build Guide

(Based on CMake + Clang + clangd + LLDB)

This document guides you through setting up a simple C++ project using CMake in a Modern C++ development environment, building it with Clang, and using clangd and LLDB for code analysis and debugging.

---

## 1. Project Structure

```plaintext
my_project/
├── CMakeLists.txt
├── src/
│   └── main.cpp
└── build/         ← CMake build directory (auto-generated)
```

---

## 2. Example CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.20)
project(HelloWorld LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Debug)

add_executable(hello_world src/main.cpp)
```

> ✅ Set `CMAKE_BUILD_TYPE` to `Debug` to include debugging symbols.

---

## 3. Example main.cpp

```cpp
#include <iostream>

int main() {
    int x = 42;
    int y = x * 2;
    std::cout << "Hello, Modern C++! y = " << y << std::endl;
    return 0;
}
```

---

## 4. Build and Run

### 4.1 CMake Build Commands

```bash
mkdir -p build
cd build
cmake ..
cmake --build .
```

### 4.2 Run

```bash
./hello_world
```

Example output:

``` bash
Hello, Modern C++! y = 84
```

---

## 5. Configuration for clangd

### 5.1 Auto-generate compile_commands.json

Add the following option to `CMakeLists.txt` or CMake command:

```bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
```

Or configure to auto-generate in the `CMake Tools` extension:

```json
"cmake.configureSettings": {
  "CMAKE_EXPORT_COMPILE_COMMANDS": "ON"
}
```

### 5.2 Verify Symbol Recognition

- Ensure clangd performs code analysis, auto-completion, error display, etc., correctly in VS Code
- Operates without `.vscode/c_cpp_properties.json`

---

## 6. Debugging (LLDB + CodeLLDB)

### 6.1 Prepare for Debugging

- Set `Debug` mode during build (`CMAKE_BUILD_TYPE=Debug`)
- The `build/hello_world` executable must include debugging symbols

### 6.2 Run Debugging (Using CMake Tools)

1. Open Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P`)
2. Execute `CMake: Debug`
3. LLDB-based debugging session starts automatically

---

## ✅ Summary

| Item | Description |
|------|------|
| Build System | CMake |
| Compiler | Clang |
| Language Server | clangd |
| Debugger | LLDB (using CodeLLDB extension) |
| Build Configuration | Debug mode, auto-generate `compile_commands.json` |
| Debugging Execution | Executable via `CMake: Debug` command without launch.json |
