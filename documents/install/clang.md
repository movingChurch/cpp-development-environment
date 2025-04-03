# 🧱 Clang 설치 가이드

Clang은 LLVM 프로젝트의 일부로, 최신 C++ 표준(C++17/20/23 등)을 지원하는 고성능 C/C++ 컴파일러입니다.
Modern C++ 개발을 위해 Clang은 GCC보다 더 빠른 빌드 시간과 뛰어난 진단 메시지를 제공합니다.

> ✅ 이 문서는 Windows, macOS, Linux(Ubuntu) 기반 환경에서 Clang 설치 방법을 안내합니다.

---

## 📌 설치 전 요구사항

- 관리자 권한 또는 sudo 권한
- 인터넷 연결
- 기본적인 터미널/명령 프롬프트 사용 능력

---

## 🪟 Windows에서 Clang 설치

### 방법 1: LLVM 공식 설치 프로그램 사용

1. [LLVM 공식 다운로드 페이지](https://releases.llvm.org/download.html) 접속
2. Windows 용 인스톨러 (`LLVM-x.y.z-win64.exe`) 다운로드
3. 설치 시 다음 옵션 활성화:
   - Add LLVM to the system PATH
   - Install Clang tools

4. 설치 후 `cmd` 또는 `PowerShell` 열고 다음 명령어로 확인:

```bash
clang --version
```

### 방법 2: Chocolatey 사용 (권장)

```powershell
choco install llvm -y
```

> 참고: Chocolatey가 설치되어 있어야 합니다. [https://chocolatey.org/install](https://chocolatey.org/install)

---

## 🍎 macOS에서 Clang 설치

### 방법 1: Xcode Command Line Tools 사용 (권장)

```bash
xcode-select --install
```

- 설치 완료 후 확인:

```bash
clang --version
```

### 방법 2: Homebrew 사용

```bash
brew install llvm
```

- 설치 후 LLVM 바이너리를 PATH에 추가 (예: `~/.zshrc` 또는 `~/.bash_profile`)

```bash
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
```

---

## 🐧 Ubuntu/Linux에서 Clang 설치

### 방법 1: apt 패키지 사용

```bash
sudo apt update
sudo apt install clang
```

- 최신 버전이 필요할 경우 LLVM 공식 리포지토리 추가:

```bash
# 예: Clang 16 설치
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh
sudo ./llvm.sh 16
```

- 설치 확인:

```bash
clang++ --version
```

---

## ✅ 설치 확인

다음 명령어로 Clang이 정상 설치되었는지 확인할 수 있습니다:

```bash
clang --version
clang++ --version
```

출력 예시:

```bash
clang version 16.0.6 (https://github.com/llvm/llvm-project.git ...)
Target: x86_64-apple-darwin22.4.0
Thread model: posix
```

---

## ⚙️ 추가 설정 (선택 사항)

- **C++ 표준 지정**: 기본적으로 `-std=c++20` 등의 플래그로 표준을 지정합니다.

```bash
clang++ -std=c++20 -o main main.cpp
```

- **디버깅 심볼 포함**:

```bash
clang++ -g -O0 -std=c++20 -o main main.cpp
```

- **CMake와 함께 사용**: CMakeLists.txt에서 Clang을 명시하려면 다음과 같이 설정합니다:

```cmake
set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)
```

---

## 🔗 참고 링크

- LLVM 공식 홈페이지: <https://llvm.org>
- Clang 문서: <https://clang.llvm.org/docs/index.html>
- CMake와 Clang 연동: <https://cmake.org/cmake/help/latest/variable/CMAKE_CXX_COMPILER.html>

---

## 📌 요약

| 항목 | 설명 |
|------|------|
| 설치 대상 | Clang (C/C++ 컴파일러) |
| 지원 OS | Windows, macOS, Ubuntu/Linux |
| 설치 방법 | 패키지 매니저 또는 공식 설치 프로그램 |
| 확인 방법 | `clang --version` |
| 추가 설정 | C++20 이상, 디버깅 심볼, CMake 연동 등 |
