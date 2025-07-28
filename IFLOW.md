# IFLOW.md

This file provides guidance to iFlow Cli when working with code in this repository.

## Project Overview

This repository contains the iFlow CLI, a comprehensive command-line intelligent tool that embeds into your terminal, can analyze your code repository, execute coding tasks, understand your needs across contexts, and improve efficiency by performing various tasks from simple file operations to complex workflow automation.

## Key Features

1. Supports multiple AI models including Kimi K2, Qwen3 Coder, DeepSeek v3, etc.
2. Compatible with OpenAI protocol model providers
3. Integrates with Model Context Protocol (MCP) servers for extended functionality
4. Provides slash commands for meta-level control over the CLI itself

## Repository Structure

- `install.sh` - Installation script for iFlow CLI
- `README*.md` - Documentation in multiple languages
- `assets/` - Images and screenshots
- `i18/` - Internationalized command documentation
- `.git/` - Git repository metadata

## Development Commands

### Installation
```bash
bash -c "$(curl -fsSL https://cloud.iflow.cn/iflow-cli/install.sh)"
```

### Initialization
For a new project or when first using iFlow CLI in an existing project:
```
iflow
> /init
```

This command will scan your codebase and create/update the IFLOW.md file with project-specific documentation.

## Key Slash Commands

- `/init` - Initialize iFlow CLI with project understanding
- `/memory` - Manage AI's instruction context
- `/tools` - Display available tools
- `/clear` - Clear terminal screen and session history
- `/copy` - Copy last output to clipboard
- `/stats` - Display session statistics
- `/compress` - Replace chat context with summary
- `/chat` - Save and restore conversation history
- `/help` - Display help information
- `/quit` - Exit iFlow CLI
- `/bug` - Submit issue feedback
- `/editor` - Select code editor
- `/mcp` - List MCP servers and tools
- `/theme` - Change visual theme
- `/auth` - Change authentication method
- `/about` - Display version information
- `/extensions` - List active extensions

## At Commands (@)

Include file or directory content in prompts:
- `@<path_to_file_or_directory>` - Inject content into your prompt

## Shell Mode (!)

Execute system shell commands directly:
- `!<shell_command>` - Execute shell command
- `!` - Toggle shell mode

## Architecture Overview

The iFlow CLI is built as a Node.js application that integrates with multiple AI models and MCP servers. The installation script handles:

1. Installing Node.js via nvm if not present
2. Setting up npm global directory
3. Installing the iFlow CLI package
4. Configuring MCP servers in `~/.iflow/settings.json`

The CLI supports multiple languages through the i18 directory structure and provides extensive customization through its various commands and configuration options.

## MCP Servers Configuration

The iFlow CLI integrates with several MCP servers that extend its functionality:

1. sequential-thinking - For complex problem-solving
2. context7 - For library documentation retrieval
3. magic - For UI component generation
4. playwright - For browser automation

These servers are configured in `~/.iflow/settings.json` and can be listed with the `/mcp` command.