# 🏗️ CMake Installation Guide

CMake is a platform-independent C/C++ build system used with various compilers like Clang, GCC, and MSVC in Modern C++ projects. This document provides installation methods and basic configuration for CMake across different operating systems.

---

## 📌 Prerequisites Before Installation

- Administrator privileges (sudo or admin account)
- Internet connection
- Basic terminal or command prompt usage skills

---

## 🪟 Installing CMake on Windows

### Method 1: Using the Official Installer (Recommended)

1. Visit the [CMake official download page](https://cmake.org/download/)
2. Download the installer for Windows (`.msi`)
3. During installation, select the following option:
   - ✅ Add CMake to the system PATH for all users

4. Verify installation in the command line (cmd or PowerShell):

```bash
cmake --version
```

### Method 2: Using Chocolatey

```powershell
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System' -y
```

> Chocolatey must be installed: [https://chocolatey.org/install](https://chocolatey.org/install)

---

## 🍎 Installing CMake on macOS

### Method 1: Using Homebrew (Recommended)

```bash
brew install cmake
```

### Method 2: Using the Official Installer

1. Download the `.dmg` file from the [CMake download page](https://cmake.org/download/)
2. After installation, run `/Applications/CMake.app`
3. Click "Tools > How to Install For Command Line Use" in the menu
4. Follow the instructions to create a symbolic link:

```bash
sudo "/Applications/CMake.app/Contents/bin/cmake-gui" --install
```

---

## 🐧 Installing CMake on Ubuntu/Linux

### Method 1: Using apt Package (Default Version)

```bash
sudo apt update
sudo apt install cmake
```

> The default apt repository may have an older version.

### Method 2: Using Kitware Official PPA (Recommended for Latest Version)

```bash
sudo apt update
sudo apt install -y software-properties-common
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ focal main'
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc | sudo apt-key add -
sudo apt update
sudo apt install cmake
```

> Based on Ubuntu 20.04. Refer to [Kitware APT documentation](https://apt.kitware.com/) for other versions.

### Method 3: Building from Source (Alternative)

```bash
wget https://github.com/Kitware/CMake/releases/download/v3.27.0/cmake-3.27.0.tar.gz
tar -zxvf cmake-3.27.0.tar.gz
cd cmake-3.27.0
./bootstrap
make -j$(nproc)
sudo make install
```

---

## ✅ Verification of Installation

Verify installation with the following command:

```bash
cmake --version
```

Example output:

```bash
cmake version 3.27.0

CMake suite maintained and supported by Kitware (kitware.com/cmake)
```

---

## ⚙️ Basic Usage Example

### 1. Directory Structure

```plaintext
my_project/
├── CMakeLists.txt
└── src/
    └── main.cpp
```

### 2. Example CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.20)
project(MyApp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
add_executable(MyApp src/main.cpp)
```

### 3. Build Commands

```bash
cmake -S . -B build
cmake --build build
```

---

## 🔗 Reference Links

- CMake Official Website: <https://cmake.org>
- Kitware APT Repository Guide: <https://apt.kitware.com>
- CMake Documentation: <https://cmake.org/cmake/help/latest/>
- GitHub Repository: <https://github.com/Kitware/CMake>

---

## 📌 Summary

| Item         | Description                                      |
|--------------|--------------------------------------------------|
| Target       | CMake (C++ Build System)                         |
| Supported OS | Windows, macOS, Ubuntu/Linux                     |
| Installation Method | Official installer, package manager, source build |
| Verification Method | `cmake --version`                         |
| Key Features | Platform-independent build, supports Clang/GCC/MSVC |
