# 🖥️ Visual Studio Code 설치 및 설정 가이드 (Clangd + CMake Tools 기반)

이 문서는 Modern C++ 개발을 위해 Visual Studio Code(이하 VS Code)를 설치하고, Clang 및 clangd 기반의 개발 환경을 구성하는 방법을 안내합니다. 특히 launch.json 없이 CMake Tools와 CodeLLDB를 활용한 자동 디버깅 환경 구성에 중점을 둡니다.

---

## 1. VS Code 설치

### Windows

- [VS Code 공식 다운로드](https://code.visualstudio.com/)에서 `.exe` 설치 파일 다운로드
- 설치 시 다음 옵션 선택:
  - ✅ Add to PATH
  - ✅ Register Code as editor
  - ✅ Add "Open with Code" to Explorer

### macOS

```bash
brew install --cask visual-studio-code
```

또는 공식 사이트에서 `.zip` 파일 다운로드 후 `/Applications`로 이동

### Ubuntu/Linux

```bash
sudo snap install --classic code
```

또는 `.deb` 수동 설치:

```bash
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O vscode.deb
sudo apt install ./vscode.deb
```

---

## 2. 필수 확장 프로그램 설치

### 방법 1: VS Code 내 확장 탭에서 검색 후 설치

- ✅ `clangd` (LLVM Language Server)
- ✅ `CMake Tools` (Microsoft)
- ✅ `CodeLLDB` (Vadim Chugunov)

### 방법 2: 명령줄에서 설치

```bash
code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension ms-vscode.cmake-tools
code --install-extension vadimcn.vscode-lldb
```

> 💡 선택 확장: `CMake Language Support`, `GitHub Pull Requests and Issues`

---

## 3. VS Code 설정 (settings.json)

### 3.1 Clangd 설정

```json
{
  "clangd.path": "/usr/bin/clangd",
  "clangd.arguments": [
    "--header-insertion=never",
    "--clang-tidy"
  ],
  "C_Cpp.intelliSenseEngine": "Disabled",
  "clangd.detectExtensionConflicts": false
}
```

> 🔧 `clangd.path`는 OS에 따라 다릅니다. 예: macOS는 `/opt/homebrew/opt/llvm/bin/clangd`

### 3.2 CMake Tools 설정

```json
{
  "cmake.configureOnOpen": true,
  "cmake.buildDirectory": "${workspaceFolder}/build",
  "cmake.generator": "Ninja",
  "cmake.debugConfig": {
    "type": "lldb",
    "request": "launch",
    "stopOnEntry": false,
    "runInTerminal": true
  },
  "cmake.configureSettings": {
    "CMAKE_EXPORT_COMPILE_COMMANDS": "ON"
  }
}
```

### 3.3 편집기 설정 (폰트 및 포맷팅)

```json
{
  "editor.fontFamily": "Fira Code, JetBrains Mono, monospace",
  "editor.fontLigatures": true,
  "editor.tabSize": 4,
  "editor.formatOnSave": true
}
```

---

## 4. 프로젝트 빌드 및 디버깅 절차

### 4.1 프로젝트 열기

- VS Code에서 CMakeLists.txt가 포함된 프로젝트 폴더 열기

### 4.2 빌드 및 디버깅

1. Command Palette (Ctrl+Shift+P 또는 ⌘+Shift+P) 열기
2. `CMake: Configure` 실행 → 툴체인 선택
3. `CMake: Build` 실행
4. `CMake: Debug` 실행 → launch.json 없이 LLDB 자동 실행

> ✅ launch.json 없이 디버깅 가능!

---

## 5. 디버깅 확인 팁

- 빌드 모드는 Debug로 설정해야 함 (`CMAKE_BUILD_TYPE=Debug`)
- 실행 파일에 디버깅 심볼 포함 여부 확인:

```bash
file build/hello_world
```

---

## 6. clangd가 작동하지 않을 때

- compile_commands.json이 누락되었을 수 있음
- CMake 설정에서 다음 옵션이 활성화되어야 함:

```bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
```

또는 settings.json에 다음 설정 추가:

```json
"cmake.configureSettings": {
  "CMAKE_EXPORT_COMPILE_COMMANDS": "ON"
}
```

---

## ✅ 요약

| 항목           | 설명                                        |
|----------------|---------------------------------------------|
| IDE            | Visual Studio Code                          |
| 주요 확장      | clangd, CMake Tools, CodeLLDB               |
| 언어 서버      | clangd (Clang 기반)                         |
| 디버깅 방식    | LLDB 자동 연동 (launch.json 불필요)         |
| 빌드 시스템    | CMake (Ninja 권장)                          |
| 폰트 설정      | Fira Code, Ligature 활성화 추천             |
