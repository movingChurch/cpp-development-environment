# 🧰 Modern C++ Development Environment Setup Guide

[clang]: documents/install/clang.md
[cmake]: documents/install/cmake.md
[ninja]: documents/install/ninja.md
[vscode]: documents/install/vscode.md
[git]: documents/install/git.md
[github-cli]: documents/install/github_cli.md
[coding-font]: documents/install/coding_font.md
[sample-project]: documents/install/sample_project.md

This document introduces the main tools required for Modern C++ development and provides installation and configuration procedures for each tool. All tools can be installed independently, and you can choose to configure only the necessary items.

> 💡 This guide is based on an automated debugging environment using the LLDB debugger and CMake Tools.

---

## 🛠 Recommended Installation Order

1. Install [Clang][clang]
2. Install [CMake][cmake]
3. Install [Ninja][ninja] (for CMake build optimization)
4. Install and configure [Coding Font][coding-font]
5. Install and set up [Visual Studio Code][vscode]
6. Install and integrate [Git][git] with GitHub
7. Install [GitHub CLI][github-cli] (optional)
8. Build and test the [Sample Project][sample-project]

---

## 💡 Development Environment Setup Checklist

- [ ] Clang supporting C++20 or higher is installed
- [ ] CMake ≥ 3.16 is installed
- [ ] Ninja is installed and `ninja --version` is verified
- [ ] VS Code is installed and extensions are applied (clangd, CMake Tools, CodeLLDB)
- [ ] Git and GitHub login is completed
- [ ] Development font like Fira Code is set up
- [ ] LLDB debugger is installed and integrated with VS Code
- [ ] Sample project build and debugging test is completed

---

## 📁 Document Structure

Each item is composed of a separate document, which can be individually checked as needed.

- [clang.md][clang]: Clang Installation Guide
- [cmake.md][cmake]: CMake Installation Guide
- [ninja.md][ninja]: Ninja Installation Guide
- [vscode.md][vscode]: VS Code Setup and Extensions
- [git.md][git]: Git Installation and Initial Setup
- [github-cli.md][github-cli]: GitHub CLI Installation and Authentication
- [coding-font.md][coding-font]: Fira Code Installation and Application
- [sample-project.md][sample-project]: CMake-based Sample Project Build and Debugging

---

## 🧭 Operating System Support

| OS            | Supported | Remarks                                    |
|---------------|-----------|--------------------------------------------|
| Windows       | ✅        | Requires WSL or LLVM toolchain             |
| macOS         | ✅        | Uses LLDB included in Xcode CLI tools      |
| Ubuntu/Linux  | ✅        | Installable via apt                        |

---

## ⚙️ Scripted Automatic Installation Usage

To automatically install the Modern C++ development environment, enter the following command in the terminal:

```bash
git clone https://github.com/your-org/cpp-development-environment.git
cd cpp-development-environment/scripts/cpp_development_environment
bash setup.sh
```

> 📦 Supported Operating Systems: macOS, Ubuntu/Linux
> ⚠️ Windows users are recommended to run in a WSL environment.

Once the installation is complete, the following will be automatically configured:

- Installation of Clang, clangd, CMake, Ninja, Git, GitHub CLI, VS Code
- Installation of essential VS Code extensions (clangd, CMake Tools, CodeLLDB)
- Creation and build of a sample C++ project (`$HOME/cpp-sample`)
- Generation of a debuggable executable and test execution

To open and debug the sample project:

```bash
code $HOME/cpp-sample
```

In VS Code, executing the `CMake: Debug` command will start LLDB debugging.

---

## 📌 Note

- This document is based on Windows (including WSL), macOS, and Ubuntu.
- There may be differences in commands depending on the operating system, so check the OS-specific procedures in each document.
- Clang and LLDB are part of the LLVM project and are well-supported for the latest C++ standards.
- Ninja is a recommended tool that significantly speeds up CMake builds.
