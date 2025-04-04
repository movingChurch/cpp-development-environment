# 🛠️ Visual Studio Code Installation and User Configuration Guide (For Modern C++ Development)

This document provides guidance on installing Visual Studio Code (VS Code) and configuring it for user-level settings, specifically for Modern C++ development. It focuses on building an efficient development environment using Clangd-based language support, CMake Tools, and CodeLLDB extensions.

---

## 1. Installing VS Code

### ✅ Windows

1. Download the Windows installer (.exe) from the [VS Code official download page](https://code.visualstudio.com/)
2. Ensure the following options are selected during installation:
   - ✅ Add to PATH
   - ✅ Register Code as editor
   - ✅ Add "Open with Code" to Explorer context menu

### ✅ macOS

```bash
brew install --cask visual-studio-code
```

Or download the `.zip` file from the [official site](https://code.visualstudio.com/) and move it to the `/Applications` folder

### ✅ Ubuntu / Linux

```bash
sudo snap install --classic code
```

Or manually install the `.deb` package:

```bash
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O vscode.deb
sudo apt install ./vscode.deb
```

---

## 2. Installing Essential Extensions

### Method A: Install from the Extensions Tab in VS Code

- 🔍 `clangd` (by LLVM)
- 🔍 `CMake Tools` (by Microsoft)
- 🔍 `CodeLLDB` (by Vadim Chugunov)

### Method B: Install from the Command Line

```bash
code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension ms-vscode.cmake-tools
code --install-extension vadimcn.vscode-lldb
```

> 💡 Recommended Optional Extensions:
>
> - `CMake Language Support`
> - `GitHub Pull Requests and Issues`

---

## 3. User Settings (user-level settings.json)

> ⚙️ User settings in VS Code are configured via the `settings.json` file. The following settings are based on global settings (User Settings) and can be accessed via `Ctrl + Shift + P` → `Preferences: Open Settings (JSON)`.

### 3.1 Clangd Related Settings

```json
{
  "C_Cpp.intelliSenseEngine": "disabled",
  "clangd.detectExtensionConflicts": false,
  "clangd.arguments": [
    "--header-insertion=never",
    "--completion-style=detailed"
  ]
}
```

> ✅ Disable IntelliSense in the MS C/C++ extension to prevent conflicts with clangd
> ✅ Configure clangd arguments to improve auto-completion and header handling

---

### 3.2 Editor and Font Settings

```json
{
  "editor.fontFamily": "Fira Code, JetBrains Mono, monospace",
  "editor.fontLigatures": true,
  "editor.tabSize": 4,
  "editor.formatOnSave": true,
  "files.autoSave": "onFocusChange"
}
```

> ✅ Use developer-friendly fonts for better readability
> ✅ Enable auto-formatting on save and auto-save settings

---

### 3.3 CMake Tools Related Settings

```json
{
  "cmake.generator": "Ninja",
  "cmake.configureSettings": {
    "CMAKE_EXPORT_COMPILE_COMMANDS": "ON"
  },
  "cmake.buildDirectory": "${workspaceFolder}/build",
  "cmake.sourceDirectory": "${workspaceFolder}"
}
```

> ✅ Auto-generate compile_commands.json for clangd integration
> ✅ Recommend using Ninja build system (faster)
> ✅ Specify build/source directories

---

## ✅ Summary: Key Installation and Configuration Points

| Item             | Summary                                                                 |
|------------------|------------------------------------------------------------------------|
| IDE              | Visual Studio Code                                                      |
| Essential Extensions | clangd, CMake Tools, CodeLLDB                                         |
| Language Server  | clangd (MS C++ IntelliSense disabled)                                   |
| Build System     | CMake + Ninja (auto-generate compile_commands.json)                     |
| Debugging        | Use CodeLLDB, supports automatic debugging without launch.json          |
| User Settings Location | `Ctrl + Shift + P` → `Preferences: Open Settings (JSON)`                  |
| Key Settings Items   | Fonts, formatting, clangd arguments, CMake settings, etc.                                 |

---
> 📁 Note: The `settings.json` file within the `.vscode/` folder is for workspace-specific settings. This document is based on Global (User) settings.
