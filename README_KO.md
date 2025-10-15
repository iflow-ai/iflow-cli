# 🤖 iFlow CLI

[![Awesome Gemini CLI에서 언급](https://awesome.re/mentioned-badge.svg)](https://github.com/Piebald-AI/awesome-gemini-cli)

![iFlow CLI Screenshot](./assets/iflow-cli.jpg)

[English](README.md) | [中文](README_CN.md) | [日本語](README_JA.md) | **한국어** | [Français](README_FR.md) | [Deutsch](README_DE.md) | [Español](README_ES.md) | [Русский](README_RU.md)

iFlow CLI는 터미널에서 직접 실행되는 강력한 AI 어시스턴트입니다. 코드 저장소를 원활하게 분석하고, 코딩 작업을 수행하며, 상황별 요구사항을 이해하고, 간단한 파일 작업부터 복잡한 워크플로우까지 모든 것을 자동화하여 생산성을 향상시킵니다.

[더 많은 튜토리얼](https://platform.iflow.cn/)

## ✨ 주요 기능

1. **무료 AI 모델**: [iFlow 오픈 플랫폼](https://platform.iflow.cn/docs/api-mode)을 통해 Kimi K2, Qwen3 Coder, DeepSeek v3 등 강력하고 무료인 AI 모델에 액세스
2. **유연한 통합**: 좋아하는 개발 도구를 유지하면서 기존 시스템에 통합하여 자동화 구현
3. **자연어 상호작용**: 복잡한 명령어와 작별하고, 일상 대화로 AI를 구동하여 코드 개발부터 생활 어시스턴트까지
4. **오픈 플랫폼**: [iFlow 오픈 마켓](https://platform.iflow.cn/)에서 SubAgent와 MCP를 원클릭으로 설치, 지능형 에이전트를 빠르게 확장하여 나만의 AI 팀 구축

## 기능 비교
| 기능 | iFlow Cli | Claude Code | Gemini Cli |
|------|-----------|-------------|------------|
| Todo 계획 | ✅ | ✅ | ❌ |
| SubAgent | ✅ | ✅ | ❌ |
| 사용자 정의 명령어 | ✅ | ✅ | ✅ |
| 계획 모드 | ✅ | ✅ | ❌ |
| 작업 도구 | ✅ | ✅ | ❌ |
| VS Code 플러그인 | ✅ | ✅ | ✅ |
| JetBrains 플러그인 | ✅ | ✅ | ❌ |
| 대화 복원 | ✅ | ✅ | ❌ |
| 내장 오픈 마켓 | ✅ | ❌ | ❌ |
| 메모리 자동 압축 | ✅ | ✅ | ✅ |
| 멀티모달 기능 | ✅ | ⚠️ (중국 내 모델 미지원) | ⚠️ (중국 내 모델 미지원) |
| 검색 | ✅ | ❌ | ⚠️ (VPN 필요) |
| 무료 | ✅ | ❌ | ⚠️ (사용 제한) |
| Hook | ✅ | ✅ | ❌ |
| 출력 스타일 | ✅ | ✅ | ❌ |
| 사고 | ✅ | ✅ | ❌ |
| 워크플로우 | ✅ | ❌ | ❌ |
| SDK | ✅ | ✅ | ❌ |
| ACP | ✅ | ✅ | ✅ |

## ⭐ 주요 기능
* 4가지 실행 모드 지원: yolo(모델에 최대 권한, 모든 작업 수행 가능), accepting edits(모델에 파일 수정 권한만), plan mode(계획 먼저, 실행 나중), default(모델에 권한 없음)
* subAgent 기능 업그레이드: CLI를 일반 어시스턴트에서 전문가 팀으로 진화시켜 보다 전문적이고 정확한 조언 제공. /agent로 더 많은 사전 구성된 에이전트 확인
* task 도구 업그레이드: 컨텍스트 길이를 효과적으로 압축하여 CLI가 작업을 더 깊이 완료할 수 있도록 함. 컨텍스트가 70%에 달하면 자동 압축
* iFlow 오픈 마켓 통합: 유용한 MCP 도구, Subagent, 커스텀 명령어 및 워크플로우를 빠르게 설치
* 무료 멀티모달 모델 사용: CLI에서 이미지도 붙여넣기 가능 (Ctrl+V로 이미지 붙여넣기)
* 대화 기록 저장 및 롤백 지원 (iflow --resume 및 /chat 명령어)
* 더 많은 유용한 터미널 명령어 지원 (iflow -h로 더 많은 명령어 확인)
* VSCode 플러그인 지원
* 자동 업그레이드: iFlow CLI가 현재 버전이 최신인지 자동 감지


## 📥 설치

### 시스템 요구사항
- 운영 체제: macOS 10.15+, Ubuntu 20.04+/Debian 10+, 또는 Windows 10+ (WSL 1, WSL 2, 또는 Git for Windows 사용)
- 하드웨어: 4GB+ RAM
- 소프트웨어: Node.js 22+
- 네트워크: 인증 및 AI 처리를 위한 인터넷 연결 필요
- 셸: Bash, Zsh 또는 Fish에서 최적으로 작동

### 설치 명령어
**MAC/Linux/Ubuntu 사용자**:
* 원클릭 설치 명령어 (권장)
```shell
bash -c "$(curl -fsSL https://cloud.iflow.cn/iflow-cli/install.sh)"
```
* Node.js를 사용한 설치
```shell
npm i -g @iflow-ai/iflow-cli
```

이 명령어는 터미널에 필요한 모든 종속성을 자동으로 설치합니다.

**Windows 사용자**:
1. https://nodejs.org/ko/download 로 이동하여 최신 Node.js 설치 프로그램을 다운로드하세요
2. 설치 프로그램을 실행하여 Node.js를 설치하세요
3. 터미널을 다시 시작하세요: CMD 또는 PowerShell
4. `npm install -g @iflow-ai/iflow-cli`를 실행하여 iFlow CLI를 설치하세요
5. `iflow` 를 실행하여 iFlow CLI를 시작하세요

중국 본토에 계신 경우 다음 명령어를 사용하여 iFlow CLI를 설치할 수 있습니다:
1. https://cloud.iflow.cn/iflow-cli/nvm-setup.exe 로 이동하여 최신 nvm 설치 프로그램을 다운로드하세요
2. 설치 프로그램을 실행하여 nvm을 설치하세요
3. **터미널을 다시 시작하세요: CMD 또는 PowerShell**
4. `nvm node_mirror https://npmmirror.com/mirrors/node/` 와 `nvm npm_mirror https://npmmirror.com/mirrors/npm/`를 실행하세요
5. `nvm install 22`를 실행하여 Node.js 22를 설치하세요
6. `nvm use 22`를 실행하여 Node.js 22를 사용하세요
7. `npm install -g @iflow-ai/iflow-cli`를 실행하여 iFlow CLI를 설치하세요
8. `iflow`를 실행하여 iFlow CLI를 시작하세요

## 🗑️ 제거
```shell
npm uninstall -g @iflow-ai/iflow-cli
```

## 🔑 인증

iFlow는 두 가지 인증 옵션을 제공합니다:

1. **권장**: iFlow의 기본 인증 사용
2. **대안**: OpenAI 호환 API를 통한 연결

![iFlow CLI Login](./assets/login.jpg)

옵션 1을 선택하여 직접 로그인하면 웹페이지에서 iFlow 계정 인증이 열립니다. 인증 완료 후 무료로 사용할 수 있습니다.

![iFlow CLI Web Login](./assets/web-login.jpg)

서버와 같이 웹페이지를 열 수 없는 환경에서는 옵션 2를 사용하여 로그인하세요.

API 키를 얻으려면:
1. iFlow 계정에 가입
2. 프로필 설정으로 이동하거나 [이 직접 링크](https://iflow.cn/?open=setting)를 클릭
3. 팝업 대화상자에서 "재설정"을 클릭하여 새 API 키 생성

![iFlow Profile Settings](./assets/profile-settings.jpg)

키를 생성한 후 터미널 프롬프트에 붙여넣어 설정을 완료하세요.

## 🚀 시작하기

iFlow CLI를 실행하려면 터미널에서 작업 공간으로 이동한 후 다음을 입력하세요:

```shell
iflow
```

### 새 프로젝트 시작

새 프로젝트의 경우 만들고자 하는 것을 간단히 설명하세요:

```shell
cd new-project/
iflow
> HTML을 사용하여 웹 기반 마인크래프트 게임 만들기
```

### 기존 프로젝트 작업

기존 코드베이스의 경우 `/init` 명령어로 시작하여 iFlow가 프로젝트를 이해할 수 있도록 도와주세요:

```shell
cd project1/
iflow
> /init
> requirement.md 파일의 PRD 문서에 따라 요구사항을 분석하고 기술 문서를 출력한 다음 솔루션을 구현하세요.
```

`/init` 명령어는 코드베이스를 스캔하고, 구조를 학습하며, 포괄적인 문서가 포함된 IFLOW.md 파일을 생성합니다.

슬래시 명령어의 전체 목록과 사용 지침은 [여기](./i18/en/commands.md)를 참조하세요.

## 💡 일반적인 사용 사례

iFlow CLI는 코딩을 넘어 다양한 작업을 처리할 수 있습니다:

### 📊 정보 및 계획

```text
> 로스앤젤레스에서 평점이 가장 높은 레스토랑을 찾아서 3일간의 음식 투어 일정을 만들어 주세요.
```

```text
> 최신 아이폰 가격 비교를 검색하고 가장 비용 효율적인 구매 옵션을 찾아주세요.
```

### 📁 파일 관리

```text
> 바탕화면의 파일들을 파일 유형별로 별도 폴더에 정리해 주세요.
```

```text
> 이 웹페이지의 모든 이미지를 일괄 다운로드하고 날짜별로 이름을 변경해 주세요.
```

### 📈 데이터 분석

```text
> 이 Excel 스프레드시트의 판매 데이터를 분석하고 간단한 차트를 생성해 주세요.
```

```text
> 이 CSV 파일들에서 고객 정보를 추출하고 통합 테이블로 병합해 주세요.
```

### 👨‍💻 개발 지원

```text
> 이 시스템의 주요 아키텍처 구성 요소와 모듈 종속성을 분석해 주세요.
```

```text
> 요청 후 null pointer exception이 발생하고 있습니다. 문제의 원인을 찾아주세요.
```

### ⚙️ 워크플로우 자동화

```text
> 중요한 파일들을 클라우드 스토리지에 주기적으로 백업하는 스크립트를 만들어 주세요.
```

```text
> 매일 주식 가격을 다운로드하고 이메일 알림을 보내는 프로그램을 작성해 주세요.
```

*참고: 고급 자동화 작업은 MCP 서버를 활용하여 로컬 시스템 도구를 엔터프라이즈 협업 도구와 통합할 수 있습니다.*

## 🔧 사용자 정의 모델로 전환

iFlow CLI는 OpenAI 호환 API에 연결할 수 있습니다. `~/.iflow/settings.json`의 설정 파일을 편집하여 사용하는 모델을 변경하세요.

다음은 설정 데모 파일입니다:
```json
{
    "theme": "Default",
    "selectedAuthType": "iflow",
    "apiKey": "your iflow key",
    "baseUrl": "https://apis.iflow.cn/v1",
    "modelName": "Qwen3-Coder",
    "searchApiKey": "your iflow key"
}
```

## 🔄 GitHub Actions

GitHub Actions 워크플로우에서도 iFlow CLI를 커뮤니티가 유지보수하는 액션으로 사용할 수 있습니다: [iflow-cli-action](https://github.com/vibe-ideas/iflow-cli-action)

## 👥 커뮤니티 소통
사용 중 문제가 발생하면 GitHub 페이지에서 직접 이슈를 생성할 수 있습니다.

다음 WeChat 그룹 QR 코드를 스캔하여 커뮤니케이션과 토론을 위한 커뮤니티 그룹에 참여할 수도 있습니다.

### WeChat 그룹
![WeChat 그룹](./assets/iflow-wechat.jpg)
