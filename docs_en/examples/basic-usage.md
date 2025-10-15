---
title: Basic Usage
description: Basic operations and core features of iFlow CLI
sidebar_position: 2
---

# Basic Usage

> **Learning Goal**: Master daily development operations of iFlow CLI  
> **Estimated Time**: 15-20 minutes  
> **Prerequisites**: Completed [Quick Start](../quickstart) setup

This document introduces the basic operations and core features of iFlow CLI, helping you quickly get started and master the most commonly used features in daily development.

## Document Structure

- [Core Commands](#core-commands) - Essential basic commands
- [Practical Usage Examples](#practical-usage-examples) - Specific scenario demonstrations  
- [Best Practices](#best-practices) - Efficient usage tips
- [Advanced Techniques](#advanced-techniques) - Advanced operation methods
- [Troubleshooting](#common-issues) - Common problem solutions

**Related Documentation**:
- 🔰 New User Guide: [Quick Start](../quickstart)
- 🚀 Advanced Learning: [Interactive Mode](../features/interactive)
- 💡 Expert Tips: [Best Practices](./best-practices)

## Core Commands

### Initialization Command

The `/init` command automatically analyzes your codebase and generates project documentation:

```
/init
```

**Key Features:**
- Automatically identifies project type and tech stack
- Generates detailed project structure documentation
- Analyzes dependencies and configuration files
- Provides context for subsequent AI interactions

### Clear Context

Use the `/clear` command to clear conversation history:

```
/clear
```

**Use Cases:**
- Starting new tasks or projects
- Optimizing performance, reducing token usage
- Protecting privacy, clearing sensitive information
- Switching project contexts

### Shell Command Execution

Use the `!` prefix to execute shell commands directly in iFlow CLI:

```bash
# View file list
!ls -la

# Run tests
!npm test

# Check git status
!git status

# Install dependencies
!npm install express
```

**Advantages:**
- Command output is directly integrated into AI conversation
- AI can analyze command results and provide suggestions
- Maintains shell environment and working directory context

## Practical Usage Examples

### Example 1: Project Initialization

```
User: /init

AI: I'll analyze your project structure...

User: !npm install

AI: Dependencies installed successfully. Based on your package.json, this is a React application.
Would you like me to check for any configuration issues?
```

### Example 2: Debugging Issues

```
User: !npm test
   ❌ TypeError: Cannot read property 'name' of undefined

AI: I see the test failed. Let me help you analyze this error...
This error usually occurs when accessing properties of undefined objects.
Please check if objects are properly initialized in the related code.

User: Please help me check the src/user.js file

AI: Sure, let me examine the contents of the src/user.js file...
```

### Example 3: Code Review

```
User: !git diff HEAD~1

AI: I see you modified the user authentication logic in your latest commit.
Let me review these changes for you:

1. Input validation was correctly added
2. Suggest adding error handling
3. Consider using more secure password hashing methods
```

## Best Practices

### 1. Leverage Context Effectively

- Use `/init` to establish initial context for the project
- Let AI understand your project structure and tech stack
- Provide necessary background information before complex operations

### 2. Combine Commands

```
# First initialize the project
/init

# Then execute related operations
!npm run build

# If encountering issues, let AI help analyze
Please help me analyze the cause of the build failure
```

### 3. Effective Conversation Management

- Use `/clear` when switching to new tasks
- Keep conversations focused on specific problems
- Provide code and file context when appropriate

### 4. Error Handling Best Practices

```
!command_that_might_fail

# If command fails, immediately seek help
This command failed, please help me analyze the error cause and provide solutions
```

## Advanced Techniques

### Chained Command Execution

```
!git add . && git commit -m "Add new feature" && git push
```

### Environment Variables and Configuration

```
!NODE_ENV=production npm start
```

### Pipeline Operations

```
!ps aux | grep node
!ls -la | head -10
```

## Common Issues

### Q: What should I do when command execution fails?
A: Copy the error message to AI, it can help you analyze the cause and provide solutions.

### Q: How to improve AI response accuracy?
A: Use `/init` to provide project context, and include relevant code snippets and error information when asking questions.

### Q: When should I use `/clear`?
A: When switching to different projects, starting new tasks, or when conversations become too long affecting performance.

---

## Next Learning Path

After completing basic usage learning, we recommend continuing with the following path:

### 🎯 Ready to Learn Now
- **[Interactive Mode Details](../features/interactive)** - Master efficient interaction methods like image processing and file references
- **[Complete Command Reference](../features/slash-commands)** - Learn about all available slash commands


### 💼 Practical Applications  
- **[Best Practices Guide](./best-practices)** - Team collaboration and workflow optimization
- **[Advanced Configuration](../configuration/settings)** - Deep customization and performance tuning

### 📚 Reference Materials
- **[Glossary](../glossary)** - Look up professional term definitions

---

**Need Help?**
- 💬 [Community Discussions](https://github.com/iflow-ai/iflow-cli/discussions) 
- 🐛 [Issue Feedback](https://github.com/iflow-ai/iflow-cli/issues)
- 📧 [Official Documentation](https://docs.iflow.cn/)