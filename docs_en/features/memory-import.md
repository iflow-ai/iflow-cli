---
sidebar_position: 3
hide_title: true
---

# Content Import

> **Feature Overview**: Content import is iFlow CLI's modular content management system that supports importing external content through @file syntax.
> 
> **Learning Time**: 5-10 minutes
> 
> **Prerequisites**: Understanding basic file path concepts, familiarity with Markdown syntax

## What is Content Import

Content import is a modular content management feature provided by iFlow CLI, allowing you to import content from other files using `@file.md` syntax. This feature enables you to split large configuration files into smaller, more manageable components, achieving modular organization and reuse of content.

## Core Features

| Feature | Description | Advantage |
|---------|-------------|-----------|
| Modular Management | Split large files into small components | Improves maintainability |
| Path Flexibility | Supports relative and absolute paths | Adapts to different project structures |
| Security Protection | Built-in circular import detection | Prevents infinite recursion |
| Real-time Processing | Dynamic content parsing during import | Keeps content synchronized |
| Cross-project Sharing | Components can be reused across projects | Improves development efficiency |

## How It Works

### Import Processing Flow

```
File Reading → Path Resolution → Security Check → Content Import → Recursive Processing
    ↓
[@file.md] → [Path Calculation] → [Circular Detection] → [Content Insertion] → [Nested Import]
```

### Security Mechanisms

- **Path Validation**: Checks file path legality and security
- **Circular Detection**: Prevents circular references between files
- **Permission Control**: Ensures only authorized files can be accessed
- **Error Recovery**: Graceful handling when imports fail

## Detailed Feature Description

### Basic Syntax

Use the `@` symbol followed by the file path you want to import:

```markdown
# Main configuration file

This is the main content.

@./components/instructions.md

Here is more content.

@./shared/configuration.md
```

### Supported Path Formats

| Path Type | Syntax Example | Description |
|-----------|----------------|-------------|
| Same directory | `@./file.md` | Import file from same directory |
| Parent directory | `@../file.md` | Import file from parent directory |
| Subdirectory | `@./components/file.md` | Import file from subdirectory |
| Absolute path | `@/absolute/path/to/file.md` | Import using absolute path |

## Usage Examples

### Basic Import Scenarios

#### Simple File Import
```markdown
# Main configuration file

Welcome to my project!

@./getting-started.md

## Features

@./features/overview.md
```

#### Modular Organization
```markdown
# Project documentation structure
Project root/
├── IFLOW.md              # Main configuration file
├── components/
│   ├── instructions.md   # Usage guide component
│   ├── setup.md         # Setup guide component
│   └── examples.md      # Example code component
└── shared/
    ├── common.md        # Common configuration
    └── templates.md     # Template files
```

### Advanced Import Features

#### Nested Import
Imported files can themselves contain imports, creating multi-level structures:

```markdown
# main.md
@./header.md
@./content.md
@./footer.md
```

```markdown
# header.md
# Project Title
@./shared/title.md
@./shared/metadata.md
```

#### Conditional Import
Import different configurations based on different situations:

```markdown
# Development environment configuration
@./configs/development.md

# Production environment configuration
@./configs/production.md
```

### Security Protection Mechanisms

#### Circular Import Detection

The system automatically detects and prevents circular references between files:

```markdown
# file-a.md
@./file-b.md

# file-b.md  
@./file-a.md <!-- System will detect circular reference and prevent it -->
```

**Detection Mechanism**:
- Maintains import path stack
- Checks if each new import already exists in the path
- Immediately aborts and reports error when circular reference is found

#### Security Restrictions

| Security Item | Restriction | Purpose |
|---------------|-------------|---------|
| Path validation | Only authorized directories allowed | Prevent access to sensitive files |
| Depth limit | Maximum 5 levels of nesting | Prevent infinite recursion |
| File types | Only text files supported | Avoid binary file issues |
| Permission check | Verify read permissions | Ensure file accessibility |

#### Error Handling Strategies

**Missing File Handling**
- Graceful failure, doesn't interrupt entire import process
- Shows friendly error comments in output
- Logs detailed error information

**Permission Error Handling**
- Shows appropriate permission error messages
- Provides solution suggestions
- Continues processing other available imports

**Format Error Handling**
- Detects file format and encoding issues
- Provides format fix suggestions
- Supports multiple text encoding formats

## Troubleshooting

### Common Issues and Solutions

| Issue | Possible Cause | Solution |
|-------|---------------|----------|
| Import failure | Incorrect file path or file doesn't exist | Check file path and file existence |
| Circular reference error | Mutual references between files | Check and break circular reference chain |
| Permission denied | Insufficient file read permissions | Check file permission settings |
| Depth exceeded | Nesting import levels too deep | Reduce nesting levels or reorganize structure |
| Encoding error | Unsupported file encoding format | Convert file encoding to UTF-8 |

### Diagnostic Steps

1. **Path Validation**
   - Confirm import path syntax is correct
   - Check relative path base directory
   - Verify absolute path completeness

2. **File Check**
   - Confirm target file exists
   - Check file read permissions
   - Verify file encoding format

3. **Structure Analysis**
   - Draw import dependency graph
   - Check for circular references
   - Calculate import depth levels

4. **Log Analysis**
   - Review detailed error logs
   - Analyze import processing
   - Identify specific failure points

### Best Practices

#### File Organization Recommendations

- **Modular Design**: Break content into independent modules by function
- **Hierarchical Structure**: Establish clear directory hierarchy
- **Naming Conventions**: Use descriptive file and directory names
- **Documentation**: Add purpose descriptions for each import module

#### Maintenance Recommendations

- **Regular Checks**: Regularly check import chain integrity
- **Version Control**: Include all import files in version control
- **Dependency Documentation**: Maintain import dependency relationship documentation
- **Test Validation**: Regularly test import functionality correctness

### Platform Compatibility

| Platform | Support Level | Special Notes |
|----------|---------------|---------------|
| Windows | Full support | Path separators automatically converted |
| macOS | Full support | Supports case-sensitive file systems |
| Linux | Full support | Complete POSIX path support |