---
title: Sub Command
description: Extend iFlow CLI functionality, install and manage custom commands from the marketplace
sidebar_position: 6
---

# Sub Command

> **Feature Overview**: Sub Command is iFlow CLI's command extension system, allowing you to install and manage specialized slash commands from the online marketplace.  
> **Learning Time**: 10-15 minutes  
> **Prerequisites**: iFlow CLI installed, authentication completed, understanding of basic slash command usage

## What is Sub Command

Sub Command is the command marketplace system in iFlow CLI, allowing you to install specialized slash commands from the online marketplace to extend CLI functionality. Similar to an app store, you can browse, install, and manage various feature-rich custom commands.

## Core Features

| Feature | Description | Advantage |
|---------|-------------|-----------|
| Marketplace Distribution | Get verified commands from online marketplace | Rich feature selection |
| Plug-and-Play | Immediately usable after installation, no additional configuration | Simplified usage flow |
| Scope Management | Support project-level and global-level command installation | Flexible permission control |
| Version Tracking | Each command has clear version information | Ensures functionality stability |
| Community-Driven | Supports community contributions and third-party development | Continuous feature expansion |

## How It Works

### Command Marketplace Architecture

```
Online Marketplace → Local Installation → CLI Integration → Slash Commands
    ↓               ↓                ↓              ↓
[Command Library] → [TOML Config] → [Command Parsing] → [Function Execution]
```

### Scope Hierarchy

- **Global Scope**: Installed to `~/.iflow/commands/`, available to all projects
- **Project Scope**: Installed to `{project}/.iflow/commands/`, only available to current project
- **Priority Rules**: Project-level commands take precedence over global-level commands

## Command Marketplace Management

### Installing Commands from Open Marketplace

* Visit [Command Open Marketplace](https://platform.iflow.cn/agents)


* Select search type as **Commands**
* Choose your desired command
* Click install button and copy the corresponding command
* Install in your terminal
### Browse Online Marketplace in CLI

| Command                           | Function | Description |
|-----------------------------------|----------|-------------|
| `/commands online`           | Enter interactive marketplace | Browse, search, and install commands |
| `/commands get <name or id>` | View command details | Get detailed information about specific commands |

#### Marketplace Navigation Operations

**Interactive Browsing Shortcuts**

| Operation | Shortcut | Description |
|-----------|----------|-------------|
| Browse down | `j` or `↓` | Move to next command |
| Browse up | `k` or `↑` | Move to previous command |
| View details | `l` or `Enter` | View detailed command information |
| Install command | `i` | Install currently selected command |
| Search filter | `/` | Search by name or category |
| Exit browse | `q` | Exit marketplace browse mode |
| Refresh list | `r` | Reload command list |

```bash
# Enter interactive command marketplace
/commands online

# Operation examples during browsing
# 1. Use j/k or arrow keys to browse command list
# 2. Press Enter to view details of interesting commands
# 3. Press i key to directly install commands
# 4. Press / key to search for commands with specific functionality
```

### View Command Details

```bash
# View detailed information about a specific command
/commands get 123

# Example output:
# 📋 Command Details
# 
# 🆔 ID: 123
# 📝 Name: code-reviewer
# 📄 Description: Professional code review tool supporting multi-language code quality detection
# 📁 Category: Development
# 🤖 Model: claude-3-5-sonnet-20241022
# 🏷️  Tags: code-review, quality, best-practices
# 👤 Author: iflow-community
# 📊 Version: 2
# 👁️  Visibility: public
# 📋 Status: published
# 
# 📖 Detail Context:
# This is a professional code review assistant that can:
# - Detect code quality issues
# - Provide best practice suggestions
# - Support multiple programming languages
# - Generate detailed review reports
# 
# 💡 To add this command to your CLI, use: /commands add 123
```

### Command Installation Guide

```bash
# Basic syntax
iflow commands add <name or id> [--scope project|global]

# Install to project (default)
iflow commands add 123
iflow commands add 123 --scope project

# Install to global
iflow commands add commit --scope global

# Actual examples
iflow commands add 456 --scope project   # Code review tool
iflow commands add docs --scope global    # General documentation generation tool

# View more details
iflow commands -h
```

### View Installed Commands

```bash
# List all installed commands
/commands list
/commands show      # Alias
/commands local     # Alias

# Example output:
# Installed commands:
# 
# 🌍 Global Commands (2):
#   /code-reviewer - Professional code review tool supporting multi-language code quality detection
#   📁 /Users/username/.iflow/commands/code-reviewer.toml
# 
#   /doc-generator - Automatic documentation generation tool
#   📁 /Users/username/.iflow/commands/doc-generator.toml
# 
# 📂 Project Commands (1):
#   /project-analyzer - Project structure analysis tool
#   📁 /path/to/project/.iflow/commands/project-analyzer.toml
# 
# 💡 Tips:
#   • Use /commands online to browse online marketplace
#   • Use /commands add <id> to install new commands
#   • Use /commands remove <name> to remove commands
#   • Use /commands get <id> to view command details
```

### Remove Commands

```bash
# Remove project-level command (default)
/commands remove <command-name>
/commands remove code-reviewer

# Remove global command
/commands remove code-reviewer --scope global

# Alias commands
/commands rm <command-name>
/commands delete <command-name>

# Successful removal example:
# ✅ Successfully removed command 'code-reviewer' from project scope
# Location: /path/to/project/.iflow/commands/code-reviewer.toml
# 
# ⚠️  Please restart the CLI to see changes take effect.
```

## Command Categories and Recommendations

### Development Tools

| Command Name | ID | Function Description | Use Cases |
|--------------|----|--------------------|-----------|
| **refactor** | 79 | Refactor code while maintaining functionality and improving structure, readability, and maintainability | Code optimization and structural adjustments |
| **implement** | 80 | Intelligently implement features perfectly adapted to project architecture | New feature development |
| **test** | 81 | Intelligently run tests based on current context and help fix failures | Test automation |
| **scaffold** | 94 | Generate complete feature from schema | Rapid prototyping |
| **fix-imports** | 87 | Fix broken imports after refactoring | Post-refactoring maintenance |
| **fix-todos** | 88 | Intelligently implement TODO fixes | Task management |
| **format** | 89 | Auto-detect and apply project formatter | Code formatting |

### Code Quality

| Command Name | ID | Function Description | Use Cases |
|--------------|----|--------------------|-----------|
| **review** | 93 | Multi-agent analysis (security, performance, quality, architecture) | Code review |
| **make-it-pretty** | 90 | Improve readability without changing functionality | Code beautification |
| **remove-comments** | 92 | Clean obvious comments, preserve valuable documentation | Code cleanup |
| **predict-issues** | 91 | Proactive issue detection with timeline estimates | Risk prediction |

### Documentation Tools

| Command Name | ID | Function Description | Use Cases |
|--------------|----|--------------------|-----------|
| **docs** | 84 | Intelligent documentation management and updates | Project documentation maintenance |
| **contributing** | 82 | Complete analysis of project contribution readiness | Open source projects |
| **explain-like-senior** | 85 | Senior-level code explanation and context analysis | Code learning |

### Security Analysis

| Command Name | ID | Function Description | Use Cases |
|--------------|----|--------------------|-----------|
| **security-scan** | 95 | Extended thinking vulnerability analysis and fix tracking | Security checks |

### Utility Tools

| Command Name | ID | Function Description | Use Cases |
|--------------|----|--------------------|-----------|
| **commit** | 78 | Analyze changes and create meaningful commit messages | Git workflow |
| **cleanproject** | 77 | Clean development artifacts while preserving working code | Project maintenance |
| **create-todos** | 83 | Add contextual TODO comments based on analysis | Task management |
| **find-todos** | 86 | Locate and organize development tasks | Task tracking |
| **session-end** | 96 | Summarize and save session context | Session management |

## Command Configuration Files

### TOML File Structure

Installed commands generate local TOML configuration files:

```toml
# Command: code-reviewer
# Description: Professional code review tool supporting multi-language code quality detection
# Category: Development
# Version: 2
# Author: iflow-community

description = "Professional code review tool supporting multi-language code quality detection"

prompt = """
You are a professional code review expert. Please analyze the code provided by the user and evaluate from the following aspects:

1. Code quality and readability
2. Security issue detection
3. Performance optimization suggestions
4. Best practice compliance
5. Potential bugs or logical errors

Please provide specific improvement suggestions and example code.
"""
```

### Markdown File Structure

In addition to TOML format, iFlow CLI also supports Markdown format configuration files.

```bash
# Create command directory
mkdir -p ~/.iflow/commands

# Create Markdown format command file
echo "Review this code for security vulnerabilities:" > ~/.iflow/commands/security-review.md
```

You can also add descriptions, for example:
```markdown
---
description: Create a git commit
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

## Your task

Based on the above changes, create a single git commit.
```

### Configuration File Locations

| Scope | Configuration Path | Description |
|-------|-------------------|-------------|
| Global | `~/.iflow/commands/` | Accessible to all projects |
| Project | `{project}/.iflow/commands/` | Only accessible to current project |

## Troubleshooting

### Common Issues and Solutions

| Issue | Possible Cause | Solution |
|-------|----------------|----------|
| Command installation failure | API key not set or expired | Re-authenticate |
| Command unavailable | CLI not restarted to load new configuration | Restart iFlow CLI |
| Permission error | Insufficient directory permissions | Check file system permissions |
| Network connection failure | Cannot access command marketplace API | Check network connection and firewall settings |
| Command conflict | Same-named commands in different scopes | Use --scope to specify explicitly |

### Diagnostic Steps

1. **Connection Check**
   ```bash
   # Test API connection
   /commands online
   
   # Check authentication status
   /auth status
   ```

2. **Configuration Verification**
   ```bash
   # View local command list
   /commands list
   
   # Check configuration file
   cat ~/.iflow/commands/command-name.toml
   ```

3. **Permission Verification**
   ```bash
   # Check directory permissions
   ls -la ~/.iflow/commands/
   ls -la ./.iflow/commands/
   ```

4. **Log Check**
   ```bash
   # View detailed logs
   /log
   
   # View error information
   /debug
   ```

### Cleanup and Reset

```bash
# Clean project-level commands
rm -rf ./.iflow/commands/

# Clean global commands (use with caution)
rm -rf ~/.iflow/commands/

# Reinitialize command configuration
iflow commands init
```

## Security Considerations

### Security Recommendations for Third-party Commands

**Verify Command Sources**:
- ⚠️ Only install commands from trusted authors
- ⚠️ Check command ratings and community feedback
- ⚠️ Avoid installing commands with overly broad permissions

**Command Permission Control**:
- ✅ Prefer project scope installation
- ✅ Regularly audit installed commands
- ✅ Keep commands updated to latest versions
- ✅ Remove unused commands

## Developing Custom Commands

### Complete TOML Configuration Specification

#### Basic Configuration Structure

```toml
# Command description (required)
description = "Brief command description"

# Command prompt (required)
prompt = """
Complete prompt content sent to AI model
Supports multi-line text and special placeholders
"""
```

#### Advanced Feature Specifications

##### 1. Parameter Injection Mechanism

**Shortcut Parameter Injection**: Use `{{args}}` placeholder

```toml
description = "Code review tool"

prompt = """
Please review the following code and provide improvement suggestions:

{{args}}

Focus on: code quality, security, performance optimization.
"""
```

**Default Parameter Handling**: If not using `{{args}}`, system automatically appends user input to prompt

```toml
description = "Documentation generator"

prompt = """
Generate professional documentation based on provided content.
"""
# User input "/docs User Manual" becomes:
# "Generate professional documentation based on provided content.\n\n/docs User Manual"
```

##### 2. Shell Command Integration

Use `!{command}` syntax to execute Shell commands in prompts:

```toml
description = "Project analysis tool"

prompt = """
Current project information:

File structure:
!{find . -name "*.js" -o -name "*.ts" | head -20}

Git status:
!{git status --porcelain}

Please analyze project status and provide suggestions.
"""
```

**Security Mechanisms**:
- Shell commands require security checks
- Support global and session-level command whitelists
- Dangerous commands require user confirmation

##### 3. Prompt Processor Chain

System uses processor chain pattern to handle TOML configuration:

| Processor | Trigger Condition | Function |
|-----------|-------------------|----------|
| **ShellProcessor** | Contains `!{...}` | Execute Shell commands and replace output |
| **ShorthandArgumentProcessor** | Contains `{{args}}` | Replace argument placeholders |
| **DefaultArgumentProcessor** | Default | Append user input to prompt |

### Development Environment Setup

#### Directory Structure Management

```bash
# Global command directory
~/.iflow/commands/
├── my-command.toml
├── code-reviewer.toml
└── project-analyzer.toml

# Project command directory
/path/to/project/.iflow/commands/
├── deploy.toml
├── test-runner.toml
└── build-helper.toml
```

#### Path Resolution Rules

System uses the following functions to get command directories:

```typescript
// Global command directory
getUserCommandsDir(): string {
  return path.join(os.homedir(), '.iflow', 'commands');
}

// Project command directory
getProjectCommandsDir(projectRoot: string): string {
  return path.join(projectRoot, '.iflow', 'commands');
}
```

#### File Naming Conventions

- **Basic Naming**: `command-name.toml`
- **Hierarchical Naming**: `parent:child.toml` → Creates nested command structure
- **Filename Cleanup**: Non-alphanumeric characters converted to hyphens
- **Extended Namespace**: Extended commands automatically get `[extensionName]` prefix

### Practical Development Examples

#### Example 1: Simple Information Query Command

```toml
# ~/.iflow/commands/system-info.toml
description = "Display system information summary"

prompt = """
Please perform the following system checks and provide a summary:

Operating System: !{uname -a}
Disk Usage: !{df -h /}
Memory Usage: !{free -h}
Current Directory: !{pwd}

Please analyze system status and provide suggestions.
"""
```

Usage: `/system-info`

#### Example 2: Parameterized Code Generator

```toml
# ./iflow/commands/generate-component.toml  
description = "React component generator"

prompt = """
Please generate a React component with the following requirements:

{{args}}

Please include:
1. TypeScript interface definitions
2. Complete component implementation
3. Basic CSS styles
4. Usage examples

Follow best practices and modern React patterns.
"""
```

Usage: `/generate-component User login form component`

#### Example 3: Complex Project Management Tool

```toml
# ./.iflow/commands/project:status.toml
description = "Comprehensive project status analysis"

prompt = """
Comprehensive project status report:

## Repository Status
Git branch: !{git branch --show-current}
Uncommitted changes: !{git status --porcelain | wc -l}
Recent commits: !{git log --oneline -5}

## Dependency Status  
Package.json exists: !{test -f package.json && echo "✅ Exists" || echo "❌ Not found"}
Node modules status: !{test -d node_modules && echo "✅ Installed" || echo "❌ Not installed"}

## Code Quality
TypeScript files: !{find . -name "*.ts" -o -name "*.tsx" | wc -l}
JavaScript files: !{find . -name "*.js" -o -name "*.jsx" | wc -l}
Test files: !{find . -name "*.test.*" -o -name "*.spec.*" | wc -l}

Please analyze project health and provide improvement suggestions.
"""
```

Usage: `/project:status`

#### Example 4: Dynamic Script Executor

```toml
# ~/.iflow/commands/run-with-context.toml
description = "Execute commands in project context"

prompt = """
Execute specified operations in current project environment:

Project root directory: !{pwd}
Operation content: {{args}}

Execution result:
!{{{args}}}

Please analyze execution results and provide follow-up suggestions.
"""
```

Usage: `/run-with-context npm test`

### Debugging and Testing Guide

#### Configuration Validation

System uses Zod for TOML configuration validation:

```typescript
const TomlCommandDefSchema = z.object({
  prompt: z.string({
    required_error: "The 'prompt' field is required.",
    invalid_type_error: "The 'prompt' field must be a string.",
  }),
  description: z.string().optional(),
});
```

#### Common Errors and Solutions

| Error Type | Cause | Solution |
|------------|-------|----------|
| `TOML parsing error` | Incorrect syntax | Check quotes, indentation, and escape characters |
| `Schema validation failure` | Missing required fields | Ensure `prompt` field is included |
| `Shell command blocked` | Security policy restrictions | Add to command whitelist or modify security config |
| `Command not showing` | Incorrect file location | Check file path and restart CLI |

#### Development Workflow

1. **Create TOML file**
   ```bash
   mkdir -p ./.iflow/commands
   touch ./.iflow/commands/my-command.toml
   ```

2. **Write configuration content**
   ```toml
   description = "Test command"
   prompt = "This is a test command"
   ```

3. **Restart CLI to load new command**
   ```bash
   # Exit current session
   /quit
   # Restart
   iflow
   ```

4. **Test command functionality**
   ```bash
   /my-command Test parameters
   ```

5. **View debugging information**
   ```bash
   /log  # View system logs
   /debug # Enable debug mode
   ```