# 🧭 GitHub CLI 설치 및 설정 가이드

GitHub CLI(`gh`)는 GitHub에서 제공하는 공식 명령줄 도구로, 터미널에서 직접 리포지토리 관리, 이슈 생성, PR 제출 등을 수행할 수 있습니다.
이 문서는 GitHub CLI의 설치 방법과 기본적인 사용법을 안내합니다.

---

## 1. GitHub CLI 설치

### 1.1 운영체제별 설치

#### 🐧 Linux (Ubuntu 예시)

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

#### 🍎 macOS (Homebrew 사용)

```bash
brew install gh
```

#### 🪟 Windows

##### 방법 1: Winget 사용

```powershell
winget install GitHub.cli
```

##### 방법 2: 수동 설치

- [GitHub CLI Releases](https://github.com/cli/cli/releases) 페이지에서 `.msi` 설치 파일 다운로드 후 실행

---

## 2. 설치 확인

설치가 완료되면 다음 명령어로 버전을 확인합니다:

```bash
gh --version
```

출력 예시:

```bash
gh version 2.39.1 (2024-01-10)
https://github.com/cli/cli/releases/latest
```

---

## 3. GitHub 계정 로그인

```bash
gh auth login
```

### 로그인 방식 선택

- GitHub.com or GitHub Enterprise 선택
- 인증 방식 선택: HTTPS 또는 SSH
- 웹 브라우저를 통해 로그인하거나 토큰 입력 방식 제공

> 💡 SSH 키를 미리 생성하고 등록해두면 SSH 방식으로 인증하는 것이 편리합니다.
> SSH 키 생성 방법은 [git.md](./git.md) 문서를 참고하세요.

---

## 4. 주요 명령어 정리

| 명령어 | 설명 |
|--------|------|
| `gh auth login` | GitHub 계정 로그인 |
| `gh repo clone <user>/<repo>` | 리포지토리 클론 |
| `gh repo create` | 새 리포지토리 생성 |
| `gh pr create` | Pull Request 생성 |
| `gh pr checkout <number>` | PR 브랜치로 전환 |
| `gh issue create` | 이슈 생성 |
| `gh issue list` | 이슈 목록 조회 |
| `gh gist create` | Gist 생성 |

---

## 5. 자동완성 설정 (선택 사항)

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

## 6. VS Code와 연동 (선택 사항)

- VS Code에서 GitHub CLI를 활용한 PR, 이슈, 커밋 브라우징 기능을 사용할 수 있습니다.
- GitHub Pull Requests and Issues 확장 설치 권장:
  <https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github>

---

## ✅ 요약

| 항목 | 설명 |
|------|------|
| 설치 대상 | GitHub CLI (`gh`) |
| 지원 OS | Windows, macOS, Ubuntu/Linux |
| 인증 방식 | HTTPS 또는 SSH |
| 주요 기능 | repo 관리, PR 생성, 이슈 등록, gist 작성 등 |
| 권장 연동 | VS Code, SSH 키 인증 |
