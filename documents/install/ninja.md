
# ⚡ Ninja 설치 가이드

Ninja는 빠른 속도를 자랑하는 빌드 시스템으로, CMake와 함께 사용되어 Modern C++ 프로젝트에서 효율적인 빌드를 지원합니다. 이 문서에서는 운영체제별 Ninja 설치 방법과 CMake에서 사용하는 방법을 안내합니다.

---

## 📌 설치 전 요구사항

- 관리자 권한 (sudo 또는 관리자 계정)
- 인터넷 연결
- CMake ≥ 3.16 권장

---

## 🪟 Windows에서 Ninja 설치

### 방법 1: Chocolatey 사용 (권장)

```powershell
choco install ninja -y
```

> Chocolatey 설치 필요: <https://chocolatey.org/install>

### 방법 2: 수동 설치

1. [Ninja Releases](https://github.com/ninja-build/ninja/releases) 페이지에서 `ninja-win.zip` 다운로드
2. 압축 해제 후 `ninja.exe`를 적절한 경로(예: `C:\Tools\Ninja`)에 저장
3. 시스템 환경 변수 PATH에 해당 경로 추가

### 설치 확인

```powershell
ninja --version
```

---

## 🍎 macOS에서 Ninja 설치

### 방법 1: Homebrew 사용 (권장)

```bash
brew install ninja
```

### 방법 2: 수동 설치

1. GitHub Releases에서 `ninja-mac.zip` 다운로드
2. 압축 해제 후 `/usr/local/bin` 또는 사용자 PATH에 복사

### 설치 확인

```bash
ninja --version
```

---

## 🐧 Ubuntu/Linux에서 Ninja 설치

### 방법 1: apt 패키지 사용

```bash
sudo apt update
sudo apt install ninja-build
```

### 방법 2: 수동 설치

```bash
wget https://github.com/ninja-build/ninja/releases/download/v1.11.1/ninja-linux.zip
unzip ninja-linux.zip
sudo mv ninja /usr/local/bin
sudo chmod +x /usr/local/bin/ninja
```

### 설치 확인

```bash
ninja --version
```

---

## ⚙️ CMake에서 Ninja 사용하기

CMake에서 Ninja를 사용하려면 `-G Ninja` 옵션을 사용하거나 VS Code 설정 또는 CMake Preset에 명시합니다.

### 명령줄 예시

```bash
cmake -S . -B build -G Ninja
cmake --build build
```

### settings.json 예시 (VS Code)

```json
{
  "cmake.generator": "Ninja"
}
```

---

## ✅ 요약

| 항목          | 설명                                      |
|---------------|-------------------------------------------|
| 설치 대상     | Ninja (경량 빌드 시스템)                  |
| 지원 OS       | Windows, macOS, Ubuntu/Linux              |
| 설치 방법     | 패키지 매니저 또는 수동 설치               |
| 확인 방법     | `ninja --version`                         |
| CMake 연동    | `-G Ninja` 또는 settings.json에서 설정    |
