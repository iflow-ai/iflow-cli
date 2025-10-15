---
title: Best Practices
description: Efficient usage guide for iFlow CLI in real projects
sidebar_position: 8
---

# Best Practices

This guide compiles best practices for using iFlow CLI in real projects, helping you maximize AI assistant efficiency and avoid common pitfalls.

## Development Workflow Best Practices

### 1. Project Initialization Workflow

```
# Standard project start process
/init                    # Analyze project structure
!git status             # Check current status
Please help me create a development plan for this project
```

**Why do this?**
- `/init` provides complete project context to AI
- Git status helps understand the current development stage
- Clear planning requests get targeted suggestions

### 2. Feature Development Workflow

```
# Standard process for developing new features
/clear                  # Clear previous context
/init                   # Re-analyze project
I need to implement [specific feature description], please help me analyze which files need modification
!git checkout -b feature/new-feature
# Develop based on suggestions
!npm test              # Test validation
!git add . && git commit -m "Add new feature"
```

### 3. Debugging Problem Workflow

```
# Standard process when encountering problems
!npm test              # Reproduce the issue
Here's the error message: [paste complete error]
Please help me analyze the problem cause and provide solutions
# Fix based on suggestions
!npm test              # Verify fix
```

## Questioning Techniques

### Effective Questioning Methods

**Good Questions**:
```
I encountered an issue while implementing user authentication. Here's my code:
[paste relevant code]

When running tests, I get the following error:
[paste complete error message]

I'm using Node.js + Express + JWT, please help me analyze the problem and provide solutions.
```

**Poor Questions**:
```
Code doesn't work, please fix it
```

### Tips for Providing Context

1. **Include relevant code snippets**
2. **Provide complete error messages**
3. **Mention tech stack and environment**
4. **Describe expected behavior vs actual behavior**
5. **Mention already attempted solutions**

## Code Review Best Practices

### Using Sub Agents for Code Review

```
# Review process after development completion
@code-reviewer Please review my just-completed user login functionality

# For specific files
@code-reviewer Please focus on reviewing the security of src/auth.js

# For specific commits
!git show HEAD
@code-reviewer Please review the changes in this commit
```

### Security Review Checklist

Before committing code, ensure you check:

- [ ] Input validation and sanitization
- [ ] Authentication and authorization
- [ ] Sensitive information handling
- [ ] Error handling and logging
- [ ] SQL injection protection
- [ ] XSS attack prevention

## Test-Driven Development

### Test-First Workflow

```
# TDD workflow
I want to implement [feature description], please help me write test cases first
# Write tests
!npm test              # Run tests (should fail)
Please help me implement code that passes these tests
# Implement functionality
!npm test              # Verify tests pass
@code-reviewer Please review the implemented code
```

### Test Coverage Improvement

```
!npm run coverage      # Check current coverage
Please help me add tests for files with insufficient coverage:
[list files and functions needing tests]
```

## Refactoring Best Practices

### Safe Refactoring Process

```
# Pre-refactoring preparation
!npm test              # Ensure all tests pass
!git add . && git commit -m "Pre-refactor checkpoint"

# Start refactoring
I want to refactor this function to improve readability and performance:
[paste function code]
Please provide refactoring suggestions while maintaining the same functionality

# Post-refactoring verification
!npm test              # Ensure functionality unchanged
@code-reviewer Please review the refactored code
```

### Performance Optimization Strategy

```
# Performance analysis
!npm run benchmark     # Run performance tests
Please analyze performance bottlenecks and provide optimization suggestions
# Implement optimizations
!npm run benchmark     # Compare optimization effects
```

## Documentation Writing Best Practices

### API Documentation Generation

```
Please help me generate OpenAPI documentation for this API endpoint:
[paste API code]

Format requirements:
- Include request/response examples
- Detailed parameter descriptions
- Error handling explanations
```

### README Documentation Maintenance

```
Please help me update README.md, including:
1. Latest feature introductions
2. Installation and usage instructions
3. API documentation links
4. Contribution guidelines

Based on current project structure:
/init
```

## Environment Management

### Multi-Environment Configuration

```
# Development environment
!NODE_ENV=development npm start

# Production environment deployment check
Please help me check the security and performance of production environment configuration
[show configuration file contents]
```

### Dependency Management

```
# Dependency updates
!npm outdated         # Check outdated dependencies
Please analyze the risks and benefits of these dependency updates
!npm audit            # Security audit
Please help me fix the discovered security vulnerabilities
```

## Troubleshooting Guide

### Common Problem Solutions

1. **AI responses are inaccurate**
   - Use `/clear` to remove irrelevant context
   - Provide more specific information
   - Use `/init` to re-establish project context

2. **Command execution fails**
   - Check if working directory is correct
   - Confirm dependencies are installed
   - View complete error messages

3. **Performance issues**
   - Regularly use `/clear` to clean context
   - Avoid overly long code pastes
   - Break complex problems into smaller steps

### Debugging Techniques

```
# System information collection
!node --version && npm --version && git --version
!pwd && ls -la

# Log analysis
!tail -n 50 logs/app.log
Please help me analyze abnormal patterns in these logs
```

## Efficiency Enhancement Tips

### 1. Use Templates and Snippets

Create common code templates:
```
Please help me create an Express.js route template, including:
- Input validation
- Error handling
- Logging
- Unit tests
```

### 2. Batch Operations

```
# Batch file processing
Please help me add TypeScript type definitions for the following files:
!find src -name "*.js" | head -10
```

### 3. Automated Script Generation

```
Please help me create a deployment script, including:
1. Code checking and testing
2. Build optimization
3. Database migration
4. Service restart
5. Health checks
```

## Team Collaboration Best Practices

### Code Standard Unification

```
Please help me configure project code standard tools:
- ESLint configuration
- Prettier configuration  
- Git hooks setup
- CI/CD integration
```

### Knowledge Sharing

```
Please help me summarize key points from this feature development:
1. Technical selection rationale
2. Main challenges encountered
3. Solutions and best practices
4. Recommendations for the team

Generate team sharing documentation
```

## Security Best Practices

### Sensitive Information Handling

- Never paste real API keys, passwords, or other sensitive information in conversations
- Use placeholders or example values
- Regularly use `/clear` to clear context that might contain sensitive information

### Code Security Checks

```
@security-auditor Please check the security of the following code:
[paste code with sensitive information removed]

Focus on:
- Input validation
- Permission control
- Data encryption
- Error handling
```

---

**Remember**: Good practices need continuous application and improvement. Adjust these suggestions based on project characteristics and team needs to find the most suitable workflow!