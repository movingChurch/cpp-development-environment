# 🧭 GitHub CLI Installation and Setup Guide

GitHub CLI (`gh`) is an official command-line tool provided by GitHub, allowing you to manage repositories, create issues, submit PRs, and more directly from the terminal. This document provides installation methods and basic usage instructions for GitHub CLI.

---

## 1. Installing GitHub CLI

### 1.1 Installation by Operating System

#### 🐧 Linux (Ubuntu Example)

```bash
type -p curl >/dev/null || sudo apt install curl -y

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
  | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg

sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] \
https://cli.github.com/packages stable main" | \
sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update
sudo apt install gh
```

#### 🍎 macOS (Using Homebrew)

```bash
brew install gh
```

#### 🪟 Windows

##### Method 1: Using Winget

```powershell
winget install GitHub.cli
```

##### Method 2: Manual Installation

- Download and run the `.msi` installer from the [GitHub CLI Releases](https://github.com/cli/cli/releases) page

---

## 2. Verification of Installation

After installation, verify the version with the following command:

```bash
gh --version
```

Example output:

```bash
gh version 2.39.1 (2024-01-10)
https://github.com/cli/cli/releases/latest
```

---

## 3. Logging into GitHub Account

```bash
gh auth login
```

### Choosing Login Method

- Select GitHub.com or GitHub Enterprise
- Choose authentication method: HTTPS or SSH
- Options to log in via web browser or enter a token

> 💡 It's convenient to authenticate using SSH if you have pre-generated and registered SSH keys. Refer to the [git.md](./git.md) document for SSH key generation.

---

## 4. Summary of Key Commands

| Command | Description |
|--------|------|
| `gh auth login` | Log into GitHub account |
| `gh repo clone <user>/<repo>` | Clone a repository |
| `gh repo create` | Create a new repository |
| `gh pr create` | Create a Pull Request |
| `gh pr checkout <number>` | Switch to a PR branch |
| `gh issue create` | Create an issue |
| `gh issue list` | List issues |
| `gh gist create` | Create a Gist |

---

## 5. Setting Up Autocompletion (Optional)

### Bash

```bash
gh completion -s bash > ~/.gh-completion.bash
echo "source ~/.gh-completion.bash" >> ~/.bashrc
source ~/.bashrc
```

### Zsh

```bash
gh completion -s zsh > ~/.gh-completion.zsh
echo "source ~/.gh-completion.zsh" >> ~/.zshrc
source ~/.zshrc
```

---

## 6. Integration with VS Code (Optional)

- Use GitHub CLI in VS Code for PR, issue, and commit browsing.
- Recommended to install the GitHub Pull Requests and Issues extension:
  <https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github>

---

## ✅ Summary

| Item | Description |
|------|------|
| Target | GitHub CLI (`gh`) |
| Supported OS | Windows, macOS, Ubuntu/Linux |
| Authentication Method | HTTPS or SSH |
| Key Features | Repo management, PR creation, issue registration, gist creation, etc. |
| Recommended Integration | VS Code, SSH key authentication |
