---
title: Changelog
description: iFlow CLI version update history and change records
sidebar_position: 100
---

# Changelog

> **Purpose**: Record iFlow CLI version update history, new features, and important changes  
> **Use Cases**: Understanding version differences, upgrade reference, feature tracking

## Version History

### v0.3.2 (October 14, 2025)

#### Feature Improvements
- **Internet Search Optimization**: Optimized internet search text
- **Model Switching Fix**: Fixed history loss issue caused by model switching
- **Model Call Optimization**: Optimized model calling
- **Workflow Installation**: Optimized compression format compatibility issues during workflow installation
- **JSON File Compatibility**: Optimized compatibility issues caused by JSON file modifications

### v0.3.1 (October 12, 2025)

#### Bug Fixes
- **Model Call Fix**: Fixed abnormal issues that could occur during model calls
- **Tool Call Fix**: Fixed abnormal issues that could occur during tool calls

### v0.3.0 (October 11, 2025)

#### New Features
- **Workflow**: We have added a major new feature in this version - Workflow. You can refer to the [Workflow](./examples/workflow.md) introduction for usage, or directly check the open platform for direct use
- Fixed Shell output information errors and Chinese character encoding issues
- Other related experience optimizations

### v0.2.36 (October 9, 2025)

#### Feature Improvements
- **Fixed Multi Edit tool call failure issue**
- **Resolved Shell command path space issue**
- **Fixed VS Code plugin issues**
- **Improved script execution success rate in Windows environment**
- **Enhanced API call stability**

### v0.2.33 (September 30, 2025)

#### Feature Improvements
- **Flash Screen Issue Fix**: Mitigated screen flashing issues
- **ACP Protocol**: Fixed ACP protocol related issues

### v0.2.32 (September 29, 2025)

#### Feature Improvements
- **Model Support**: Added support for DeepSeek v3.2 model, /model switching, and full release of Qwen3 Coder, Qwen3 Max, and Qwen3 VL models
- **Experience Optimization**: Improved user experience and reduced screen flashing issues
- **Bug Fix**: Fixed XML escaping issues

### v0.2.31 (September 28, 2025)

#### Feature Improvements
- **Screen Flash Fix**: Optimized message rendering during execution, significantly reducing screen flashing issues
- **iFlow SDK**: Enhanced ACP protocol and SDK functionality
- **Windows Experience**: Improved multiple Windows-specific issues including text pasting, image pasting, and task execution
- **/resume Command**: Added /resume command to slash commands for recovering historical conversations
- **Conversation Recovery**: Fixed errors that could occur when resuming conversations from history
- **IDE Plugin**: Enhanced IDE plugin user experience
- **Overall Experience**: Various feature optimizations to improve overall usability

### v0.2.30 (September 24, 2025)

#### Feature Improvements
- **Hook Support**: Added four additional hook types - see [hooks](./examples/hooks.md) for details
- **Agent Enhancement**: Enhanced subagent support with improved tool usage capabilities - see [subagent](./examples/subagent.md) for details
- **Model Thinking**: Added model thinking support - see [thinking](./features/thinking.md) for details

### v0.2.29 (September 23, 2025)

#### Feature Improvements
- **Model Fix**: Resolved DeepSeek V3.1 Terminus model access errors
- **Output Style**: Integrated output style functionality - see [Output Style](./features/output-style.md) for details

### v0.2.28 (September 23, 2025)

#### Feature Improvements
- **Model Support**: Added support for DeepSeek V3.1 Terminus model

### v0.2.27 (September 22, 2025)

#### Feature Improvements
- **Bug Fix**: Fixed abnormal exit issues caused by Chinese character handling

### v0.2.26 (September 21, 2025)

#### Feature Improvements
- **Localization**: Added localization support with automatic terminal language detection. Use /language to switch between Chinese and English
- **Loop Detection**: Enhanced loop detection with more user-friendly process control
- **Chinese Support**: Improved Chinese input and output handling

### v0.2.25 (September 18, 2025)

#### Feature Improvements
- **iFlow SDK**: Added iFlow SDK support - see [SDK](sdk/sdk-python.md) for details
- **Input Box**: Removed left and right borders from input box to improve copying experience

### v0.2.24 (September 17, 2025)

#### Feature Improvements
- **Paste Operations**: Fixed multi-line text and image pasting issues on Windows
- **Input Box**: Improved special character handling and added Shift+Enter for line breaks

### v0.2.23 (September 16, 2025)

#### Feature Improvements
- **ACP Protocol**: Added Zed ACP protocol support for iFlow CLI integration in Zed editor
- **History Storage**: Fixed multimodal information storage in conversation history
- **Response Style**: Added constructive follow-up questions to responses
- **Plugin Conflicts**: Resolved conflicts between VSCode plugin and CLI
- **User Experience**: Various optimizations to enhance overall usability


### v0.2.22 (September 15, 2025)

#### Feature Improvements
- **Exit Handling**: Improved compatibility with abnormal exit errors
- **Session Resume**: Fixed context errors after using -c and -r options
- **Configuration**: Added more configuration options (e.g., skip task completion detection) - see [CLI Configuration](./configuration/settings.md)
- **User Experience**: Various optimizations to enhance overall usability

### v0.2.21 (September 12, 2025)

#### Feature Improvements
- **Plugin Fix**: Resolved JetBrains plugin connection issues

### v0.2.20 (September 11, 2025)

#### Feature Improvements
- **Login Experience**: Enhanced login workflow and user experience
- **User Experience**: Various optimizations to enhance overall usability

### v0.2.18 (September 10, 2025)

#### Feature Improvements
- **System Prompts**: Upgraded system prompts for improved problem-solving capabilities
- **VSCode Plugin**: Enhanced VSCode plugin for better overall user experience
- **User Experience**: Various optimizations to enhance overall usability

### v0.2.17 (September 9, 2025)

#### Feature Improvements
- **Authentication**: Upgraded to iFlow web authorization, replacing API Key login
- **Compression**: Enhanced context compression algorithm
- **User Experience**: Various optimizations to improve overall user experience

### v0.2.16 (September 8, 2025)

#### Feature Improvements
- **Installation**: Improved installation package experience

### v0.2.15 (September 7, 2025)

#### Feature Improvements
- **VSCode Plugin**: Updated VSCode plugin

### v0.2.13 (September 6, 2025)

#### Feature Improvements
- **Model Support**: Added support for Kimi K2 0905 and Qwen3-max models

### v0.2.12 (September 5, 2025)

#### Feature Improvements
- **Configuration**: Added personalized settings like tokensLimit and compressionTokenThreshold - see [CLI Configuration](./configuration/settings.md)
- **Fuzzy Search**: Added fuzzy search support for slash commands
- **Keyboard Shortcuts**: Added Alt + M shortcut to switch run modes
- **Bug Fixes**: Resolved memory overflow and crash issues
- **User Experience**: Various optimizations to improve overall user experience

### v0.2.11 (September 3, 2025)

#### Feature Improvements
- **User Experience**: Various optimizations to improve overall user experience

### v0.2.10 (September 2, 2025)

#### Feature Improvements
- **Bug Fix**: Fixed issue where input problems were not being displayed

### v0.2.9 (September 2, 2025)

#### Feature Improvements
- **Screen Flash**: Fixed screen flashing issues during subagent execution
- **File Writing**: Resolved write file error issues
- **VSCode Plugin**: Fixed Windows issue where reopening iFlow opened multiple VSCode instances
- **User Experience**: Various optimizations to improve overall user experience

### v0.2.8 (September 1, 2025)

#### Feature Improvements
- **Hooks**: Added Hooks functionality - see Tutorials/Hooks documentation for usage
- **Agent Creation**: Added guided subagent creation through CLI using /agents install with interactive prompts
- **Compression**: Enhanced compression logic with file recovery capability
- **SubAgent Display**: Added Ctrl+R support to expand SubAgent execution details
- **MCP**: Improved MCP-related user experience
- **User Experience**: Various optimizations to improve overall user experience

### v0.2.7 (August 28, 2025)

#### Feature Improvements
- **Screen Flash**: Mitigated interface screen flashing issues to improve user experience
- **MCP Commands**: Fixed issue where mcp add command would overwrite root directory configuration files
- **Document Support**: Added support for reading DOC, Excel, and PDF files
- **Compression**: Enhanced compression logic for better effectiveness and performance
- **User Experience**: Various optimizations to improve overall user experience

### v0.2.6 (August 26, 2025)

#### Feature Improvements
- **Commands**: Optimized `/compress` command for better compression efficiency and user experience
- **Markdown Support**: Added markdown format support for sub-commands with richer documentation and help information
- **MCP Client**: Upgraded MCP Client with optimized calling methods and improved user experience
- **Initialization**: Enhanced `/init` command - no longer reads .iflow folder content by default, updates existing IFLOW.md

### v0.2.5 (August 25, 2025)

#### New Features
- **DeepSeek V3.1**: Added complete support for DeepSeek V3.1 model with enhanced reasoning and code generation capabilities
- **Interactive Demo**: Added `/demo` command with interactive experience modes including deep-research and brainstorming

### v0.2.0 (August 21, 2025)

#### New Features
- **Marketplace**: Quick installation of MCP, Subagent, and Command components from marketplace (all security certified)
- **IDE Integration**: VS Code and JetBrains support (automatically installed)
- **Run Modes**: 4 run modes available - yolo, accepting edits, plan mode, and default
- **Task Tool**: Enhanced task tool with Sub Agent parallel execution and context compression for deeper task completion
- **Multimodal**: Support for multimodal features including handwritten note recognition and code generation
- **Conversation Management**: Save, resume, and rollback conversation history (`iflow --resume`, `--continue`, `/chat` commands)
- **Terminal Commands**: Enhanced terminal commands (use `iflow -h` to view available commands)
- **Background Mode**: Background suspension support (Ctrl+D)
- **Auto-upgrade**: Automatic updates ensure access to latest features
- **Claude Code Compatibility**: Full compatibility with Claude Code features, zero switching cost

### v0.1.7 (August 18, 2025)

#### New Features
- **Agents & Commands**: Added subagent and command functionality
- **VS Code Plugin**: Built-in VS Code plugin support (no marketplace download needed)
- **MCP Marketplace**: Browse MCP tools via `/mcp online` (all security certified)
- **Component Markets**: Browse agents via `/agents online` and commands via `/commands online`
- **Model Switching**: Quick model switching with `/model` command
- **Conversation Management**: Continue with `iflow --continue`, resume with `iflow --resume`
- **Multimodal**: Image paste and understanding support
- **Performance**: Optimized overall user experience

### v0.1.0 (August 1, 2025)

#### Initial Release
- **Free AI Models**: Through iFlow open platform with internally deployed models, perfectly adapted for Kimi-K2 and Qwen3 Coder models for C3 code development
- **Flexible Integration**: Full OpenAI protocol support for switching to more powerful models like Claude and ChatGPT
- **Out-of-the-box**: Pre-configured MCP servers ready to use
- **Intuitive Experience**: Superior to Gemini CLI, comparable to Claude Code experience

## Feedback and Support

Having issues or feature suggestions?

- **GitHub Issues**: [Submit Issue](https://github.com/iflow-ai/iflow-cli/issues)

---

**Update Notice**: This changelog follows [Semantic Versioning](https://semver.org/) specifications. Major updates will be announced in advance through community channels.