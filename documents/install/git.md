# 🔧 Git Installation and Setup Guide

Git is an open-source distributed version control system essential for tracking code changes and collaboration. This document guides you through installing Git, setting up user information, and registering SSH keys for GitHub integration.

---

## 1. Installing Git

### 1.1 Installation by Operating System

#### 🐧 Linux (Ubuntu Example)

```bash
sudo apt-get update
sudo apt-get install -y git
```

#### 🍎 macOS (Using Homebrew)

```bash
brew install git
```

Or install via Xcode command line tools:

```bash
xcode-select --install
```

#### 🪟 Windows

1. Download the `.exe` installer from the [Git official download page](https://git-scm.com/downloads)
2. Recommended options during installation:
   - "Git Bash Here"
   - "Git GUI Here"
   - "Checkout as-is, commit Unix-style line endings"

---

## 2. Verification of Installation

After installation, run the following command in the terminal:

```bash
git --version
```

Example output:

```bash
git version 2.42.0
```

---

## 3. Setting User Information

Set the user name and email address that will appear in Git commit records.

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

Verify settings:

```bash
git config --global --list
```

---

## 4. Generating and Registering SSH Keys with GitHub

### 4.1 Generating SSH Keys

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

- Save to the default path (`~/.ssh/id_ed25519`)
- Press `Enter`, `Enter`, `Enter` at the prompts

### 4.2 Running SSH Agent and Adding Key

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

### 4.3 Viewing and Copying the Public Key

```bash
cat ~/.ssh/id_ed25519.pub
```

- Copy the output key and register it on GitHub

### 4.4 Registering SSH Key on GitHub

1. Go to GitHub → Profile in the top right → Settings
2. Select **SSH and GPG keys** from the left menu
3. Click **New SSH key**, enter a title and paste the key content → Save

---

## 5. Summary of Basic Git Commands

| Command | Description |
|--------|------|
| `git init` | Initialize a new Git repository |
| `git clone <URL>` | Clone a remote repository |
| `git status` | Check current changes |
| `git add <file>` | Stage changed files |
| `git commit -m "message"` | Create a commit |
| `git push` | Upload to a remote repository |
| `git pull` | Fetch latest changes from a remote repository |

---

## 6. Location of Git Configuration Files

- Global configuration: `~/.gitconfig`
- Per-project configuration: `<repo>/.git/config`

---

## 7. Useful Configuration Options (Optional)

```bash
# Set default editor (e.g., VS Code)
git config --global core.editor "code --wait"

# Enable color output
git config --global color.ui auto

# Set default branch name to main
git config --global init.defaultBranch main
```

---

## 8. Git GUI Tools (Optional)

| Tool | Description |
|------|------|
| GitHub Desktop | Official GitHub GUI client |
| Sourcetree | Provided by Atlassian, supports Git and Mercurial |
| GitKraken | Offers powerful visualization features |

---

## ✅ Summary

| Item | Description |
|------|------|
| Target | Git (Version Control Tool) |
| Supported OS | Windows, macOS, Ubuntu/Linux |
| Essential Settings | User name, email, SSH key registration |
| Key Commands | init, clone, add, commit, push, pull, etc. |
| GitHub Integration | Passwordless authentication via SSH key registration |
