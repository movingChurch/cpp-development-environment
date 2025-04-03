# 🛠️ Visual Studio Code 설치 및 사용자 설정 가이드 (Modern C++ 개발용)

이 문서는 Modern C++ 개발을 위한 Visual Studio Code(이하 VS Code) 설치 및 사용자 설정(user-level configuration)을 안내합니다. 특히 Clangd 기반 언어 지원과 CMake Tools, CodeLLDB 확장을 활용한 효율적인 개발 환경을 구축하는 데 중점을 둡니다.

---

## 1. VS Code 설치

### ✅ Windows

1. [VS Code 공식 다운로드 페이지](https://code.visualstudio.com/)에서 Windows용 설치 파일(.exe) 다운로드
2. 설치 중 다음 옵션을 반드시 선택:
   - ✅ Add to PATH
   - ✅ Register Code as editor
   - ✅ Add "Open with Code" to Explorer context menu

### ✅ macOS

```bash
brew install --cask visual-studio-code
```

또는 [공식 사이트](https://code.visualstudio.com/)에서 `.zip` 파일을 다운로드하고 `/Applications` 폴더로 이동

### ✅ Ubuntu / Linux

```bash
sudo snap install --classic code
```

또는 `.deb` 패키지 수동 설치:

```bash
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O vscode.deb
sudo apt install ./vscode.deb
```

---

## 2. 필수 확장 프로그램 설치

### 방법 A: VS Code 내 확장 탭에서 설치

- 🔍 `clangd` (by LLVM)
- 🔍 `CMake Tools` (by Microsoft)
- 🔍 `CodeLLDB` (by Vadim Chugunov)

### 방법 B: 명령줄에서 설치

```bash
code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension ms-vscode.cmake-tools
code --install-extension vadimcn.vscode-lldb
```

> 💡 선택 확장 (권장):
>
> - `CMake Language Support`
> - `GitHub Pull Requests and Issues`

---

## 3. 사용자 설정(user settings: user-level settings.json)

> ⚙️ VS Code의 사용자 설정은 `settings.json` 파일을 통해 구성됩니다. 아래 설정은 전역 설정(User Settings) 기준이며, `Ctrl + Shift + P` → `Preferences: Open Settings (JSON)` 명령으로 열 수 있습니다.

### 3.1 Clangd 관련 설정

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

> ✅ MS C/C++ 확장의 IntelliSense 비활성화로 clangd와 충돌 방지
> ✅ clangd 인자 설정으로 자동 완성 및 헤더 처리 개선

---

### 3.2 에디터 및 폰트 설정

```json
{
  "editor.fontFamily": "Fira Code, JetBrains Mono, monospace",
  "editor.fontLigatures": true,
  "editor.tabSize": 4,
  "editor.formatOnSave": true,
  "files.autoSave": "onFocusChange"
}
```

> ✅ 가독성이 좋은 개발용 폰트 사용
> ✅ 저장 시 자동 포맷팅 및 자동 저장 설정

---

### 3.3 CMake Tools 관련 설정

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

> ✅ compile_commands.json 자동 생성으로 clangd 연동 가능
> ✅ Ninja 빌드 시스템 권장 (속도 빠름)
> ✅ 빌드/소스 디렉토리 명시

---

## ✅ 요약: 설치 및 설정 핵심 정리

| 항목             | 설정 요약                                                                 |
|------------------|----------------------------------------------------------------------------|
| IDE              | Visual Studio Code                                                         |
| 필수 확장        | clangd, CMake Tools, CodeLLDB                                              |
| 언어 서버        | clangd (MS C++ IntelliSense는 비활성화)                                   |
| 빌드 시스템      | CMake + Ninja (compile_commands.json 자동 생성)                           |
| 디버깅           | CodeLLDB 사용, launch.json 없이 자동 디버깅 지원                          |
| 사용자 설정 위치 | `Ctrl + Shift + P` → `Preferences: Open Settings (JSON)`                  |
| 주요 설정 항목   | 폰트, 포맷팅, clangd 인자, CMake 설정 등                                 |

---
> 📁 참고: `.vscode/` 폴더 내 `settings.json`은 워크스페이스 전용 설정입니다. 본 문서는 Global(User) 설정 기준입니다.
