---
sidebar_position: 3
hide_title: true
---

# Keyboard Shortcuts

This document provides detailed information about various keyboard shortcuts available in the command line interface, helping you interact with AI more efficiently.

## Usage Instructions

This guide is organized by functional modules, with detailed explanations for each shortcut. We recommend first familiarizing yourself with basic shortcuts, then gradually mastering advanced features.

## Basic Function Shortcuts

The following are the most commonly used basic shortcuts, recommended for priority mastery:

| Shortcut | Function | Use Case |
| -------- | -------- | -------- |
| `Esc`  | Close dialogs and suggestion windows | When you want to cancel current operation |
| `Ctrl+C`  | Exit application (requires double confirmation) | End CLI session |
| `Ctrl+D`  | Exit application when input is empty (requires double confirmation) | Quick exit from blank state |
| `Ctrl+L`  | Clear screen | Clean screen when interface has too much content |
| `Ctrl+S`  | Show complete response content, disable truncation | View full content of long responses |
| `Shift+Tab` / `Alt+M`  | Switch modes | Quickly switch between different working modes |

## Debug and Display Control

These shortcuts are used to control interface display and debugging features:

| Shortcut | Function | Applicable Scenario |
| -------- | -------- | -------- |
| `Ctrl+O`  | Toggle debug console display | View detailed information during development debugging |
| `Ctrl+T`  | Toggle tool description display | When you want to understand tool functionality |
| `Ctrl+Y`  | Toggle auto-approval mode (YOLO mode) | Use when trusting all tool calls |

## Input Editing Shortcuts

### Basic Input Operations

| Shortcut | Function | Usage Tips |
| -------- | -------- | -------- |
| `Enter`  | Submit current input | Confirm and send after completing input |
| `\` (at line end) + `Enter`  | Insert line break | Use when inputting multi-line content |
| `!`  | Switch to shell mode when input is empty | Quickly execute system commands |
| `Tab`  | Auto-complete current suggestion | Improve input efficiency |

### Cursor Movement

| Shortcut | Function |
| -------- | -------- |
| `Ctrl+A` / `Home`  | Move cursor to beginning of line |
| `Ctrl+E` / `End`  | Move cursor to end of line |
| `Ctrl+B` / `Left Arrow`  | Move cursor left one character |
| `Ctrl+F` / `Right Arrow`  | Move cursor right one character |
| `Ctrl+Left Arrow` / `Meta+Left` / `Meta+B`  | Move cursor left one word |
| `Ctrl+Right Arrow` / `Meta+Right` / `Meta+F`  | Move cursor right one word |

### Delete Operations

| Shortcut | Function |
| -------- | -------- |
| `Ctrl+H` / `Backspace`  | Delete character to the left of cursor |
| `Ctrl+D` / `Delete`  | Delete character to the right of cursor |
| `Ctrl+W` / `Meta+Backspace` / `Ctrl+Backspace`  | Delete word to the left of cursor |
| `Meta+Delete` / `Ctrl+Delete`  | Delete word to the right of cursor |
| `Ctrl+U`  | Delete from cursor to beginning of line |
| `Ctrl+K`  | Delete from cursor to end of line |
| `Ctrl+C`  | Clear input prompt box |

### History and Clipboard

| Shortcut | Function | Usage Tips |
| -------- | -------- | -------- |
| `Up Arrow` / `Ctrl+P`  | Browse previous input history | Reuse previous commands |
| `Down Arrow` / `Ctrl+N`  | Browse next input history | Navigate through history |
| `Ctrl+V`  | Paste clipboard content | Supports text and image pasting |
| `Ctrl+X` / `Meta+Enter`  | Open current input in external editor | More convenient for editing long text |

## Suggestion Selection Shortcuts

When the system displays suggestion lists, use the following shortcuts:

| Shortcut | Function |
| -------- | -------- |
| `Up Arrow`  | Browse suggestions upward |
| `Down Arrow`  | Browse suggestions downward |
| `Tab` / `Enter`  | Accept selected suggestion |

## Option Selection Shortcuts

Use in radio button interfaces:

| Shortcut | Function |
| -------- | -------- |
| `Up Arrow` / `k`  | Move selection up |
| `Down Arrow` / `j`  | Move selection down |
| `Enter`  | Confirm selection |
| `1-9`  | Directly select option with corresponding number |
| Multi-digit numbers  | Press digits in quick succession to select options greater than 9 |

## Usage Tips

1. **Beginner Recommendation**: First master basic shortcuts like `Ctrl+C`, `Enter`, `Ctrl+L`
2. **Efficiency Improvement**: Proficiently use `Tab` auto-completion and arrow key history features
3. **Advanced Usage**: Combining `Ctrl+Y` auto-approval mode can accelerate workflows
4. **Debugging Help**: Use `Ctrl+O` to view debugging information when encountering problems

## Special Notes

- **Image Support**: Use `Ctrl+V` to directly paste images, the system will automatically save and insert references in input
- **External Editor**: `Ctrl+X` can invoke the system default editor, convenient for editing long text
- **Safe Exit**: Both `Ctrl+C` and `Ctrl+D` require double confirmation to exit, avoiding accidental operations

We hope this guide helps you use iFlow CLI better! If you have any questions, feel free to ask anytime.