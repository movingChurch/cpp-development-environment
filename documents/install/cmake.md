# 🏗️ CMake 설치 가이드

CMake는 플랫폼 독립적인 C/C++ 빌드 시스템으로, Modern C++ 프로젝트에서 Clang, GCC, MSVC 등 다양한 컴파일러와 함께 사용됩니다. 이 문서는 운영체제별 CMake 설치 방법과 기본 설정을 안내합니다.

---

## 📌 설치 전 요구사항

- 관리자 권한 (sudo 또는 관리자 계정)
- 인터넷 연결
- 기본적인 터미널 또는 명령 프롬프트 사용 능력

---

## 🪟 Windows에서 CMake 설치

### 방법 1: 공식 설치 프로그램 사용 (권장)

1. [CMake 공식 다운로드 페이지](https://cmake.org/download/) 방문
2. Windows용 설치 파일 (`.msi`) 다운로드
3. 설치 중 다음 옵션 선택:
   - ✅ Add CMake to the system PATH for all users

4. 설치 후 명령줄(cmd 또는 PowerShell)에서 확인:

```bash
cmake --version
```

### 방법 2: Chocolatey 사용

```powershell
choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System' -y
```

> Chocolatey 설치 필요: [https://chocolatey.org/install](https://chocolatey.org/install)

---

## 🍎 macOS에서 CMake 설치

### 방법 1: Homebrew 사용 (권장)

```bash
brew install cmake
```

### 방법 2: 공식 설치 프로그램 사용

1. [CMake 다운로드 페이지](https://cmake.org/download/)에서 `.dmg` 파일 다운로드
2. 설치 후 `/Applications/CMake.app` 실행
3. 메뉴에서 “Tools > How to Install For Command Line Use” 클릭
4. 안내에 따라 심볼릭 링크 생성:

```bash
sudo "/Applications/CMake.app/Contents/bin/cmake-gui" --install
```

---

## 🐧 Ubuntu/Linux에서 CMake 설치

### 방법 1: apt 패키지 사용 (기본 버전)

```bash
sudo apt update
sudo apt install cmake
```

> 기본 apt 저장소는 구버전일 수 있습니다.

### 방법 2: Kitware 공식 PPA 사용 (최신 버전 설치 권장)

```bash
sudo apt update
sudo apt install -y software-properties-common
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ focal main'
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc | sudo apt-key add -
sudo apt update
sudo apt install cmake
```

> Ubuntu 20.04 기준. 다른 버전은 [Kitware APT 문서](https://apt.kitware.com/) 참고

### 방법 3: 소스 코드 빌드 (대안)

```bash
wget https://github.com/Kitware/CMake/releases/download/v3.27.0/cmake-3.27.0.tar.gz
tar -zxvf cmake-3.27.0.tar.gz
cd cmake-3.27.0
./bootstrap
make -j$(nproc)
sudo make install
```

---

## ✅ 설치 확인

설치 후 다음 명령으로 확인합니다:

```bash
cmake --version
```

예시 출력:

```bash
cmake version 3.27.0

CMake suite maintained and supported by Kitware (kitware.com/cmake)
```

---

## ⚙️ 기본 사용 예시

### 1. 디렉토리 구성

```plaintext
my_project/
├── CMakeLists.txt
└── src/
    └── main.cpp
```

### 2. CMakeLists.txt 예시

```cmake
cmake_minimum_required(VERSION 3.20)
project(MyApp LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
add_executable(MyApp src/main.cpp)
```

### 3. 빌드 명령어

```bash
cmake -S . -B build
cmake --build build
```

---

## 🔗 참고 링크

- CMake 공식 홈페이지: <https://cmake.org>
- Kitware APT 저장소 안내: <https://apt.kitware.com>
- CMake 문서: <https://cmake.org/cmake/help/latest/>
- GitHub 저장소: <https://github.com/Kitware/CMake>

---

## 📌 요약

| 항목         | 설명                                      |
|--------------|-------------------------------------------|
| 설치 대상    | CMake (C++ 빌드 시스템)                   |
| 지원 OS      | Windows, macOS, Ubuntu/Linux              |
| 설치 방법    | 공식 설치 프로그램, 패키지 매니저, 소스 빌드 |
| 확인 방법    | `cmake --version`                         |
| 주요 기능    | 플랫폼 독립 빌드, Clang/GCC/MSVC 지원     |
