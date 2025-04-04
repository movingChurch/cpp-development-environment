# 🧱 Clang Installation Guide

Clang is a high-performance C/C++ compiler that is part of the LLVM project, supporting the latest C++ standards (C++17/20/23, etc.). For Modern C++ development, Clang offers faster build times and excellent diagnostic messages compared to GCC.

> ✅ This document guides you through the installation of Clang on Windows, macOS, and Linux (Ubuntu) environments.

---

## 📌 Prerequisites Before Installation

- Administrator or sudo privileges
- Internet connection
- Basic terminal/command prompt usage skills

---

## 🪟 Installing Clang on Windows

### Method 1: Using the Official LLVM Installer

1. Visit the [LLVM official download page](https://releases.llvm.org/download.html)
2. Download the installer for Windows (`LLVM-x.y.z-win64.exe`)
3. During installation, enable the following options:
   - Add LLVM to the system PATH
   - Install Clang tools

4. After installation, open `cmd` or `PowerShell` and verify with the following command:

```bash
clang --version
```

### Method 2: Using Chocolatey (Recommended)

```powershell
choco install llvm -y
```

> Note: Chocolatey must be installed. [https://chocolatey.org/install](https://chocolatey.org/install)

---

## 🍎 Installing Clang on macOS

### Method 1: Using Xcode Command Line Tools (Recommended)

```bash
xcode-select --install
```

- Verify after installation:

```bash
clang --version
```

### Method 2: Using Homebrew

```bash
brew install llvm
```

- Add LLVM binaries to PATH after installation (e.g., `~/.zshrc` or `~/.bash_profile`)

```bash
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
```

---

## 🐧 Installing Clang on Ubuntu/Linux

### Method 1: Using apt Package

```bash
sudo apt update
sudo apt install clang
```

- For the latest version, add the official LLVM repository:

```bash
# Example: Installing Clang 16
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 16
```

- Verify installation:

```bash
clang++ --version
```

---

## ✅ Verification of Installation

You can verify that Clang is installed correctly with the following commands:

```bash
clang --version
clang++ --version
```

Example output:

```bash
clang version 16.0.6 (https://github.com/llvm/llvm-project.git ...)
Target: x86_64-apple-darwin22.4.0
Thread model: posix
```

---

## ⚙️ Additional Configuration (Optional)

- **Specify C++ Standard**: By default, specify the standard with flags like `-std=c++20`.

```bash
clang++ -std=c++20 -o main main.cpp
```

- **Include Debugging Symbols**:

```bash
clang++ -g -O0 -std=c++20 -o main main.cpp
```

- **Using with CMake**: To specify Clang in CMakeLists.txt, configure as follows:

```cmake
set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)
```

---

## 🔗 Reference Links

- LLVM Official Website: <https://llvm.org>
- Clang Documentation: <https://clang.llvm.org/docs/index.html>
- CMake and Clang Integration: <https://cmake.org/cmake/help/latest/variable/CMAKE_CXX_COMPILER.html>

---

## 📌 Summary

| Item | Description |
|------|-------------|
| Target | Clang (C/C++ Compiler) |
| Supported OS | Windows, macOS, Ubuntu/Linux |
| Installation Method | Package manager or official installer |
| Verification Method | `clang --version` |
| Additional Configuration | C++20 or higher, debugging symbols, CMake integration, etc. |
