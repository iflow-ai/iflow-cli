# iFlow CLI Command Usage Guide

iFlow CLI provides three types of commands to meet different usage requirements:
- **Slash Commands (`/`)**: Control CLI functionality and settings
- **At Commands (`@`)**: Reference file or directory content
- **Shell Commands (`!`)**: Execute system commands

## Slash Commands (`/`) - CLI Control Commands

Slash commands are used to manage and control various functions of iFlow CLI.

### Project Initialization & Memory Management

**`/init`** - Project Initialization
- **Purpose**: Allows AI to understand your project structure and code on first use
- **Result**: Generates IFLOW.md file to store project information
- **Description**: IFLOW.md serves as the project's "memory file," containing project structure, coding standards, usage constraints, and other information that is automatically loaded in each conversation

**`/memory`** - Memory Management
- **Purpose**: Manage AI's project memory content
- **Subcommands**:
  - `add <text>` - Add new memory content
  - `show` - View current memory content
  - `refresh` - Reload IFLOW.md file

### Tools & Help

**`/tools`** - View Available Tools
- **Default**: Display tool list
- **`desc`**: Show detailed tool descriptions

**`/help`** or **`/?`** - Display help information

**`/about`** - View version information

### Session Management

**`/clear`** - Clear screen and conversation history

**`/compress`** - Compress conversation history
- **Purpose**: Compress long conversations into summaries to save resources for subsequent conversations

**`/chat`** - Conversation State Management
- **Subcommands**:
  - `save <label>` - Save current conversation state
  - `resume <label>` - Resume specified conversation state
  - `list` - View saved conversation states

**`/stats`** - View session statistics (token usage, cache savings, session duration, etc.)

### Utility Functions

**`/copy`** - Copy last output to clipboard

**`/editor`** - Select code editor

**`/theme`** - Change interface theme

**`/auth`** - Change authentication method

### Extensions

**`/mcp`** - Model Context Protocol Server Management
- **Subcommands**:
  - `desc` - Show detailed description
  - `nodesc` - Hide tool descriptions
  - `schema` - Show complete configuration parameters
- **Shortcut**: Ctrl+T to toggle tool description display

**`/extensions`** - View active extensions list

### Issue Reporting

**`/bug`** - Submit issue feedback
- **Usage**: `/bug issue description` creates a GitHub issue

### Exit

**`/quit`** or **`/exit`** - Exit CLI

## At Commands (`@`) - File Reference Commands

At commands allow you to directly reference file or directory content in conversations.

**`@<file or directory path>`**
- **Purpose**: Include content from specified files or directories in the current conversation
- **Use Cases**:
  - Ask questions about specific code files
  - Analyze document content
  - Batch process files in directories

**Usage Examples**:
```
@src/main.py What's wrong with this file?
@docs/ Summarize all documents in this directory
Explain this configuration file @config.json
```

**Processing Rules**:
- Single file: Directly read file content
- Directory: Read content from all files in the directory and subdirectories

## Shell Commands (`!`) - System Command Execution

Shell commands allow you to execute system commands directly within iFlow CLI.

**`!<system command>`** - Execute Single Command
- **Purpose**: Execute system command, display results, then return to CLI
- **Examples**:
  ```
  !ls -la          # View file list
  !git status      # Check Git status
  !npm install     # Install dependencies
  ```

**`!`** - Toggle Shell Mode
- **Purpose**: Enter/exit Shell mode
- **Shell Mode Features**:
  - Interface display changes (different color theme)
  - Input system commands directly without `!` prefix
  - Enter `!` again to exit Shell mode

**Important Notes**:
- Shell commands have the same permissions as running directly in terminal
- Use caution with commands that may affect the system

---

By properly using these three command types, you can efficiently utilize iFlow CLI for project development and management. New users are recommended to start with `/init` to initialize the project, then use other commands as needed.