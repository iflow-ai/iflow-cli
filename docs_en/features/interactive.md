---
sidebar_position: 1
hide_title: true
---

# Interactive Mode

> **Feature Overview**: iFlow CLI provides multiple flexible interaction methods, supporting text input, image processing, file references, and intelligent multimodal processing.
> 
> **Learning Time**: 10-15 minutes
> 
> **Prerequisites**: iFlow CLI installed and configured, understanding basic command line operations

## What is Interactive Mode

Interactive mode is the core functionality of iFlow CLI, allowing users to engage in natural conversations and collaboration with AI through multiple methods. The system supports various input forms including text, images, and file references, and provides intelligent multimodal processing capabilities that enable any model to "understand" image content.

## Core Features

| Feature | Description | Platform Support |
|---------|-------------|-------------------|
| Multiple Input Methods | Various input forms including text, images, file references | All platforms |
| Intelligent Multimodal Processing | Enables any model to "understand" image content | All platforms |
| Automatic Content Detection | Intelligently recognizes and processes different types of input content | All platforms |
| Large Text Optimization | Automatically handles long text with optimized interface display | All platforms |
| Real-time Response | Processes user input in real-time without waiting | All platforms |

## How It Works

### Input Processing Flow

```
User Input → Content Type Detection → Preprocessing → Model Adaptation → AI Response
    ↓
[Text/Image/File] → [Auto Recognition] → [Format Optimization] → [Multimodal Processing] → [Generate Reply]
```

### Intelligent Adaptation Mechanism

- **Text Input**: Directly passed to AI model for processing
- **Image Input**: Automatically detects model capabilities, generates image descriptions when necessary
- **File References**: Reads file content and integrates into conversation context
- **Mixed Input**: Intelligently combines different types of input content

## Detailed Feature Description

### Text Input

#### Single Line Text
Directly input your questions or instructions in the command line interface:
```bash
> Help me optimize the performance of this React component
```

#### Multi-line Text Input
Supports multiple methods for multi-line text input:

| Method | Operation | Description |
|--------|-----------|-------------|
| Backslash newline | `\` + `Enter` | Quick multi-line input creation |
| Shift + Enter | `Shift` + `Enter` | Available after terminal configuration |

Example:
```bash
> Please help me implement a user management system, including:\
  1. User registration and login functionality
  2. User information CRUD operations
  3. Permission management
  4. Data persistence
```

### Image Processing

#### Supported Image Formats

| Format | Extensions | Description |
|--------|-----------|-------------|
| PNG | .png | High-quality images with transparency support |
| JPEG | .jpg, .jpeg | Compressed image format |
| GIF | .gif | Supports animated images |
| WebP | .webp | Modern image format |
| BMP | .bmp | Bitmap format |

#### Image Input Methods

**Screenshot Pasting**

| Platform | Screenshot Shortcut | Paste Shortcut |
|----------|-------------------|----------------|
| Windows | `Win + Shift + S` | `Ctrl + V` |
| macOS | `Cmd + Shift + 4` | `Cmd + V` |
| Linux | `PrtScn` or others | `Ctrl + V` |

Operation steps:
1. Use system screenshot tool to capture the screen area you want to analyze
2. Press paste shortcut in iFlow CLI
3. System automatically generates image placeholder and processes it

**File Pasting**
- Copy image files in file manager
- Use paste shortcut in CLI

Display effect after pasting:
```bash
> [Pasted image #1] What's wrong with this interface?
```

Note that native terminals, iTerm terminals, and IDE built-in terminals will forcibly filter out image paste events, causing image pasting to fail when using platform native paste shortcuts (for example, using `Cmd + V` to paste images on macOS is ineffective). In this case, you can use `Ctrl + V` or `Shift + Ctrl + V` to bypass this filter and paste images.

#### Image Processing Examples

```bash
> [Pasted image #1] Please analyze the design issues of this user interface
> [Pasted image #2] Which of these two interface layouts is better?
> Help me write the corresponding CSS code based on [Pasted image #1] this design draft
```

### Large Text Processing

#### Automatic Detection Rules

| Detection Item | Threshold | Processing Method |
|----------------|-----------|-------------------|
| Long text paste | >800 characters | Generate text placeholder |
| Long content display | >5000 characters | Truncated display optimization |
| Placeholder format | - | `[Pasted text #X +Y lines]` |

#### Interface Optimization Features

- **Visual Simplicity**: Avoids long text causing scrolling chaos in terminal
- **Content Integrity**: Although display is optimized, model still receives complete original text
- **Smart Truncation**: Shows first 2000 characters and last 2000 characters, with middle content collapsed
- **Clear Identification**: Placeholder clearly identifies text block line count for easy content scale recognition

#### Usage Examples

```bash
> Please help me refactor this code: [Pasted text #1 +45 lines]
> Analyze the errors in this log file: [Pasted text #2 +120 lines]
```

#### Operation Flow

1. Copy large amounts of text content to clipboard
2. Press `Ctrl/Cmd + V` in CLI
3. System automatically generates placeholder and saves original content
4. Continue inputting your questions or instructions

### File References

#### Reference Methods

| Type | Syntax | Example |
|------|--------|---------|
| Single file | `@filepath` | `@src/App.tsx` |
| Directory reference | `@directorypath` | `@src/components` |
| Multiple files | Space separated | `@file1.ts @file2.ts` |

#### Usage Examples

**Single File Reference**
```bash
> Help me optimize the @src/components/UserProfile.tsx component
> Please explain the API design philosophy in @docs/api.md
```

**Directory Reference**
```bash
> Analyze the utility functions in the @src/utils directory
> Refactor the component structure in the @src/components directory
```

**Multiple File References**
```bash
> Compare the differences between @src/old-component.tsx and @src/new-component.tsx
> Optimize project structure based on @package.json and @tsconfig.json configurations
```

### Intelligent Multimodal Processing

#### Core Features

The unique aspect of iFlow CLI lies in its intelligent multimodal processing mechanism, enabling any model to "see" images.

#### How It Works

**Automatic Image Description Generation**

| Step | Operation | Description |
|------|-----------|-------------|
| 1 | Model capability detection | Checks if main model supports multimodal |
| 2 | Multimodal call | Automatically calls multimodal model when not supported |
| 3 | Description generation | Generates detailed image description information |
| 4 | Content integration | Passes description to main model for processing |

**Description Content Includes**
- Overall layout and composition
- Main objects and positional relationships
- Color information and visual features
- Text content (complete transcription)
- Background environment and detail features

#### Registration Configuration

**iFlow AI Login Method**

| Item | Description |
|------|-------------|
| Recommended Choice | System-provided models are all optimized |
| Automatic Processing | Automatically uses `qwen-vl-max` to generate image descriptions |
| Configuration Needs | No manual configuration needed, fully automated |

**OpenAI Compatible Login Method**

| Configuration Item | Description | Required |
|--------------------|-------------|----------|
| Main model name | Specify the primary model to use | Yes |
| Multimodal model | Used for image description generation | No |
| Skip configuration | Send directly to main model | No |

#### Performance Notes

| Item | Description |
|------|-------------|
| Advantage | Enables all models to have image understanding capabilities |
| Note | Non-multimodal models process images slightly slower (because image descriptions need to be generated first, then input to the main model for understanding) |
| Recommendation | For frequent multimodal needs, recommend using multimodal models directly |

### Keyboard Shortcuts

#### Basic Shortcuts

| Function | Shortcut | Description |
|----------|----------|-------------|
| Cancel operation | `Ctrl/Cmd + C` | Cancel current input or generation |
| Exit program | `Ctrl/Cmd + D` | Exit CLI session |
| Clear screen | `Ctrl/Cmd + L` | Clear terminal screen |
| Command history | `↑/↓` | Browse command history |

#### Input Related

| Function | Shortcut | Description |
|----------|----------|-------------|
| Paste content | `Ctrl/Cmd + V` | Automatically detects images, text |
| Multi-line input | `\` + `Enter` | Backslash newline |
| Multi-line input | `Shift/Option + Enter` | Based on terminal configuration |

#### Vim Mode

After enabling with `/vim` command, supports:

| Operation | Key | Description |
|-----------|-----|-------------|
| Cursor movement | `h/j/k/l` | Left/Down/Up/Right |
| Delete line | `dd` | Delete current line |
| Delete character | `x` | Delete current character |

## Usage Examples

### Common Scenarios

#### UI Design Analysis
```bash
> [Pasted image #1] Please analyze the user experience issues of this login page
```

#### Code Debugging
```bash
> [Pasted image #1] How to solve the problem shown in this error screenshot?
```

#### File Analysis
```bash
> Please analyze the performance issues of @src/components/Header.tsx and provide optimization suggestions
```

#### Complex Problems
```bash
> Please help me implement a user management system, including:\
  1. User registration and login functionality
  2. User information CRUD operations
  3. Permission management
  4. Data persistence
```

### Best Practices

#### Image Usage Tips
- **UI Design Analysis**: Screenshot interfaces then ask for design improvement suggestions
- **Code Debugging**: Paste error screenshots to quickly locate problems
- **Document Understanding**: Upload charts, flowcharts and other complex visual content
- **Comparative Analysis**: Paste multiple images simultaneously for comparison

#### Text Processing Optimization
- **Large File Handling**: Use automatic placeholder feature to handle long code or logs
- **Structured Questioning**: Use multi-line input to organize complex questions
- **Context References**: Combine `@` file references to provide complete context

#### Model Selection Recommendations
- **Pure Text Tasks**: Text models are sufficient and faster
- **Occasional Image Needs**: Continue using text models, automatically handle images
- **Frequent Multimodal**: Choose multimodal models for best experience

## Troubleshooting

### Common Issues and Solutions

| Issue | Possible Cause | Solution |
|-------|---------------|----------|
| Image paste failure | Unsupported format or no clipboard data | Check image format, re-screenshot or copy |
| Invalid file reference | Incorrect path or file doesn't exist | Confirm file path is correct and file is accessible |
| Multi-line input abnormal | Terminal configuration issue | Try different newline shortcut combinations |
| Multimodal processing error | Incorrect model configuration | Check model support and configuration |
| Large text upload failure | Content too large or network issues | Upload in segments or check network connection |

### Diagnostic Steps

1. **Permission Check**
   - Confirm system allows CLI access to clipboard
   - Check file read permissions

2. **Network Connection**
   - Confirm network connection is normal (multimodal processing requires API calls)
   - Check firewall settings

3. **Configuration Verification**
   - Review error message information
   - Adjust operations based on prompts
   - Restart CLI to ensure configuration takes effect

### Platform Compatibility

| Platform | Support Status | Notes |
|----------|---------------|-------|
| Windows | Full support | Note path separators |
| macOS | Full support | System permissions may need authorization |
| Linux | Full support | Depends on system clipboard tools |