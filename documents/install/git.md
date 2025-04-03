# 🔧 Git 설치 및 설정 가이드

Git은 오픈소스 분산 버전 관리 시스템으로, 코드 변경 이력을 추적하고 협업을 위한 필수 도구입니다.
이 문서는 Git을 설치하고, 사용자 정보를 설정하며, GitHub와의 연결을 위한 SSH 키 등록까지의 과정을 안내합니다.

---

## 1. Git 설치

### 1.1 운영체제별 설치

#### 🐧 Linux (Ubuntu 예시)

```bash
sudo apt-get update
sudo apt-get install -y git
```

#### 🍎 macOS (Homebrew 사용)

```bash
brew install git
```

또는 Xcode 명령줄 도구를 통해 설치:

```bash
xcode-select --install
```

#### 🪟 Windows

1. [Git 공식 다운로드 페이지](https://git-scm.com/downloads)에서 `.exe` 설치 파일 다운로드
2. 설치 중 다음 옵션 선택 권장:
   - "Git Bash Here"
   - "Git GUI Here"
   - "Checkout as-is, commit Unix-style line endings"

---

## 2. 설치 확인

설치 후 터미널에서 다음 명령어 실행:

```bash
git --version
```

출력 예시:

```bash
git version 2.42.0
```

---

## 3. 사용자 정보 설정

Git 커밋 기록에 표시될 사용자 이름과 이메일 주소를 설정합니다.

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

설정 확인:

```bash
git config --global --list
```

---

## 4. SSH 키 생성 및 GitHub 등록

### 4.1 SSH 키 생성

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

- 기본 경로 (`~/.ssh/id_ed25519`)에 저장
- 프롬프트에 따라 `Enter`, `Enter`, `Enter` 입력

### 4.2 SSH 에이전트 실행 및 키 등록

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

### 4.3 공개 키 확인 및 복사

```bash
cat ~/.ssh/id_ed25519.pub
```

- 출력된 키를 복사한 뒤 GitHub에 등록

### 4.4 GitHub에 SSH 키 등록

1. GitHub 접속 → 우측 상단 프로필 → Settings
2. 좌측 메뉴에서 **SSH and GPG keys** 선택
3. **New SSH key** 클릭 후 제목과 키 내용 입력 → 저장

---

## 5. Git 기본 명령어 요약

| 명령어 | 설명 |
|--------|------|
| `git init` | 새 Git 저장소 초기화 |
| `git clone <URL>` | 원격 저장소 복제 |
| `git status` | 현재 변경 사항 확인 |
| `git add <file>` | 변경 파일 스테이징 |
| `git commit -m "메시지"` | 커밋 생성 |
| `git push` | 원격 저장소에 업로드 |
| `git pull` | 원격 저장소에서 최신 변경 사항 가져오기 |

---

## 6. Git 설정 파일 위치

- 전역 설정: `~/.gitconfig`
- 개별 프로젝트 설정: `<repo>/.git/config`

---

## 7. 유용한 설정 옵션 (선택 사항)

```bash
# 기본 편집기 설정 (예: VS Code)
git config --global core.editor "code --wait"

# 컬러 출력 활성화
git config --global color.ui auto

# 기본 브랜치 이름을 main으로 설정
git config --global init.defaultBranch main
```

---

## 8. Git GUI 도구 (선택 사항)

| 도구 | 설명 |
|------|------|
| GitHub Desktop | GitHub 공식 GUI 클라이언트 |
| Sourcetree | Atlassian 제공, Git 및 Mercurial 지원 |
| GitKraken | 강력한 시각화 기능 제공 |

---

## ✅ 요약

| 항목 | 설명 |
|------|------|
| 설치 대상 | Git (버전 관리 도구) |
| 지원 OS | Windows, macOS, Ubuntu/Linux |
| 필수 설정 | 사용자 이름, 이메일, SSH 키 등록 |
| 주요 명령어 | init, clone, add, commit, push, pull 등 |
| GitHub 연동 | SSH 키 등록으로 비밀번호 없이 인증 가능 |
