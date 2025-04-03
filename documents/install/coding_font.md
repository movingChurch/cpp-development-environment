# ✍️ 코딩 폰트 설치 및 설정 가이드

코딩 폰트는 개발자의 생산성과 가독성에 직접적인 영향을 미칩니다.
이 문서에서는 Modern C++ 개발에 적합한 코딩 폰트를 선택하고, 운영체제별 설치 방법 및 VS Code에서의 설정 방법을 안내합니다.

---

## 1. 코딩 폰트 선택 기준

| 기준 | 설명 |
|------|------|
| 가독성 | 글자 간격, 크기, 줄 간격 등이 눈에 잘 들어와야 함 |
| Ligature 지원 | `=>`, `==`, `!=` 등 기호 조합을 시각적으로 개선 |
| 한글 지원 여부 | 한글/영문 혼용 시 균형 잡힌 출력 |
| 라이선스 | 오픈소스 여부 (상업적 사용 가능 여부 포함) |

---

## 2. 추천 코딩 폰트

| 폰트 이름 | 특징 |
|-----------|------|
| Fira Code | Ligature 지원, 오픈소스, 널리 사용됨 |
| JetBrains Mono | JetBrains IDE 최적화, 가독성 우수 |
| Source Code Pro | Adobe 제작, 깔끔한 디자인 |
| Cascadia Code | Microsoft 제작, Windows Terminal 기본 폰트 |

> 💡 이 가이드에서는 Fira Code를 기준으로 설치 및 설정을 설명합니다.

---

## 3. Fira Code 설치 방법

### 3.1 Windows

#### 방법 1: 수동 설치

1. [Fira Code GitHub Releases](https://github.com/tonsky/FiraCode/releases)에서 `.zip` 파일 다운로드
2. 압축 해제 후 `.ttf` 파일을 모두 선택
3. 마우스 우클릭 → "설치" 또는 "모든 사용자에게 설치"

#### 방법 2: Windows Package Manager 사용

```powershell
winget install --id=FiraCode.FiraCode -e
```

---

### 3.2 macOS

#### 방법 1: Homebrew 사용 (권장)

```bash
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
```

#### 방법 2: 수동 설치

1. GitHub에서 `.zip` 파일 다운로드 및 압축 해제
2. `.ttf` 파일을 더블 클릭하여 Font Book에서 설치

---

### 3.3 Linux (Ubuntu 예시)

#### 방법 1: apt 패키지 사용

```bash
sudo apt update
sudo apt install fonts-firacode
```

#### 방법 2: 수동 설치

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
unzip Fira_Code_v6.2.zip
fc-cache -f -v
```

---

## 4. 설치 확인

### Windows/macOS

- 제어판 > 글꼴 또는 Font Book 앱에서 "Fira Code" 확인

### Linux

```bash
fc-list | grep "Fira Code"
```

---

## 5. VS Code에서 폰트 설정

### 5.1 settings.json 설정 예시

```json
{
  "editor.fontFamily": "Fira Code, JetBrains Mono, monospace",
  "editor.fontLigatures": true,
  "editor.fontSize": 14,
  "editor.lineHeight": 22
}
```

### 5.2 설정 방법

1. VS Code → Preferences → Settings (`Ctrl + ,` 또는 `Cmd + ,`)
2. 검색창에 `font` 입력
3. `"Font Family"`에 `Fira Code` 입력
4. `"Font Ligatures"` 항목 체크 또는 `true` 값 설정

---

## 6. 기타 추천 폰트 설치

### JetBrains Mono (macOS 예시)

```bash
brew install --cask font-jetbrains-mono
```

### Source Code Pro (Ubuntu 예시)

```bash
sudo apt install fonts-source-code-pro
```

---

## ✅ 요약

| 항목 | 설명 |
|------|------|
| 추천 폰트 | Fira Code, JetBrains Mono, Source Code Pro |
| 핵심 기능 | Ligature, 가독성, 한글 지원 |
| 설치 방법 | 운영체제별 패키지 매니저 또는 수동 설치 |
| VS Code 설정 | `"fontFamily"` 및 `"fontLigatures"` 설정 필요 |
