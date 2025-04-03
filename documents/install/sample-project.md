# 🧪 샘플 C++ 프로젝트 구성 및 빌드 가이드

(CMake + Clang + clangd + LLDB 기반)

이 문서는 Modern C++ 개발환경에서 CMake를 사용하여 간단한 C++ 프로젝트를 구성하고, Clang으로 빌드하며, clangd와 LLDB를 통해 코드 분석 및 디버깅하는 전체 과정을 안내합니다.

---

## 1. 프로젝트 구조

```plaintext
my_project/
├── CMakeLists.txt
├── src/
│   └── main.cpp
└── build/         ← CMake 빌드 디렉토리 (자동 생성)
```

---

## 2. CMakeLists.txt 예시

```cmake
cmake_minimum_required(VERSION 3.20)
project(HelloWorld LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_BUILD_TYPE Debug)

add_executable(hello_world src/main.cpp)
```

> ✅ `CMAKE_BUILD_TYPE`을 `Debug`로 설정하여 디버깅 심볼을 포함시킵니다.

---

## 3. main.cpp 예시

```cpp
#include <iostream>

int main() {
    int x = 42;
    int y = x * 2;
    std::cout << "Hello, Modern C++! y = " << y << std::endl;
    return 0;
}
```

---

## 4. 빌드 및 실행

### 4.1 CMake 빌드 명령어

```bash
mkdir -p build
cd build
cmake ..
cmake --build .
```

### 4.2 실행

```bash
./hello_world
```

출력 예시:

``` bash
Hello, Modern C++! y = 84
```

---

## 5. clangd를 위한 설정

### 5.1 compile_commands.json 자동 생성

`CMakeLists.txt` 또는 CMake 명령어에 다음 옵션 추가:

```bash
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
```

또는 `CMake Tools` 확장에서 자동으로 생성되도록 설정:

```json
"cmake.configureSettings": {
  "CMAKE_EXPORT_COMPILE_COMMANDS": "ON"
}
```

### 5.2 심볼 인식 확인

- VS Code에서 clangd가 코드 분석, 자동 완성, 오류 표시 등을 정상적으로 수행하는지 확인
- `.vscode/c_cpp_properties.json` 없이도 동작

---

## 6. 디버깅 (LLDB + CodeLLDB)

### 6.1 디버깅 준비

- 빌드 시 `Debug` 모드 설정 (`CMAKE_BUILD_TYPE=Debug`)
- `build/hello_world` 실행 파일이 디버깅 심볼을 포함해야 함

### 6.2 디버깅 실행 (CMake Tools 사용)

1. Command Palette 열기 (`Ctrl+Shift+P` 또는 `Cmd+Shift+P`)
2. `CMake: Debug` 실행
3. LLDB 기반 디버깅 세션 자동 시작

---

## 7. VS Code 설정 요약 (settings.json)

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

---

## ✅ 요약

| 항목 | 설명 |
|------|------|
| 빌드 시스템 | CMake |
| 컴파일러 | Clang |
| 언어 서버 | clangd |
| 디버거 | LLDB (CodeLLDB 확장 사용) |
| 빌드 구성 | Debug 모드, `compile_commands.json` 자동 생성 |
| 디버깅 실행 | `CMake: Debug` 명령으로 launch.json 없이 실행 가능 |
