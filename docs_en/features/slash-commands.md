---
sidebar_position: 2
hide_title: true
---

# Slash commands

> **Feature Overview**: Slash commands are iFlow CLI's built-in control system, providing quick access to various functions and settings.
> 
> **Learning Time**: 15-20 minutes
> 
> **Prerequisites**: iFlow CLI installed and running, familiarity with basic command line operations

## What are Slash Commands

Slash commands are special instructions starting with `/` used to control iFlow CLI's behavior and configuration. These commands can be used anytime during conversations without interrupting the current workflow. Through slash commands, you can manage session state, configure system settings, access tools, and get help information.

## Core Features

| Feature | Description | Advantage |
|---------|-------------|-----------|
| Instant Execution | Commands take effect immediately without restart | Improves work efficiency |
| Context Preservation | Doesn't interrupt current conversation flow | Maintains work continuity |
| Tab Completion | Supports command and parameter auto-completion | Reduces input errors |
| Colored Output | Status information uses color coding | Improves readability |
| Subcommand Structure | Complex commands support hierarchical structure | Clear functional organization |

## How It Works

### Command Execution Flow

```
User Input → Command Parsing → Parameter Validation → Function Execution → Result Feedback
    ↓
[/command args] → [Parser] → [Validator] → [Executor] → [Output]
```

### Command Classification System

- **System Management**: System information, configuration management, status monitoring
- **Session Control**: Conversation management, history records, state saving
- **Tool Integration**: IDE connection, MCP servers, extension management
- **Development Support**: Project initialization, debugging support, error reporting

## Detailed Feature Description

### System Management Commands

| Command | Function | Description |
|---------|----------|-------------|
| `/about` | System information | Shows CLI version, operating system, model version and other comprehensive information |
| `/auth` | Authentication | Configure or change authentication providers |
| `/theme` | Theme settings | Customize CLI appearance theme |
| `/model` | Model switching | Change the AI model being used |
| `/editor` | Editor configuration | Configure preferred external editor |
| `/privacy` | Privacy information | Show privacy notices and data processing information |

### Session Control Commands

| Command | Function | Description |
|---------|----------|-------------|
| `/chat` | Conversation management | Save, restore, delete conversation checkpoints |
| `/clear` | Clear and reset | Clear screen and reset conversation history |
| `/compress` | Content compression | Use AI to compress conversation history into summary |
| `/memory` | Content management | Interact with CLI's content system |
| `/restore` | State recovery | Restore to previous checkpoint state |
| `/quit` | Exit program | Exit CLI session and show statistics |

### Tool Integration Commands

| Command | Function | Description |
|---------|----------|-------------|
| `/ide` | IDE integration | Discover and connect to available IDE servers |
| `/ide-status` | IDE status | Query current IDE connection status |
| `/ide-tool` | IDE tools | Access specific IDE integration tools |
| `/mcp` | MCP management | Manage MCP servers, tools and authentication |
| `/tools` | Tool list | List all available built-in CLI tools |
| `/extensions` | Extension management | Show currently active extensions and versions |

### Development Support Commands

| Command | Function | Description |
|---------|----------|-------------|
| `/init` | Project initialization | Analyze project and create customized configuration files |
| `/setup-github` | GitHub configuration | Configure GitHub Actions workflows |
| `/directory` | Directory management | Manage workspace directories for project context |
| `/export` | Export function | Export conversation history in various formats |
| `/copy` | Copy function | Copy last AI response to clipboard |

### Monitoring and Debugging Commands

| Command | Function | Description |
|---------|----------|-------------|
| `/stats` | Statistics | Monitor session usage and performance statistics |
| `/log` | Log location | Show current session log storage location |
| `/bug` | Error reporting | Submit error report with system information |
| `/help` | Help information | Open comprehensive help dialog |
| `/docs` | Documentation access | Open complete documentation in browser |

### Special Feature Commands

| Command | Function | Description |
|---------|----------|-------------|
| `/vim` | Vim mode | Toggle vim-style key bindings |
| `/corgi` | Special theme | Toggle Corgi theme UI mode (easter egg) |
| `/commands` | Command marketplace | Manage and install custom commands |
| `/agents` | Agent management | Manage personal, project and built-in agents |

### Common Usage Scenarios

#### System Configuration
```bash
/about                      # View system information
/auth                       # Configure authentication
/model                      # Switch AI model
/theme                      # Change theme
```

#### Session Management
```bash
/chat save project-review   # Save conversation checkpoint
/memory add "Project uses React" # Add memory information
/compress                   # Compress conversation history
/clear                      # Clear session
```

#### Development Support
```bash
/init                       # Initialize project configuration
/ide                        # Connect IDE
/mcp list                   # View available tools
/export clipboard           # Export conversation to clipboard
```

#### Debugging Support
```bash
/stats                      # View usage statistics
/log                        # View log location
/bug "Describe issue"       # Submit error report
/help                       # Get help
```

## Command Features

### Smart Completion
| Feature | Description | Example |
|---------|-------------|---------|
| Tab completion | Auto-complete commands and parameters | `/chat` + Tab |
| Parameter hints | Show available parameter options | `/mcp auth` + Tab |
| History | Remember commonly used commands | Up/down arrows to browse |

### Visual Feedback
| Color | Meaning | Purpose |
|-------|---------|---------|
| Green | Success/Active | Command executed successfully |
| Red | Error/Failure | Error message display |
| Yellow | Warning/Pending | Information requiring attention |
| Blue | Information/Description | General information display |

### Error Handling Mechanism
- **Parameter Validation**: Automatically validates command parameter validity
- **Dependency Check**: Checks if required dependencies are available
- **Network Handling**: Provides retry suggestions when network errors occur
- **Help Prompts**: Automatically shows usage help when errors occur

## Troubleshooting

### Common Issues and Solutions

| Issue | Possible Cause | Solution |
|-------|---------------|----------|
| Command not recognized | Spelling error or command doesn't exist | Check spelling, use `/help` to view available commands |
| Invalid parameters | Incorrect parameter format | View command help information, use Tab completion |
| Network connection failed | Network issues or server unavailable | Check network connection, retry later |
| Insufficient permissions | Missing necessary system permissions | Check file permissions or system settings |
| Configuration file error | Incorrect configuration file format | Reconfigure or restore default settings |

### Diagnostic Steps

1. **Basic Check**
   - Confirm command spelling is correct
   - Use `/help` to view available commands
   - Check parameter format

2. **Network Connection**
   - Verify network connection is normal
   - Check firewall settings
   - Confirm server is accessible

3. **Configuration Verification**
   - Use `/about` to view system status
   - Check related configuration files
   - Re-run configuration commands

4. **Error Troubleshooting**
   - View detailed error information
   - Use `/log` to check logs
   - Use `/bug` to report issues

### Platform Compatibility

| Platform | Support Level | Special Considerations |
|----------|---------------|----------------------|
| Windows | Full support | Paths use backslashes |
| macOS | Full support | May need system permission authorization |
| Linux | Full support | Depends on terminal environment configuration |