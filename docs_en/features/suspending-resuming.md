---
sidebar_position: 21
hide_title: true
---

# Suspend and Resume

> **Feature Overview**: iFlow CLI supports suspending (pausing) current tasks in interactive sessions and resuming them when needed.
> 
> **Learning Time**: 5 minutes
> 
> **Prerequisites**: Familiarity with basic command line operations such as `ctrl+z` and `fg`.

## What is Suspend and Resume

In iFlow CLI's interactive sessions, you may need to temporarily interrupt a currently running task to execute another higher-priority operation. The suspend and resume functionality allows you to use standard terminal commands to pause (suspend) the current iFlow session, then return (resume) to where you left off when you're ready.

This feature leverages the Job Control capabilities of most modern shells (such as bash, zsh).

## Core Operations

| Operation | Command | Description |
|-----------|---------|-------------|
| Suspend | `ctrl+z` | Pauses the currently running iFlow process in the foreground and puts it in the background. |
| Resume | `fg` or `fg %<job_number>` | Brings a background task back to the foreground to continue running. `fg` resumes the most recent task by default. Use `fg %1`, `fg %2`, etc. to resume specific tasks. |

You can use the `jobs` command to view all background tasks and their numbers.

## Workflow

1. **Start interactive session**: Run `iflow` to enter interactive mode.
2. **Execute task**: Interact with iFlow in the session, for example, run a script or ask a question.
3. **Need to interrupt**: Suppose you need to check another file or run a quick command, but don't want to terminate the current iFlow session.
4. **Suspend session**: Press `ctrl+z`. The iFlow CLI process will be paused, and you'll return to your shell prompt.
5. **Execute other tasks**: Perform any other commands you need in the shell.
6. **Resume session**: When you're ready to return to iFlow, type the `fg` command.
7. **Continue interaction**: You'll return to the iFlow session where you left off and can continue from where you were interrupted.

## Use Cases

- **Temporarily view information**: When conversing with iFlow, need to quickly check a file's content or verify some information.
- **Execute system commands**: Need to run a system command (like `git status` or `ls -l`) to get context for better questions to iFlow.
- **Multitasking**: Manage multiple tasks in one terminal window without needing to open new terminal tabs for each task.

## Example

Suppose you're using iFlow to write code:

1. **Start iFlow**:
    ```bash
    iflow
    ```
    You've entered iFlow's interactive session.

2. **Start a task**:
    ```
    >>> "Write a python hello world"
    ```
    iFlow starts generating code.

3. **Need to check file**:
    You suddenly remember you need to check if there's already a `hello.py` file in the current directory.

4. **Suspend iFlow**:
    Press `ctrl+z`.
    ```
    zsh: suspended  iflow
    ```
    You're back to the zsh (or your default shell) prompt.

5. **Check file**:
    ```bash
    ls
    ```
    You see there's no `hello.py` in the directory.

6. **Resume iFlow**:
    Type `fg`.
    ```bash
    fg
    [1]  + continued  iflow
    ```
    You're back in the iFlow session, can see iFlow resumes the previous history, and is waiting for your next instruction.

This functionality makes using iFlow CLI more flexible, seamlessly integrating into your existing command-line workflow.