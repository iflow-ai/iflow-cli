# 🤖 iFlow CLI
![iFlow CLI Screenshot](./assets/iflow-cli.jpg)

**English** | [中文](README_CN.md) | [日本語](README_JA.md) | [한국어](README_KO.md) | [Français](README_FR.md) | [Deutsch](README_DE.md) | [Español](README_ES.md) | [Русский](README_RU.md)

iFlow CLI is a powerful AI assistant that runs directly in your terminal. It seamlessly analyzes code repositories, executes coding tasks, understands context-specific needs, and boosts productivity by automating everything from simple file operations to complex workflows.

## ✨ Key Features

1. **Free AI Models**: Access powerful and free AI models through the [iFlow open platform](https://docs.iflow.cn/en/docs), including Kimi K2, Qwen3 Coder, DeepSeek v3, and more
2. **Flexible Integration**: Full support for OpenAI protocol model providers
3. **Intuitive Interface**: Streamlined terminal experience with context-aware assistance
4. **Ready-to-Use Assistant**: Pre-configured MCP servers and specialized agents that work together to solve complex problems right out of the box

## 📥 Installation

```shell
bash -c "$(curl -fsSL https://cloud.iflow.cn/iflow-cli/install.sh)"
```

This command automatically installs all necessary dependencies for your terminal.

**Windows Users**: First launch `bash` in your terminal, then run the installation script above.

## 🔑 Authentication

iFlow offers two authentication options:

1. **Recommended**: Use iFlow's native authentication
2. **Alternative**: Connect via OpenAI-compatible APIs

![iFlow CLI Login](./assets/login.jpg)

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

## GitHub Actions

You can also use iFlow CLI in your GitHub Actions workflows with the community-maintained action: [iflow-cli-action](https://github.com/vibe-ideas/iflow-cli-action)