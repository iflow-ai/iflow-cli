---
sidebar_position: 0
hide_title: true
title: Quick Start
---

import Controlled from '@/components/Controlled';

<Controlled type="ApiKeyFailureMechanism" hideMsg>

:::info 🔔 Important Notice

Starting from October 10, 2025, iFlow CLI will switch to a new authentication method, and you will need to manually update the API Key at that time. It is recommended to use/auth to log in through iFlow to avoid service interruptions.

:::

</Controlled>

# Quick Start

> **Goal**: Install, configure, and run your first AI-assisted task with iFlow CLI in 5 minutes  
> **Prerequisites**: Basic terminal operation experience  
> **What you'll learn**: Install iFlow CLI, set up API key, execute basic commands

iFlow CLI is a terminal-based AI assistant that can analyze code, execute programming tasks, and handle file operations. This guide helps you quickly get started with core features.

## Core Concepts (30-second overview)

| Term | Description |
|------|-------------|
| **iFlow CLI** | Terminal-based AI assistant tool |
| **Slash Commands** | Control commands starting with `/` (e.g., `/init`, `/help`) |
| **@** | File reference @filepath (e.g., `@src/App.tsx`) |
| **$** | Execute a specific subagent starting with `$` (e.g., `$code-reviewer`) |
| **Shell Commands** | Commands starting with `!` that execute system commands in CLI |
| **yolo** | Execution mode that allows CLI to perform all operations by default |
| **MCP** | Model Context Protocol, a server system for extending AI capabilities |
| **Sub Agent** | Intelligent Agent system for executing different specialized tasks |
| **Sub Command** | Command line extensions |
| **context left** | Indicator at the bottom right of CLI showing remaining context length during conversation |

> 💡 **More terms**: See the complete [Terminology Glossary](./glossary) for all concept definitions

## Step 1: Installation (2 minutes)

### System Requirements
- Node.js 22+ 
- 4GB+ RAM
- Internet connection

### Quick Installation

**macOS/Linux**
```shell
# One-click installation script that installs all required dependencies
bash -c "$(curl -fsSL https://gitee.com/iflow-ai/iflow-cli/raw/main/install.sh)"

# If you already have Node.js 22+
npm i -g @iflow-ai/iflow-cli@latest
```

**Windows**
```shell
1. Visit https://nodejs.org/en/download to download the latest Node.js installer
2. Run the installer to install Node.js
3. Restart terminal: CMD (Windows + R, type cmd) or PowerShell
4. Run `npm install -g @iflow-ai/iflow-cli@latest` to install iFlow CLI
5. Run `iflow` to start iFlow CLI
```

> **Verify installation**: Run `iflow --version` to confirm successful installation

## Step 2: Initial Setup (1 minute)

### Start iFlow
```shell
iflow
```

### Choose Login Method

iFlow CLI supports three login methods with different feature sets:

#### 🌟 Method 1: Login with iFlow (Recommended)
**Strongly recommended to use Login with iFlow for the most complete feature experience:**

✅ **Full Feature Support**
- **WebSearch Service**: Intelligent web search for latest information
- **WebFetch Service**: Web content extraction and analysis  
- **Multimodal Capabilities**: Built-in image understanding and more
- **Tool Calling Optimization**: Models provided by iFlow platform are specially optimized for more accurate and efficient tool calling

✅ **Best User Experience**
- **Auto-renewal**: Token automatically refreshes, never expires
- **Seamless Connection**: One-time authorization for continuous use

**Login with iFlow Steps:**
1. Run `iflow` and select Login with iFlow
2. CLI will automatically open browser and redirect to iFlow platform
3. Complete registration/login and authorize iFlow CLI
4. Automatically return to terminal and start using

#### Method 2: iFlow API Key Login
> 💡 **Use Case**: Server environments or scenarios without browser access

✅ **Feature Support**: Same as Method 1, enjoy complete iFlow platform features (WebSearch, WebFetch, multimodal, tool calling optimization, etc.)

⚠️ **Note**: API Key expires in 7 days and requires periodic renewal

**API Key Login Steps:**
1. Visit [iFlow Official Website](https://iflow.cn/?spm=54878a4d.2ef5001f.0.0.7c1257832yovzX&open=setting) to register
2. Generate your API KEY in user settings page
3. Select API Key login in iFlow CLI and enter the key

#### Method 3: OpenAI Compatible API
> 💡 **Use Case**: Using your own model service or other OpenAI protocol-compatible services

⚠️ **Feature Limitations**:
- WebSearch service not supported
- WebFetch service not supported
- iFlow platform's built-in multimodal capabilities not supported
- Cannot enjoy iFlow platform models' tool calling optimization

**Configuration Steps:**
1. Select "OpenAI Compatible API" option
2. Enter service endpoint URL
3. Enter corresponding API Key

### Select Model
After successful login, choose your preferred large language model to start using

## Step 3: Run Your First Task (2 minutes)

### Method A: Project Analysis
```shell
# In any code project directory
cd your-project/
iflow
> /init
> Analyze the structure and main features of this project
```

### Method B: Simple Task
```shell
iflow
> Create a Python script that calculates the first 10 numbers of the Fibonacci sequence
```

### Method C: Shell Command Assistance
```shell
iflow
> !ls -la
> Help me analyze this directory structure and suggest how to organize the files
```
## Auto Update
iFlow CLI will check for the latest version when starting and will auto-update
### Auto Update Failed
If auto-update fails, manual update is required
```shell
# Update command
npm i -g @iflow-ai/iflow-cli to update
# Check latest version
iflow -v
```

### Uninstall and Reinstall
If manual update also fails, you need to uninstall and reinstall
```shell
# Uninstall
npm uninstall -g @iflow-ai/iflow-cli
# Check if iflow command still exists
iflow -v

# Reinstall
npm i -g @iflow-ai/iflow-cli
```

## Common Commands Quick Reference

| Command | Function | Example |
|---------|----------|----------|
| `/help` | View help | `/help` |
| `/init` | Analyze project structure | `/init` |
| `/clear` | Clear conversation history | `/clear` |
| `/exit` | Exit CLI | `/exit` |
| `!command` | Execute system command | `!npm install` |

## Troubleshooting

### Installation Issues
```shell
# Check Node.js version
node --version  # Requires 22+

# Check network connection
curl -I https://apis.iflow.cn/v1
```

### Authentication Issues
- Ensure API key is copied correctly (no extra spaces)
- Check if network connection is working
- Regenerate API key and try again

### Commands Not Responding
- Use `Ctrl+C` to interrupt current operation
- Run `/clear` to clear context
- Restart CLI: Use `/exit` then run `iflow` again

## Next Steps

After completing the quick start, we recommend diving deeper in the following order:

1. **[Basic Usage](./examples/basic-usage)** - Master daily usage techniques (10 minutes)
2. **[Interactive Mode](./features/interactive)** - Learn efficient interaction methods (15 minutes)
3. **[MCP](./examples/mcp)** - Extend AI capabilities (15 minutes)
4. **[Best Practices](./examples/best-practices)** - Boost work efficiency (20 minutes)

> **Get Help**: Having issues? Check the [Complete Documentation](./examples/index.md) or [Submit Feedback](https://github.com/iflow-ai/iflow-cli/issues)