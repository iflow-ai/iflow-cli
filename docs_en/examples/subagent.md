---
title: Sub Agent
description: Configure specialized AI assistants to handle specific development tasks
sidebar_position: 5
---

# Sub Agent

> **Feature Overview**: Sub Agent is iFlow CLI's intelligent Agent system that automatically selects the most suitable specialized Agent to handle requests based on task type.
> 
> **Learning Time**: 10-15 minutes
> 
> **Prerequisites**: iFlow CLI installed, understanding of basic slash command usage

## What is Sub Agent

Sub Agent is the intelligent task distribution system in iFlow CLI, similar to having a professional team where each member has their own area of expertise. The system can automatically select the most suitable specialized Agent based on different task types to handle your requests, ensuring each task receives the most professional treatment.

## Core Features

| Feature | Description | Advantage |
|---------|-------------|-----------|
| Specialized Division | Each Sub Agent is optimized for specific domains | Improves task processing quality |
| Tool Access Control | Different Agents access different tool sets | Balances security and efficiency |
| Intelligent Scheduling | Automatically selects Agents based on task description | No manual selection needed |
| Model Validation | Automatically verifies model compatibility | Ensures optimal performance |
| Dynamic Extension | Supports custom and third-party Agents | Meets personalized needs |

## How It Works

### Task Analysis and Agent Selection

```
User Request → Task Analysis → Agent Matching → Tool Authorization → Task Execution
    ↓
[Description] → [Domain Recognition] → [Best Agent] → [Tool Set] → [Professional Processing]
```

### Agent Type Classification

- **Development Agents**: Code review, frontend development, backend development, testing, etc.
- **Analysis Agents**: Data analysis, performance analysis, security analysis, etc.  
- **Creative Agents**: Documentation writing, content creation, translation, etc.
- **Operations Agents**: Deployment management, monitoring alerts, fault diagnosis, etc.

## Detailed Feature Description

### Agent Management

#### View Available Agents

| Command | Function | Description |
|---------|----------|-------------|
| `/agents list` | List local Agents | Display installed Agent list |
| `/agents list desc` | Detailed description | Show detailed Agent functionality |
| `/agents online` | Online marketplace | Browse installable Agents |
| `/agents install` | Installation wizard | Guided installation for creating new Agents |
| `/agents refresh` | Refresh Agents | Reload Agent configuration from source files |

#### Agent Marketplace Navigation

**Online Browsing Operations**

| Operation | Shortcut | Description |
|-----------|----------|-------------|
| Browse down | `j` or `↓` | Move to next option |
| Browse up | `k` or `↑` | Move to previous option |
| Go back | `h` | Return to parent directory |
| Enter selection | `l` or `Enter` | View details or install |
| Exit browse | `q` | Exit browse mode |
| Refresh list | `r` | Reload Agent list |

```bash
# Enter online Agent marketplace
/agents online
```

#### Agent Installation Management

**Install via CLI Commands**

```bash
# Add project-level Agent
iflow agent add <agent-name-or-id> --scope project

# Add user-level Agent (global scope)
iflow agent add <agent-name-or-id> --scope global

# Actual examples
iflow agent add python-expert --scope project
iflow agent add code-reviewer --scope global

# Other management commands
iflow agent list              # List all configured Agents
iflow agent remove <name>     # Remove specified Agent
iflow agent get <name>        # View Agent details
iflow agent online            # Browse online Agent marketplace
```

**Important Reminder**: Be cautious when using third-party Sub Agents! Ensure you trust the Agent configurations you're installing, especially those that may access sensitive data.

**Guided Installation (Recommended)**

Use the `/agents install` command to start the guided installation wizard, supporting three creation methods:

```bash
# Start Agent installation wizard
/agents install
```

**Installation Wizard Features**:

1. **Smart Creation Modes**:
   - **iFlow Generation** (Recommended): Create Agents through intelligent guidance
   - **Manual Configuration**: Step-by-step manual Agent parameter configuration
   - **Online Repository**: Install from online Agent repository

2. **Configuration Options**:
   - Installation location selection (project level/user level)
   - Tool permission configuration
   - MCP server access permissions
   - Custom system prompts
   - Agent appearance color selection

3. **Wizard Navigation**:
   - Use arrow keys `↑/↓` or `j/k` to navigate options
   - `Enter` to confirm selection
   - `Esc` to return to previous step
   - `q` to exit wizard

**Usage Example**:

```bash
# Step 1: Start installation wizard
/agents install

# Step 2: Select installation location
→ Project Agent (available for current project only)
  User Agent (globally available)

# Step 3: Select creation method
→ Generate with iFlow (recommended)
  Manual configuration
  From Online Repository

# Step 4: Describe Agent goal (iFlow mode)
Describe your agent goal: Review code security and best practices

# Step 5: Configure tools and permissions
Select tools: [✓] Read [✓] Write [✓] Bash [ ] WebFetch
Select MCP servers: [✓] filesystem [✓] git

# Step 6: Preview and confirm creation
Agent Type: code-security-reviewer
Description: Expert Agent specialized in reviewing code security and best practices
Tools: Read, Write, Bash
Location: Project Agent
```

**Manual Installation**
1. Create Agent directory
```bash
mkdir -p ~/.iflow/agents
```

2. Create custom Agent
```bash
# Create new Agent file
nano ~/.iflow/agents/my-agent.md
```

3. Restart CLI to load new Agent
```bash
iflow
```

**Note**: iFlow CLI will use the Task tool to call Sub Agents

### Quick Call Feature

#### Using $ Symbol for Quick Calls

iFlow CLI supports using the `$` symbol to quickly call Sub Agents, similar to how `@` symbol selects files:

**Basic Syntax**
```bash
$<agent-type> <task description>
```

**Usage Examples**
```bash
$code-reviewer Perform code review on the current project
$frontend-developer Create a responsive navigation component
$python-expert Optimize this algorithm's performance
$data-scientist Analyze trends in this dataset
```

#### Quick Call Features

| Feature | Description | Advantage |
|---------|-------------|-----------|
| Smart Completion | Shows available Agent list after typing `$` | Quick selection of appropriate Agent |
| Quick Execution | Executes directly in current conversation | No additional configuration steps |
| Real-time Feedback | Shows Agent execution status and process | Understand task progress |
| Visual Interface | Tool call process visualization | Enhanced user experience |
| Result Display | Agent responses shown directly in conversation | Seamless workflow integration |

#### Usage Tips

1. **Quick Selection**: Use arrow keys or mouse to select Agent type after typing `$`
2. **Clear Tasks**: Provide clear, specific task descriptions
3. **Context Awareness**: Agents automatically get current project context information
4. **Tool Permissions**: Agents get appropriate tool access based on their configuration

### Preset Agent Types

#### Built-in Agents

| Agent Type | Function Description | Use Cases |
|------------|---------------------|-----------|
| general-purpose | General-purpose Agent | Complex multi-step tasks |

#### Extended Agents

Richer Agents can be quickly installed through the iFlow AI online marketplace, including:
- **Code Review Expert**: Specialized for code quality checking
- **Frontend Development Expert**: Focused on frontend technologies and UI development
- **Data Analysis Expert**: Handles data analysis and visualization tasks
- **Documentation Writing Expert**: Professional technical documentation creation

## Usage Examples

### Common Use Cases

#### Code Review
```bash
$code-reviewer Please perform comprehensive code review on the current project, focusing on code quality and best practices
```

#### Frontend Development
```bash
$frontend-developer Create a responsive user login component with form validation
```

#### Data Analysis
```bash
$data-scientist Analyze sales trends in sales_data.csv and generate visualization charts
```

#### Documentation Writing
```bash
$doc-writer Generate detailed technical documentation and usage examples for this API endpoint
```

### Agent Collaboration Scenarios

Multiple Agents can collaborate on the same project:

```bash
# First perform code review
$code-reviewer Check current code for security issues

# Then optimize performance
$performance-expert Optimize code performance based on review results

# Finally generate documentation
$doc-writer Generate complete documentation for the optimized code
```

## Intelligent Model Management

### Automatic Model Validation

| Feature | Description | Advantage |
|---------|-------------|-----------|
| Compatibility Detection | Automatically check model support before execution | Avoid execution errors |
| Smart Recommendations | Recommend best alternative models | Ensure task quality |
| User Choice | Provide model selection dialog | Maintain user control |
| Preference Memory | Remember user's model selection preferences | Simplify subsequent operations |

### Model Switching Modes

**Interactive Mode (Default)**
- Show model selection dialog
- User can select alternative model from available model list
- Supports both "one-time" and "remember permanently" options

**YOLO Mode**
- Automatically use recommended alternative model
- Show warning message explaining model switch
- No user intervention needed, quick execution

## Custom Agent Configuration

### Configuration File Management

Create custom Agent configuration in project's `.iflow/agents/` directory:

```markdown
---
agentType: "custom-expert"
systemPrompt: "You are an expert in a custom domain..."
whenToUse: "Use when handling specific domain tasks"
model: "claude-3-5-sonnet-20241022"
allowedTools: ["*"]
proactive: false
---

# Custom Expert Agent

This is a detailed description of a custom expert Agent...
```

### Configuration Attribute Description

#### Required Attributes

| Attribute | Type | Description |
|-----------|------|-------------|
| agentType | String | Unique identifier for the Agent |
| systemPrompt | String | System prompt for the Agent |
| whenToUse | String | Description of when to use this Agent |

#### Optional Attributes

| Attribute | Type | Description | Default Value |
|-----------|------|-------------|---------------|
| model | String | Preferred AI model | - |
| allowedTools | Array | List of usable tools | [] |
| allowedMcps | Array | List of allowed MCP servers | [] |
| isInheritTools | Boolean | Whether to inherit parent Agent's tool permissions | true |
| isInheritMcps | Boolean | Whether to inherit parent Agent's MCP permissions | true |
| proactive | Boolean | Whether to proactively recommend usage | false |
| color | String | Display color in UI | - |
| name | String | Display name | agentType |
| description | String | Brief description | - |

**Permission Inheritance Mechanism**

Sub Agent's tool and MCP permission system uses an inheritance mechanism, allowing precise control over Agent capability boundaries:

**Tool Inheritance (isInheritTools)**
- `true` (default): Inherits all tool permissions from the main Agent, plus additional tools specified in allowedTools
- `false`: Only uses tools explicitly specified in allowedTools, no inheritance from parent

**MCP Inheritance (isInheritMcps)**
- `true` (default): Inherits access to all MCP servers from the main Agent, plus additional servers specified in allowedMcps
- `false`: Only accesses MCP servers explicitly specified in allowedMcps, no inheritance from parent

**MCP Server Access Control (allowedMcps)**
- Specifies the list of MCP (Model Context Protocol) servers the Agent can access
- Used to limit Agent access to specific external services and APIs
- Empty array means no restriction on MCP server access (inherits parent permissions)

**Permission Configuration Example**

```markdown
---
agentType: "security-auditor"
systemPrompt: "You are a security audit expert..."
whenToUse: "Use when performing security audits and vulnerability checks"
allowedTools: ["Read", "Grep", "Bash"]
allowedMcps: ["security-scanner", "vulnerability-db"]
isInheritTools: false
isInheritMcps: false
---
```

In this example:
- Agent can only use Read, Grep, Bash tools, no inheritance of other tool permissions
- Agent can only access security-scanner and vulnerability-db MCP servers
- This configuration ensures the security audit Agent's permissions are strictly limited to necessary scope

## Troubleshooting

### Common Issues and Solutions

| Issue | Possible Cause | Solution |
|-------|----------------|----------|
| Agent not responding | Model incompatibility or network issues | Check model settings, confirm network connection |
| Tool permission error | allowedTools configuration error | Check tool permission settings in Agent configuration |
| Agent list empty | Configuration file path error | Confirm .iflow/agents/ directory exists with configuration files |
| Quick call failure | Agent type doesn't exist | Use /agents list to view available Agents |
| Model switching failure | Target model unavailable | Select other available models or check configuration |

### Diagnostic Steps

1. **Basic Check**
   ```bash
   /agents list              # View installed Agents
   /agents refresh           # Refresh Agent configuration
   ```

2. **Configuration Verification**
   - Check if `.iflow/agents/` directory exists
   - Verify configuration file format is correct
   - Confirm Agent type naming conventions

3. **Permission Verification**
   - Check tool access permission settings
   - Verify model access permissions
   - Confirm network connection status

4. **Log Check**
   ```bash
   /log                      # View detailed logs
   /stats                    # View usage statistics
   ```

### Platform Compatibility

| Platform | Support Level | Special Notes |
|----------|---------------|---------------|
| Windows | Full support | Configuration file paths use backslashes |
| macOS | Full support | May require file system permissions |
| Linux | Full support | Depends on system package manager |