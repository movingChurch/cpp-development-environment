# 🧰 Modern C++ 개발환경 구성 가이드 (LLDB 기반)

[clang]: documents/install/clang.md
[cmake]: documents/install/cmake.md
[ninja]: documents/install/ninja.md
[vscode]: documents/install/vscode.md
[git]: documents/install/git.md
[github-cli]: documents/install/github-cli.md
[coding-font]: documents/install/coding-font.md
[debugger]: documents/install/debugger.md
[sample-project]: documents/install/sample-project.md

이 문서는 Modern C++ 개발에 필요한 주요 도구들을 소개하고, 각 도구의 설치 방법과 설정 절차를 안내합니다.
모든 도구는 독립적으로 설치할 수 있으며, 필요한 항목만 선택적으로 구성해도 무방합니다.

> 💡 이 가이드는 LLDB 디버거와 CMake Tools 기반 자동화 디버깅 환경을 기준으로 작성되었습니다.

---

## 📦 설치 항목 요약

| 도구 | 설명 |
|------|------|
| [Clang][clang] | 최신 C++ 표준을 지원하는 LLVM 기반 컴파일러 |
| [CMake][cmake] | 플랫폼 독립 빌드 시스템 |
| [Ninja][ninja] | 고속 빌드를 위한 경량 빌드 시스템 |
| [Visual Studio Code][vscode] | 경량 IDE 및 코드 편집기 |
| [Git][git] | 분산 버전 관리 시스템 |
| [GitHub CLI][github-cli] | GitHub 리포지토리 관리용 명령줄 도구 |
| [코딩 폰트][coding-font] | Fira Code 등, 가독성 높은 개발용 폰트 |
| [LLDB 디버거][debugger] | LLVM 기반 C++ 디버거 |
| [샘플 프로젝트][sample-project] | CMake 기반 예제 프로젝트 빌드 |

---

## 🛠 설치 순서 추천

1. [Clang][clang] 설치
2. [CMake][cmake] 설치
3. [Ninja][ninja] 설치 (CMake 빌드 최적화용)
4. [Visual Studio Code][vscode] 설치 및 확장 설정
5. [Git][git] 설치 및 GitHub 연동
6. [GitHub CLI][github-cli] 설치 (선택 사항)
7. [코딩 폰트][coding-font] 설치 및 설정
8. [LLDB 디버거][debugger] 설치 및 설정
9. [샘플 프로젝트][sample-project] 빌드 및 테스트

---

## 💡 개발환경 구성 체크리스트

- [ ] C++20 이상을 지원하는 Clang 설치됨
- [ ] CMake ≥ 3.16 설치됨
- [ ] Ninja 설치됨 및 `ninja --version` 확인
- [ ] VS Code 설치 및 확장 적용 (clangd, CMake Tools, CodeLLDB)
- [ ] Git 및 GitHub 로그인 완료
- [ ] Fira Code 등 개발용 폰트 설정 완료
- [ ] LLDB 디버거 설치 및 VS Code 연동 완료
- [ ] 샘플 프로젝트 빌드 및 디버깅 테스트 완료

---

## 📁 문서 구성

각 항목은 별도의 문서로 구성되어 있으며, 필요할 때 개별적으로 확인할 수 있습니다.

- [clang.md][clang]: Clang 설치 가이드
- [cmake.md][cmake]: CMake 설치 가이드
- [ninja.md][ninja]: Ninja 설치 가이드
- [vscode.md][vscode]: VS Code 설정 및 확장
- [git.md][git]: Git 설치 및 초기 설정
- [github-cli.md][github-cli]: GitHub CLI 설치 및 인증
- [coding-font.md][coding-font]: Fira Code 설치 및 적용
- [debugger.md][debugger]: LLDB 설치 및 VS Code 연동
- [sample-project.md][sample-project]: CMake 기반 샘플 프로젝트 빌드 및 디버깅

---

## 🧭 운영체제 지원

| OS            | 지원 여부 | 비고 |
|---------------|-----------|------|
| Windows       | ✅        | WSL 또는 LLVM toolchain 필요 |
| macOS         | ✅        | Xcode CLI 도구에 포함된 LLDB 사용 |
| Ubuntu/Linux  | ✅        | apt로 설치 가능 |

---

## 📌 참고

- 이 문서는 Windows (WSL 포함), macOS, Ubuntu를 기준으로 작성되었습니다.
- 운영체제별 명령어 차이가 있을 수 있으므로, 각 문서의 OS별 절차를 확인하세요.
- Clang과 LLDB는 LLVM 프로젝트의 일부로 함께 사용되며, 최신 C++ 표준을 잘 지원합니다.
- Ninja는 CMake의 빌드 속도를 크게 향상시켜주는 추천 도구입니다.
