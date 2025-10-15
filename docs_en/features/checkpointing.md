---
sidebar_position: 8
hide_title: true
---

# Checkpoint

> **Feature Overview**: Checkpoints are iFlow CLI's safety rollback system that automatically saves project state snapshots before AI tools modify files.
> 
> **Learning Time**: 5-10 minutes
> 
> **Prerequisites**: Understanding basic Git concepts and familiarity with file version management

## What are Checkpoints

Checkpoints are a safety mechanism provided by iFlow CLI that automatically saves complete snapshots of your project state before AI tools modify the file system. This feature allows you to safely experiment and apply code changes, with the ability to immediately roll back to the state before tool execution, ensuring your project's safety.

## Core Features

| Feature | Description | Advantage |
|---------|-------------|----------|
| Automatic Creation | Automatically saves state before AI tool execution | No manual operation required |
| Complete Snapshot | Saves files, conversations, and tool calls | Comprehensive state recovery |
| Independent Storage | Does not interfere with project Git repository | Safe isolation |
| Instant Recovery | One-click rollback to any checkpoint | Quick change reversal |
| Local Storage | All data saved locally | Privacy and security |

## How It Works

### Checkpoint Creation Process

```
Tool Call → Permission Confirmation → State Snapshot → Tool Execution → Checkpoint Complete
    ↓
[AI Request] → [User Approval] → [File Backup] → [Safe Execution] → [State Saved]
```

### Snapshot Content Components

#### 1. Git State Snapshot
- Creates shadow Git repository at `~/.iflow/snapshots/<project_hash>`
- Captures complete state of project files
- Does not interfere with project's original Git repository

#### 2. Conversation History
- Saves complete conversation records with AI assistant
- Includes context and interaction state
- Supports complete conversation state recovery

#### 3. Tool Call Information
- Stores specific tool calls to be executed
- Records parameters and execution context
- Supports re-execution or modification of calls

### Data Storage Locations

| Data Type | Storage Path | Description |
|-----------|-------------|-------------|
| Git Snapshot | `~/.iflow/snapshots/<project_hash>` | Shadow Git repository |
| Conversation History | `~/.iflow/cache/<project_hash>/checkpoints` | JSON format files |
| Tool Calls | `~/.iflow/cache/<project_hash>/checkpoints` | Call detail records |

## Detailed Feature Description

### Enabling Checkpoint Feature

Checkpoint feature is disabled by default and can be enabled through the following methods:

#### Command Line Arguments
```bash
# Enable checkpoint feature
iflow --checkpointing
```

Note! Must be in default mode to take effect.

After entering iflow, use Shift + Tab twice to switch to default mode.

#### Configuration File Settings
Add to `settings.json`:
```json
{
    "checkpointing": {
    "enabled": true
}
}
```

### Using Checkpoints

#### Creating Checkpoints
- Checkpoints are automatically created before AI tools modify files
- Each checkpoint has a unique timestamp identifier
- System will notify when checkpoint creation is complete

#### Viewing Checkpoints
```bash
# List all checkpoints
/restore

# View checkpoint details
/restore <checkpoint-name>
```

#### Restoring Checkpoints
```bash
# Interactive checkpoint selection
/restore

# Restore specific checkpoint
/restore <checkpoint-name>
```


## Usage Examples

### Safe Code Modifications
```bash
# 1. AI suggests modifications
> I want to refactor this function to improve performance

# 2. System automatically creates checkpoint
[Checkpoint] Creating project state snapshot...
[Checkpoint] Snapshot creation complete: checkpoint_20231215_143022

# 3. AI executes modifications
# ... file modification operations ...

# 4. If rollback is needed
/restore checkpoint_20231215_143022
```

### Experimental Changes
```bash
# Attempt large-scale refactoring
> Please help me refactor the entire project architecture

# System creates checkpoint then executes
# If results are unsatisfactory, can easily roll back
/restore
```

## Troubleshooting

### Common Issues and Solutions

| Issue | Possible Cause | Solution |
|-------|---------------|----------|
| Checkpoint creation failed | Insufficient disk space or permission issues | Check disk space and file permissions |
| Recovery failed | Checkpoint file corrupted | Use other checkpoints or manual recovery |
| Checkpoint list empty | Feature not enabled or no modifications | Enable feature and perform file operations |
| Files missing after recovery | Incomplete checkpoint | Check Git repository status |

### Security Considerations

- **Storage Space**: Checkpoints consume disk space, regularly clean up old checkpoints
- **Privacy Protection**: Checkpoints contain complete conversation history, be mindful of sensitive information
- **Git Conflicts**: Recovery may conflict with current Git state, requiring manual handling
- **Large File Handling**: Checkpoints for large projects may take considerable time

### Platform Compatibility

| Platform | Support Level | Special Notes |
|----------|---------------|---------------|
| Windows | Full support | Path handling automatically adapted |
| macOS | Full support | Complete file system support |
| Linux | Full support | Native Git integration |