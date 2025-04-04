# ⚡ Ninja Installation Guide

Ninja is a fast build system that supports efficient builds in Modern C++ projects when used with CMake. This document provides installation methods for Ninja across different operating systems and instructions on using it with CMake.

---

## 📌 Prerequisites Before Installation

- Administrator privileges (sudo or admin account)
- Internet connection
- CMake ≥ 3.16 recommended

---

## 🪟 Installing Ninja on Windows

### Method 1: Using Chocolatey (Recommended)

```powershell
choco install ninja -y
```

> Chocolatey must be installed: <https://chocolatey.org/install>

### Method 2: Manual Installation

1. Download `ninja-win.zip` from the [Ninja Releases](https://github.com/ninja-build/ninja/releases) page
2. Extract and save `ninja.exe` to an appropriate path (e.g., `C:\Tools\Ninja`)
3. Add this path to the system environment variable PATH

### Verification of Installation

```powershell
ninja --version
```

---

## 🍎 Installing Ninja on macOS

### Method 1: Using Homebrew (Recommended)

```bash
brew install ninja
```

### Method 2: Manual Installation

1. Download `ninja-mac.zip` from GitHub Releases
2. Extract and copy to `/usr/local/bin` or a user PATH

### Verification of Installation

```bash
ninja --version
```

---

## 🐧 Installing Ninja on Ubuntu/Linux

### Method 1: Using apt Package

```bash
sudo apt update
sudo apt install ninja-build
```

### Method 2: Manual Installation

```bash
wget https://github.com/ninja-build/ninja/releases/download/v1.11.1/ninja-linux.zip
unzip ninja-linux.zip
sudo mv ninja /usr/local/bin
sudo chmod +x /usr/local/bin/ninja
```

### Verification of Installation

```bash
ninja --version
```

---

## ⚙️ Using Ninja with CMake

To use Ninja with CMake, specify the `-G Ninja` option or configure it in VS Code settings or CMake Preset.

### Command Line Example

```bash
cmake -S . -B build -G Ninja
cmake --build build
```

### Example settings.json (VS Code)

```json
{
  "cmake.generator": "Ninja"
}
```

---

## ✅ Summary

| Item          | Description                                      |
|---------------|-------------------------------------------|
| Target        | Ninja (Lightweight Build System)                  |
| Supported OS  | Windows, macOS, Ubuntu/Linux              |
| Installation Method | Package manager or manual installation               |
| Verification Method | `ninja --version`                         |
| CMake Integration | `-G Ninja` or configure in settings.json    |
