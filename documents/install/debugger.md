# 🐞 LLDB 디버깅 가이드 (CMake Tools + clangd + CodeLLDB)

이 문서는 Modern C++ 개발환경에서 LLDB 디버거를 설정하고 사용하는 방법을 안내합니다. 특히, launch.json 없이 CMake Tools 확장을 활용하여 자동으로 디버깅을 구성하는 방식에 중점을 둡니다.

---

## 1. 사용 도구 요약

| 도구           | 설명                                 |
|----------------|--------------------------------------|
| Clang          | 최신 C++ 컴파일러                    |
| clangd         | Clang 기반 Language Server           |
| CMake Tools    | 빌드 및 디버깅 자동화 확장           |
| CodeLLDB       | VS Code용 LLDB 디버거 확장           |

---

## 2. 사전 준비

### 2.1 필수 도구 설치

Ubuntu 기준 예시:

```bash
sudo apt update
sudo apt install clang clangd cmake lldb
```

### 2.2 VS Code 확장 설치

```bash
code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension ms-vscode.cmake-tools
code --install-extension vadimcn.vscode-lldb
```

---

## 3. 자동 디버깅 설정 (settings.json)

VS Code의 settings.json에 다음 설정을 추가합니다:

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
  "clangd.path": "/usr/bin/clangd",
  "clangd.arguments": [
    "--header-insertion=never",
    "--clang-tidy"
  ],
  "C_Cpp.intelliSenseEngine": "Disabled",
  "clangd.detectExtensionConflicts": false
}
```

> 💡 clangd 경로는 macOS에서는 `/opt/homebrew/opt/llvm/bin/clangd`일 수 있습니다.

---

## 4. 디버깅을 위한 CMake 설정

### CMakeLists.txt 예시

```cmake
cmake_minimum_required(VERSION 3.20)
project(HelloWorld LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Debug)  # 디버깅 심볼 포함

add_executable(hello_world src/main.cpp)
```

> ⚠️ 반드시 `CMAKE_BUILD_TYPE`을 `Debug`로 설정해야 디버깅 심볼이 포함됩니다.

---

## 5. 디버깅 절차

### 5.1 프로젝트 열기

- VS Code에서 CMake 프로젝트 폴더 열기 (`CMakeLists.txt` 포함)

### 5.2 빌드 및 디버깅 실행

1. Command Palette 열기 (Ctrl+Shift+P 또는 ⌘+Shift+P)
2. `CMake: Configure` 실행 → 툴체인 선택
3. `CMake: Build` 실행
4. `CMake: Debug` 실행 → LLDB로 자동 디버깅 시작

> ✅ launch.json 없이도 디버깅이 가능합니다!

---

## 6. 디버깅 확인 팁

### 6.1 디버깅 심볼 포함 여부 확인

```bash
file build/hello_world
```

출력 예시:

```bash
build/hello_world: ELF 64-bit ... not stripped ... with debug_info
```

### 6.2 중단점 및 변수 확인

```cpp
int main() {
  int x = 42;
  int y = x * 2;
  return y;
}
```

- 중단점 설정: 라인 번호 왼쪽 클릭
- 변수 값 확인: hover 또는 Watch 창

---

## 7. 디버깅 주요 기능 요약

| 기능           | 설명                                 |
|----------------|--------------------------------------|
| 중단점 설정    | 코드 라인 왼쪽 클릭                  |
| 변수 보기      | hover 또는 Watch 창 사용             |
| 콜 스택 추적   | Call Stack 창에서 확인 가능          |
| 스텝 실행      | Step Over / Step Into / Step Out 지원 |
| 출력 확인      | Debug Console 또는 터미널 활용       |

---

## 8. 설정 원리 요약

- ✅ CMake Tools는 CMakeLists.txt 기반으로 실행 파일의 위치를 자동 인식합니다.
- ✅ settings.json의 cmake.debugConfig 설정을 기반으로 launch.json 없이 LLDB를 실행합니다.
- ✅ clangd는 compile_commands.json을 통해 코드 분석을 수행합니다.

---

## ✅ 요약

| 항목           | 설명                                          |
|----------------|-----------------------------------------------|
| 디버거         | LLDB                                          |
| 디버깅 방식    | CMake Tools 자동 연동 (launch.json 불필요)     |
| 실행 방법      | `CMake: Debug` 명령으로 자동 실행             |
| 설정 파일      | settings.json만 필요                          |
| 장점           | 프로젝트별 설정 없이 일관된 디버깅 환경 구성 가능 |
