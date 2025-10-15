---
sidebar_position: 4
hide_title: true
---

# Output Styles

> **Feature Overview**: Output styles allow you to adapt iFlow CLI for uses beyond software engineering, customizing the AI assistant's behavior patterns.
> 
> **Learning Time**: 10-15 minutes
> 
> **Prerequisites**: iFlow CLI installed and configured, understanding of basic configuration concepts

## What are Output Styles

Output styles allow you to use iFlow CLI for any type of task while maintaining its core functionality such as running local scripts, reading and writing files, and tracking TODOs.

## Built-in Output Styles

iFlow CLI's **Default** output style is the existing system prompt designed to help you efficiently complete software engineering tasks.

There are two additional built-in output styles that focus on providing more detailed explanations and helping you learn:

* **Explanatory**: Provides educational "insights" while helping you complete software engineering tasks. Helps you understand implementation choices and codebase patterns.

* **Learning**: A collaborative learn-as-you-go mode where iFlow CLI not only shares "insights" during coding but also asks you to contribute small, strategic code snippets yourself. iFlow CLI will add `TODO(human)` markers in your code for you to implement.

## How Output Styles Work

Output styles directly modify iFlow CLI's system prompt.

* Non-default output styles exclude instructions specific to code generation and efficient output that are typically built into iFlow CLI (such as concise responses and code verification through testing)
* Instead, these output styles add their own custom instructions to the system prompt.

## Changing Your Output Style

You can:

* Run `/output-style` to access the menu and select your output style

* Run `/output-style [style]`, such as `/output-style explanatory`, to directly switch to a specific style

## Creating Custom Output Styles

To set up a new output style with iFlow's help, run
`/output-style:new I want an output style that ...`

By default, output styles created through `/output-style:new` are saved as markdown files at the user level in `~/.iflow/output-styles` and can be used across projects. They have the following structure:

```markdown
---
name: My Custom Style
description:
  A brief description of what this style does, to be displayed to the user
---

# Custom Style Instructions

You are an interactive CLI tool that helps users with software engineering
tasks. [Your custom instructions here...]

## Specific Behaviors

[Define how the assistant should behave in this style...]
```

You can also create your own output style Markdown files and save them at the user level (`~/.iflow/output-styles`) or project level (`.iflow/output-styles`).

## Comparison with Related Features

### Output Styles vs. IFLOW.md

Output styles completely remove the output style-specific parts from iFlow CLI's default system prompt. IFLOW.md does not edit iFlow CLI's default system prompt. IFLOW.md adds content as user messages after iFlow CLI's default system prompt.

### Output Styles vs. SubAgent

Output styles directly affect the main agent loop and only affect the system prompt. SubAgents are called to handle specific tasks and can include additional settings such as which model to use, what tools they have available, and some context about when to use the agent.

### Output Styles vs. Custom Slash Commands

You can think of output styles as "stored system prompts" and custom slash commands as "stored prompts".