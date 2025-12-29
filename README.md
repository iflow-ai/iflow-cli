# 🤖 iFlow CLI

[![Mentioned in Awesome Gemini CLI](https://awesome.re/mentioned-badge.svg)](https://github.com/Piebald-AI/awesome-gemini-cli)

![iFlow CLI Screenshot](./assets/iflow-cli.jpg)

**English** | [中文](README_CN.md) | [日本語](README_JA.md) | [한국어](README_KO.md) | [Français](README_FR.md) | [Deutsch](README_DE.md) | [Español](README_ES.md) | [Русский](README_RU.md)

iFlow CLI is a powerful AI assistant that runs directly in your terminal. It seamlessly analyzes code repositories, executes coding tasks, understands context-specific needs, and boosts productivity by automating everything from simple file operations to complex workflows.

[More Tutorials](https://platform.iflow.cn/)

## ✨ Key Features

1. **Free AI Models**: Access powerful and free AI models through the [iFlow open platform](https://platform.iflow.cn/docs/api-mode), including Kimi K2, Qwen3 Coder, DeepSeek v3, and more
2. **Flexible Integration**: Keep your favorite development tools while integrating into existing systems for automation
3. **Natural Language Interaction**: Say goodbye to complex commands, drive AI with everyday conversation, from code development to life assistance
4. **Open Platform**: Install SubAgents and MCP with one click from the [iFlow Open Market](https://platform.iflow.cn/), quickly expand intelligent agents and build your own AI team

## Feature Comparison
| Feature | iFlow Cli | Claude Code | Gemini Cli |
|---------|-----------|-------------|------------|
| Todo Planning | ✅ | ✅ | ❌ |
| SubAgent | ✅ | ✅ | ❌ |
| Custom Commands | ✅ | ✅ | ✅ |
| Plan Mode | ✅ | ✅ | ❌ |
| Task Tools | ✅ | ✅ | ❌ |
| VS Code Plugin | ✅ | ✅ | ✅ |
| JetBrains Plugin | ✅ | ✅ | ❌ |
| Conversation Recovery | ✅ | ✅ | ❌ |
| Built-in Open Market | ✅ | ❌ | ❌ |
| Memory Auto-compression | ✅ | ✅ | ✅ |
| Multimodal Capability | ✅ | ⚠️ (Limited in China) | ⚠️ (Limited in China) |
| Search | ✅ | ❌ | ⚠️ (Requires VPN) |
| Free | ✅ | ❌ | ⚠️ (Limited Usage) |
| Hook | ✅ | ✅ | ❌ |
| Output Style | ✅ | ✅ | ❌ |
| Thinking | ✅ | ✅ | ❌ |
| Workflow | ✅ | ❌ | ❌ |
| SDK | ✅ | ✅ | ❌ |
| ACP | ✅ | ✅ | ✅ |


## ⭐ Key Features
* Support 4 running modes: yolo (model has maximum permissions, can perform any operation), accepting edits (model only has file modification permissions), plan mode (plan first, then execute), default (model has no permissions)
* Upgraded subAgent functionality: Transform CLI from general assistant to expert team, providing more professional and accurate advice. Use /agent to see more pre-configured agents
* Upgraded task tool: Effectively compress context length, allowing CLI to complete your tasks more thoroughly. Auto-compression when context reaches 70%
* Integrated with iFlow Open Market: Quickly install useful MCP tools, Subagents, custom instructions and workflows
* Free multimodal model usage: You can also paste images in CLI now (Ctrl+V to paste images)
* Support for conversation history saving and rollback (iflow --resume and /chat commands)
* Support for more useful terminal commands (iflow -h to see more commands)
* VSCode plugin support
* Auto-upgrade: iFlow CLI automatically detects if current version is latest


## 📥 Installation

### System requirements
- Operating Systems: macOS 10.15+, Ubuntu 20.04+/Debian 10+, or Windows 10+ (with WSL 1, WSL 2, or Git for Windows)
- Hardware: 4GB+ RAM
- Software: Node.js 22+
- Network: Internet connection required for authentication and AI processing
- Shell: Works best in Bash, Zsh or Fish

### Installation Commands
**MAC/Linux/Ubuntu Users**:
* One-click installation command (Recommended)
```shell
bash -c "$(curl -fsSL https://cloud.iflow.cn/iflow-cli/install.sh)"
```
* Using Node.js installation
```shell
npm i -g @iflow-ai/iflow-cli
```

This command automatically installs all necessary dependencies for your terminal.

**Windows Users**:
1. Go to https://nodejs.org/en/download to download the latest Node.js installer
2. Run the installer to install Node.js
3. Restart your terminal: CMD or PowerShell
4. Run `npm install -g @iflow-ai/iflow-cli` to install iFlow CLI
5. Run `iflow` to start iFlow CLI

If you are in China Mainland, you can use the following command to install iFlow CLI:
1. Go to https://cloud.iflow.cn/iflow-cli/nvm-setup.exe to download the latest nvm installer
2. Run the installer to install nvm
3. **Restart your terminal: CMD or PowerShell**
4. Run `nvm node_mirror https://npmmirror.com/mirrors/node/` and `nvm npm_mirror https://npmmirror.com/mirrors/npm/`
5. Run `nvm install 22` to install Node.js 22
6. Run `nvm use 22` to use Node.js 22
7. Run `npm install -g @iflow-ai/iflow-cli` to install iFlow CLI
8. Run `iflow` to start iFlow CLI

## 🗑️ Uninstall
```shell
npm uninstall -g @iflow-ai/iflow-cli
```

## 🔑 Authentication

iFlow offers two authentication options:

1. **Recommended**: Use iFlow's native authentication
2. **Alternative**: Connect via OpenAI-compatible APIs

![iFlow CLI Login](./assets/login.jpg)

Choose option 1 to login directly, which will open iFlow account authentication in a web page. After completing authentication, you can use it for free.

![iFlow CLI Web Login](./assets/web-login.jpg)

If you are in an environment like a server where you cannot open a web page, please use option 2 to login.

To get your API key:
1. Register for an iFlow account
2. Go to your profile settings or click [this direct link](https://iflow.cn/?open=setting)
3. Click "Reset" in the pop-up dialog to generate a new API key

![iFlow Profile Settings](./assets/profile-settings.jpg)

After generating your key, paste it into the terminal prompt to complete setup.

## 🚀 Getting Started

To launch iFlow CLI, navigate to your workspace in the terminal and type:

```shell
iflow
```

### Starting New Projects

For new projects, simply describe what you want to create:

```shell
cd new-project/
iflow
> Create a web-based Minecraft game using HTML
```

### Working with Existing Projects

For existing codebases, begin with the `/init` command to help iFlow understand your project:

```shell
cd project1/
iflow
> /init
> Analyze the requirements according to the PRD document in requirement.md file, and output a technical document, then implement the solution.
```

The `/init` command scans your codebase, learns its structure, and creates an IFLOW.md file with comprehensive documentation.

For a complete list of slash commands and usage instructions, see [here](./i18/en/commands.md).

## 💡 Common Use Cases

iFlow CLI extends beyond coding to handle a wide range of tasks:

### 📊 Information & Planning

```text
> Help me find the best-rated restaurants in Los Angeles and create a 3-day food tour itinerary.
```

```text
> Search for the latest iPhone price comparisons and find the most cost-effective purchase option.
```

### 📁 File Management

```text
> Organize the files on my desktop by file type into separate folders.
```

```text
> Batch download all images from this webpage and rename them by date.
```

### 📈 Data Analysis

```text
> Analyze the sales data in this Excel spreadsheet and generate a simple chart.
```

```text
> Extract customer information from these CSV files and merge them into a unified table.
```

### 👨‍💻 Development Support

```text
> Analyze the main architectural components and module dependencies of this system.
```

```text
> I'm getting a null pointer exception after my request, please help me find the cause of the problem.
```

### ⚙️ Workflow Automation

```text
> Create a script to periodically backup my important files to cloud storage.
```

```text
> Write a program that downloads stock prices daily and sends me email notifications.
```

*Note: Advanced automation tasks can leverage MCP servers to integrate your local system tools with enterprise collaboration suites.*

## 🔧 Switch to customized model

iFlow CLI can connect to any OpenAI-compatible API. Edit the settings file in `~/.iflow/settings.json` to change the model you use.

Here is a settings demo file:
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

You can also use iFlow CLI in your GitHub Actions workflows with the community-maintained action: [iflow-cli-action](https://github.com/iflow-ai/iflow-cli-action)

## 🖥️ Graphical Interface

Looking for a graphical interface?

- [**AionUi**](https://github.com/iOfficeAI/AionUi) A modern GUI for command-line AI tools including iFlow CLI

## 👥 Community Communication
If you encounter problems in use, you can directly raise Issues on the github page.

You can also scan the following Wechat group to join the community group for communication and discussion.

### Wechat group
![Wechat group](./assets/iflow-wechat.jpg)
