# .iflowignore

## Overview

`.iflowignore` is a file ignore feature in iFlow CLI, similar to Git's `.gitignore`. It allows you to specify which files and directories should be ignored when using iFlow CLI tools.

## How It Works

When you create a `.iflowignore` file in your project root directory and define ignore rules, iFlow CLI tools that support this feature will automatically skip matching files and directories, without processing them.

## Supported Tools

The following iFlow CLI tools support `.iflowignore` functionality:

- `ls` - Directory listing tool
- `read_many_files` - Batch file reading tool  
- `@filename` syntax - AT command file references
- Other file operation related tools

## Usage

### 1. Create .iflowignore File

Create a `.iflowignore` file in your project root directory:

```bash
touch .iflowignore
```

### 2. Add Ignore Rules

The `.iflowignore` file follows the same syntax rules as `.gitignore`:

```bash
# This is a comment line

# Ignore specific files
secrets.txt
config.json

# Ignore specific directories
build/
dist/
node_modules/

# Use wildcards to ignore file types
*.log
*.tmp
*.cache

# Use path matching
/root-only-file.txt
src/**/*.test.js

# Negation rules (do not ignore)
*.log
!important.log
```

### 3. Syntax Rules

| Rule | Description | Example |
|------|------|------|
| `#` | Comment line | `# This is a comment` |
| `*` | Match any characters | `*.log` matches all .log files |
| `?` | Match single character | `file?.txt` matches file1.txt |
| `[]` | Character set matching | `[abc].txt` matches a.txt, b.txt, c.txt |
| `/` at start | Root directory relative path | `/build/` only matches build in root directory |
| `/` at end | Match directories only | `temp/` only matches directories, not files |
| `!` at start | Negation rule | `!important.log` do not ignore this file |

## Practical Examples

### Frontend Project

```bash
# .iflowignore for React/Vue project

# Build output
build/
dist/
.next/

# Dependencies
node_modules/

# Logs and cache
*.log
.cache/
.parcel-cache/

# Environment variable files
.env.local
.env.production

# Test coverage
coverage/

# IDE configuration (but keep .vscode)
.idea/
*.swp
*.swo
```

### Node.js Backend Project

```bash
# .iflowignore for Node.js backend

# Runtime files
*.pid
*.log
logs/

# Dependencies and build
node_modules/
dist/
build/

# Database files
*.db
*.sqlite

# Upload file directories
uploads/
temp/

# Sensitive configuration
.env
config/production.json
```

### Python Project

```bash
# .iflowignore for Python project

# Python cache
__pycache__/
*.pyc
*.pyo
*.pyd

# Virtual environments
venv/
env/
.venv/

# Build files
build/
dist/
*.egg-info/

# Jupyter Notebook checkpoints
.ipynb_checkpoints/

# Testing and coverage
.pytest_cache/
.coverage
htmlcov/
```

## Feature Verification

### Test ls Tool

```bash
# Use iFlow CLI's ls tool to view directory
iflow -p "ls ."

# Files ignored by .iflowignore will not appear in the output
# The tool will show statistics like "X files were iflow-ignored"
```

### Test File Reading

```bash
# Use batch file reading
iflow -p "read_many_files *.txt"

# Ignored .txt files will show "file is ignored by .iflowignore" message
```

### Test @ Command

```bash
# Use @ syntax to reference files
iflow -p "@ignored-file.txt"

# Ignored files will show warning message and skip processing
```

## Important Notes

1. **Restart Required**: After modifying the `.iflowignore` file, you need to restart the iFlow CLI session for changes to take effect
2. **File Location**: The `.iflowignore` file must be placed in the project root directory
3. **Git Independence**: `.iflowignore` and `.gitignore` are independent and do not affect each other
4. **Tool Support**: Not all tools support this feature, mainly file operation related tools

## Debugging Tips

If you find that ignore rules are not taking effect:

1. Check if the `.iflowignore` file is in the project root directory
2. Check if file paths are correct (relative to project root directory)
3. Restart the iFlow CLI session
4. Use the `ls` tool to verify ignore effects

## Best Practices

1. **Version Control**: Commit the `.iflowignore` file to Git so the team can share ignore rules
2. **Layered Ignoring**: Use in combination with `.gitignore` - `.gitignore` handles version control, `.iflowignore` handles AI tools
3. **Regular Maintenance**: Update ignore rules timely as the project evolves
4. **Documentation**: Document special ignore rules in the project README

By properly using `.iflowignore`, you can make iFlow CLI focus more on processing important code files, improving work efficiency.