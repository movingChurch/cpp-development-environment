# ✍️ Coding Font Installation and Setup Guide

Coding fonts directly impact a developer's productivity and readability. This document guides you in selecting a suitable coding font for Modern C++ development, and provides installation methods for different operating systems and setup instructions for VS Code.

---

## 1. Criteria for Selecting a Coding Font

| Criteria | Description |
|------|------|
| Readability | Should have clear spacing, size, and line spacing |
| Ligature Support | Visually improves symbol combinations like `=>`, `==`, `!=` |
| Korean Support | Balanced output when mixing Korean/English |
| License | Open source (including commercial use) |

---

## 2. Recommended Coding Fonts

| Font Name | Features |
|-----------|------|
| Fira Code | Supports ligatures, open source, widely used |
| JetBrains Mono | Optimized for JetBrains IDE, excellent readability |
| Source Code Pro | Created by Adobe, clean design |
| Cascadia Code | Created by Microsoft, default font for Windows Terminal |

> 💡 This guide uses Fira Code as the basis for installation and setup.

---

## 3. Fira Code Installation Methods

### 3.1 Windows

#### Method 1: Manual Installation

1. Download the `.zip` file from [Fira Code GitHub Releases](https://github.com/tonsky/FiraCode/releases)
2. Extract and select all `.ttf` files
3. Right-click → "Install" or "Install for all users"

#### Method 2: Using Windows Package Manager

```powershell
winget install --id=FiraCode.FiraCode -e
```

---

### 3.2 macOS

#### Method 1: Using Homebrew (Recommended)

```bash
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
```

#### Method 2: Manual Installation

1. Download and extract the `.zip` file from GitHub
2. Double-click `.ttf` files to install via Font Book

---

### 3.3 Linux (Ubuntu Example)

#### Method 1: Using apt Package

```bash
sudo apt update
sudo apt install fonts-firacode
```

#### Method 2: Manual Installation

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
unzip Fira_Code_v6.2.zip
fc-cache -f -v
```

---

## 4. Verification of Installation

### Windows/macOS

- Check "Fira Code" in Control Panel > Fonts or Font Book app

### Linux

```bash
fc-list | grep "Fira Code"
```

---

## 5. Font Setup in VS Code

### 5.1 Example settings.json Configuration

```json
{
  "editor.fontFamily": "Fira Code, JetBrains Mono, monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 14,
  "editor.lineHeight": 22
}
```

### 5.2 Setup Instructions

1. VS Code → Preferences → Settings (`Ctrl + ,` or `Cmd + ,`)
2. Enter `font` in the search box
3. Enter `Fira Code` in "Font Family"
4. Check or set `true` for "Font Ligatures"

---

## 6. Installation of Other Recommended Fonts

### JetBrains Mono (macOS Example)

```bash
brew install --cask font-jetbrains-mono
```

### Source Code Pro (Ubuntu Example)

```bash
sudo apt install fonts-source-code-pro
```

---

## ✅ Summary

| Item | Description |
|------|------|
| Recommended Fonts | Fira Code, JetBrains Mono, Source Code Pro |
| Key Features | Ligature, readability, Korean support |
| Installation Method | Package manager or manual installation by OS |
| VS Code Setup | Requires setting "fontFamily" and "fontLigatures" |
