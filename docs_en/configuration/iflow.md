# Memory

## Overview

IFLOW.md is the core memory file for iFlow CLI, providing AI assistants with project-specific instruction context and background information. Unlike traditional configuration files, IFLOW.md is written in natural language, allowing AI to better understand your project structure, coding standards, and workflows. Any instructions or constraints for CLI operations can be written in this file.

### Key Features

- **Context Provision**: Provides AI with project background, coding standards, and architecture information
- **Personalized Customization**: Customizes AI behavior and responses based on project characteristics
- **Hierarchical Management**: Supports layered configuration at global, project, and subdirectory levels
- **Modular Organization**: Achieves modular configuration management through file imports
- **Memory Persistence**: Persists important information through save_memory functionality

## File Storage Locations and Hierarchical Design

IFLOW.md uses a hierarchical system, loading in the following priority order (higher numbers have higher priority):

### 1. Global Level (Priority: Low)
```
~/.iflow/IFLOW.md
```
- **Scope**: All iFlow CLI sessions
- **Purpose**: Store personal preferences, general coding standards, global memory
- **Example Content**: Personal programming habits, preferred libraries, personal information

### 2. Project Level (Priority: Medium)
```
/path/to/your/project/IFLOW.md
```
- **Scope**: Specific project
- **Purpose**: Project architecture, technology stack, team standards
- **Example Content**: Project overview, API documentation, deployment instructions

### 3. Subdirectory Level (Priority: High)
```
/path/to/your/project/src/IFLOW.md
/path/to/your/project/tests/IFLOW.md
```
- **Scope**: Specific directory and its subdirectories
- **Purpose**: Module-specific instructions and conventions
- **Example Content**: Module descriptions, special testing requirements

### Loading Mechanism

iFlow CLI starts from the current working directory and searches upward to the project root directory and user home directory, loading all IFLOW.md files found. Content is merged according to priority order, with higher priority content overriding lower priority content.

### Custom File Names

You can customize the context file name through the [configuration file](./settings.md):

```json
{
  "contextFileName": "AGENTS.md"
}
```

Or support multiple file names:

```json
{
  "contextFileName": ["IFLOW.md", "AGENTS.md", "CONTEXT.md"]
}
```

## /init Operation Details

The `/init` command is the best way to get started quickly. It automatically analyzes your project and generates a customized IFLOW.md file.

### Execution Process

1. **Check Existing Files**: If IFLOW.md already exists in the current directory, it will prompt that no modifications will be made
2. **Create Empty File**: First creates an empty IFLOW.md file
3. **Project Analysis**: Scans project structure, dependencies, configuration files
4. **Content Generation**: Generates customized content based on analysis results
5. **File Population**: Writes the generated content to IFLOW.md

### Analysis Content

The `/init` command analyzes the following project characteristics:

- **Technology Stack Identification**: Based on package.json, requirements.txt and other files
- **Project Structure**: Directory layout, key file locations
- **Build Tools**: webpack, vite, rollup and other configurations
- **Testing Frameworks**: jest, mocha, pytest, etc.
- **Code Standards**: ESLint, Prettier, Black and other configurations
- **Documentation Structure**: README, API documentation, etc.

### Usage Example

```bash
# Execute in project root directory
$ iflow
> /init

# Example output
Empty IFLOW.md created. Now analyzing the project to populate it.
Analyzing project structure...
Generating customized context...
IFLOW.md has been successfully populated with project-specific information.
```

### Generated Content Example

```markdown
# Project Context

## Project Overview
This is a full-stack application based on TypeScript + React + Node.js.

## Technology Stack
- Frontend: React 18, TypeScript, Vite
- Backend: Node.js, Express, TypeScript
- Database: PostgreSQL
- Testing: Jest, React Testing Library

## Project Structure
```
src/
├── components/     # React components
├── services/      # API services
├── utils/         # Utility functions
└── types/         # TypeScript type definitions
```

## Development Standards
- Use TypeScript strict mode
- Components use functional approach
- Use ESLint + Prettier for code formatting
- Run pre-commit hooks before committing
```

## Modular Management (Import Functionality)

IFLOW.md supports importing other files through `@` syntax, enabling modular configuration management.

### Import Syntax

```markdown
# Main IFLOW.md file

@./shared/coding-standards.md

@./project-specific/architecture.md

@../global/personal-preferences.md
```

### Supported Path Formats

#### Relative Paths
```markdown
@./file.md                    # Same directory
@../file.md                   # Parent directory
@./components/readme.md       # Subdirectory
```

#### Absolute Paths
```markdown
@/absolute/path/to/file.md
```

### File Organization Example

```
project/
├── IFLOW.md                  # Main configuration file
├── .iflow/
│   ├── architecture.md       # Architecture documentation
│   ├── coding-style.md       # Coding standards  
│   └── deployment.md         # Deployment instructions
└── src/
    └── IFLOW.md             # Source directory specific configuration
```

Main IFLOW.md:
```markdown
# Project Overall Configuration

@./.iflow/architecture.md
@./.iflow/coding-style.md
@./.iflow/deployment.md

## Project-Specific Instructions
Please follow the above architecture and coding standards when working on this project.
```

### Security Features

1. **Circular Import Detection**: Automatically detects and prevents circular references
2. **Path Validation**: Ensures only allowed directories can be accessed
3. **Depth Limiting**: Prevents overly deep import nesting (default maximum 5 levels)
4. **Error Handling**: Gracefully handles file not found or permission issues

### Debugging Imports

Use the `/memory show` command to view the complete merged result and import tree:

```
Memory Files
 L project: IFLOW.md
            L .iflow/architecture.md
            L .iflow/coding-style.md
            L .iflow/deployment.md
```

## Practical Application Examples

### 1. React Project Example

```markdown
# React Project Configuration

## Project Type
This is a modern React application using TypeScript and Vite.

## Development Standards
- Prioritize functional components and Hooks
- State management using Zustand
- Styling using Tailwind CSS
- Testing using Jest + Testing Library

## Code Style
- Component files use PascalCase naming
- Hook files start with use
- Constants use UPPER_SNAKE_CASE
- Interfaces start with I (e.g., IUser)

## File Structure Conventions
```
src/
├── components/     # Reusable components
├── pages/         # Page components
├── hooks/         # Custom hooks
├── stores/        # Zustand stores
├── services/      # API calls
├── types/         # TypeScript types
└── utils/         # Utility functions
```

## Special Requirements
- All components must have TypeScript type declarations
- Asynchronous operations use React Query
- Routing uses React Router v6
```

### 2. Node.js Backend Project Example

```markdown
# Node.js Backend Project

## Technology Stack
- Framework: Express.js
- Database: PostgreSQL + Prisma ORM
- Authentication: JWT
- Validation: Zod
- Testing: Jest + Supertest

## Architecture Pattern
Uses layered architecture: Controller -> Service -> Repository -> Database

## API Standards
- RESTful API design
- Unified error handling middleware
- Request parameter validation using Zod
- Response format: `{ success: boolean, data?: any, error?: string }`

## Security Requirements
- All routes need appropriate authentication and authorization
- Sensitive information uses environment variables
- Input data must be validated and sanitized
- Error messages should not expose internal implementation

## Deployment Configuration
- Use Docker for containerization
- Environment variables managed through .env files
- Production environment uses PM2 for process management
```

### 3. Team Collaboration Example

```markdown
# Team Development Standards

## Code Commit Standards
- Use Conventional Commits format
- Must pass lint and test before committing
- Each PR must have code review
- Important changes require technical proposal discussion

## Branching Strategy
- main: Production environment code
- develop: Development environment code  
- feature/*: Feature branches
- hotfix/*: Emergency fix branches

## Code Review Points
1. Code logic correctness
2. Performance considerations
3. Security checks
4. Test coverage
5. Documentation completeness

## Communication and Collaboration
- Discuss major architectural changes before implementation
- Communicate issues promptly in the team chat
- Conduct regular technical sharing sessions
- Keep code and documentation synchronized
```

## Advanced Features

### 1. Working with /memory Commands

```bash
# View currently loaded memory content
/memory show

# Manually add memory
/memory add This project requires test coverage above 80%

# Refresh memory (reload all IFLOW.md files)
/memory refresh
```

### 2. Environment Variable References

You can reference environment variables in IFLOW.md:

```markdown
# Project Configuration

## Database Connection
Use environment variable `$DATABASE_URL` to connect to the database.

## API Configuration
API base URL: `${API_BASE_URL}`
API secret key: `$API_SECRET_KEY`
```

### 3. Dynamic Configuration

Load different configurations based on different environments:

```markdown
# Environment-Related Configuration

@./config/development.md
@./config/production.md

## Current Environment
Currently running in ${NODE_ENV} environment.
```

## Common Issues and Troubleshooting

### 1. IFLOW.md Not Taking Effect

**Symptoms**: AI behavior doesn't change after modifying IFLOW.md

**Troubleshooting Steps**:
1. Check if file location is correct
2. Use `/memory show` to see if it's being loaded
3. Use `/memory refresh` to force reload
4. Check if file permissions are readable

**Solutions**:
```bash
# View currently loaded memory
/memory show

# Reload all memory files
/memory refresh

# Check configured file name
# Ensure it matches contextFileName setting
```

### 2. Priority Conflicts

**Symptoms**: Different levels of IFLOW.md content conflict

**Solutions**:
1. Understand loading priority: Subdirectory > Project > Global
2. Use `/memory show` to view final merged result
3. Explicitly override low priority settings in high priority files

### 3. Import File Failure

**Symptoms**: `@file.md` syntax doesn't work

**Common Causes**:
- Incorrect file path
- File doesn't exist
- Circular import
- Permission issues

**Solutions**:
```bash
# Test with absolute path
@/absolute/path/to/file.md

# Check if file exists
ls -la ./path/to/file.md

# View import tree structure
/memory show
```

### 4. Performance Issues

**Symptoms**: Slow startup or response delays

**Optimization Suggestions**:
1. Reduce number of imported files
2. Avoid overly deep import nesting
3. Remove unnecessary content
4. Use more specific configurations instead of generic ones

### 5. save_memory Not Working

**Possible Causes**:
- Global directory `~/.iflow/` doesn't exist
- Insufficient permissions
- Insufficient disk space

**Solutions**:
```bash
# Create global configuration directory
mkdir -p ~/.iflow

# Check permissions
ls -la ~/.iflow/

# Manually create file for testing
touch ~/.iflow/IFLOW.md
```

## Best Practices Summary

### 1. Content Organization
- **Hierarchical Management**: Global general settings, project-specific configurations, module-local rules
- **Modular Imports**: Split large files into logical modules
- **Version Control**: Include project-level IFLOW.md in version control, exclude global files

### 2. Content Writing
- **Use Natural Language**: Write in a way that's easy for AI to understand
- **Be Specific and Clear**: Avoid vague descriptions, provide concrete examples
- **Keep Updated**: Update configurations timely as the project evolves

### 3. Team Collaboration
- **Unified Standards**: Team members use consistent IFLOW.md templates
- **Documentation Sync**: Synchronize configuration changes with code changes
- **Regular Reviews**: Regularly review and optimize IFLOW.md content

### 4. Maintenance Management
- **Regular Cleanup**: Remove outdated configurations and memories
- **Monitor Effectiveness**: Observe whether AI behavior meets expectations
- **Gradual Optimization**: Gradually improve configurations based on usage effectiveness

By properly using IFLOW.md, you can help iFlow CLI better understand your project and requirements, thereby providing more accurate and valuable assistance. Remember, IFLOW.md is a powerful tool that, when properly configured, can significantly improve development efficiency and AI collaboration experience.