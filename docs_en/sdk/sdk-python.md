---
title: Building Agents with SDK
description: Build your custom Agent projects with iFlow CLI SDK
sidebar_position: 8
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# SDK

## Overview

iFlow CLI SDK is an SDK for programmatic interaction with iFlow CLI. It allows developers to build AI-driven applications with conversation, tool execution, and task planning capabilities through the Agent Communication Protocol (ACP).

**✨ Core Feature: SDK automatically manages iFlow processes - no manual configuration needed!**

Currently provides **Python SDK**, with Java version coming soon!

## System Requirements

- **Python**: 3.8 or higher
- **iFlow CLI**: 0.2.24 or higher
- **Operating System**: Windows, macOS, Linux

## Installation

```bash
pip install iflow-cli-sdk
```

## Quick Start

### Basic Example

The SDK automatically detects and starts iFlow processes without manual configuration:

```python
import asyncio
from iflow_sdk import IFlowClient, AssistantMessage, TaskFinishMessage

async def main():
    # SDK automatically handles:
    # 1. Detect if iFlow is installed
    # 2. Start iFlow process (if not running)
    # 3. Find available port and establish connection
    # 4. Automatically clean up resources on exit
    async with IFlowClient() as client:
        await client.send_message("Hello, iFlow!")

        async for message in client.receive_messages():
            if isinstance(message, AssistantMessage):
                print(message.chunk.text, end="\n", flush=True)
            elif isinstance(message, TaskFinishMessage):
                break

asyncio.run(main())
```

### Simple Query

The simplest way to use it is through the `query` function:

```python
from iflow_sdk import query
import asyncio

async def main():
    response = await query("What is the capital of France?")
    print(response)  # Output: The capital of France is Paris.

asyncio.run(main())
```

## Core Concepts

### IFlowClient

`IFlowClient` is the main interface for interacting with iFlow CLI, managing the WebSocket connection lifecycle:

```python
from iflow_sdk import IFlowClient, IFlowOptions

# Use default configuration (auto-manage process)
async with IFlowClient() as client:
    await client.send_message("Your question")
    async for message in client.receive_messages():
        # Handle messages
        pass

# Use custom configuration
options = IFlowOptions(
    url="ws://localhost:8090/acp",  # WebSocket URL
    auto_start_process=True,         # Auto-start iFlow
    timeout=30.0                     # Timeout (seconds)
)
async with IFlowClient(options) as client:
    await client.send_message("Your question")
    async for message in client.receive_messages():
        # Handle messages
        pass
```

### Message Types

The SDK supports various message types corresponding to different iFlow protocol responses:

#### AssistantMessage - AI Assistant Response

Includes AgentInfo support to get detailed agent information:

```python
import asyncio
from iflow_sdk import IFlowClient, AssistantMessage, TaskFinishMessage, AgentInfo

async def handle_assistant_message():
    async with IFlowClient() as client:
        await client.send_message("Please introduce Python")

        async for message in client.receive_messages():
            if isinstance(message, AssistantMessage):
                print(message.chunk.text, end="\n", flush=True)

                # Access agent information (if available)
                if message.agent_info:
                    print(f"Agent ID: {message.agent_info.agent_id}")
                    if message.agent_info.task_id:
                        print(f"Task ID: {message.agent_info.task_id}")
                    if message.agent_info.agent_index is not None:
                        print(f"Agent Index: {message.agent_info.agent_index}")

            elif isinstance(message, TaskFinishMessage):
                break

if __name__ == "__main__":
    asyncio.run(handle_assistant_message())
```

#### ToolCallMessage - Tool Calls

Tool call messages now also include AgentInfo information and tool names:

```python
import asyncio
from iflow_sdk import IFlowClient, ToolCallMessage, ToolCallStatus, TaskFinishMessage

async def handle_tool_calls():
    async with IFlowClient() as client:
        # Note: This example shows how to view tool call messages
        # iFlow will require full path and content to create files
        await client.send_message("List files in the current directory")

        async for message in client.receive_messages():
            if isinstance(message, ToolCallMessage):
                print(f"Status: {message.status}")

                # New: Tool name
                if message.tool_name:
                    print(f"Tool Name: {message.tool_name}")

                # Access agent information
                if message.agent_info:
                    print(f"Agent ID: {message.agent_info.agent_id}")

            elif isinstance(message, TaskFinishMessage):
                break

if __name__ == "__main__":
    asyncio.run(handle_tool_calls())
```

#### PlanMessage - Task Planning

```python
import asyncio
from iflow_sdk import IFlowClient, PlanMessage, TaskFinishMessage

async def show_plan():
    async with IFlowClient() as client:
        await client.send_message("Help me create a Python project structure")

        async for message in client.receive_messages():
            if isinstance(message, PlanMessage):
                print("Execution Plan:")
                for entry in message.entries:
                    status_icon = "✅" if entry.status == "completed" else "⏳"
                    print(f"{status_icon} [{entry.priority}] {entry.content}")
            elif isinstance(message, TaskFinishMessage):
                break

if __name__ == "__main__":
    asyncio.run(show_plan())
```

#### TaskFinishMessage - Task Completion

```python
import asyncio
from iflow_sdk import IFlowClient, AssistantMessage, TaskFinishMessage, StopReason

async def check_completion():
    async with IFlowClient() as client:
        await client.send_message("Calculate 1+1")

        async for message in client.receive_messages():
            if isinstance(message, AssistantMessage):
                print(message.chunk.text, end="", flush=True)
            elif isinstance(message, TaskFinishMessage):
                print()  # New line
                if message.stop_reason == StopReason.END_TURN:
                    print("Task completed successfully")
                elif message.stop_reason == StopReason.MAX_TOKENS:
                    print("Maximum token limit reached")
                break  # TaskFinishMessage indicates end of conversation

if __name__ == "__main__":
    asyncio.run(check_completion())
```

## Common Use Cases

### Interactive Chatbot

```python
#!/usr/bin/env python3
import asyncio
from iflow_sdk import IFlowClient, AssistantMessage, TaskFinishMessage

async def chatbot():
    print("iFlow Chatbot (type 'quit' to exit)")
    print("-" * 50)

    async with IFlowClient() as client:
        while True:
            user_input = input("\nYou: ")

            if user_input.lower() in ['quit', 'exit', 'q']:
                print("Goodbye!")
                break

            await client.send_message(user_input)

            print("iFlow: ", end="", flush=True)
            async for message in client.receive_messages():
                if isinstance(message, AssistantMessage):
                    print(message.chunk.text, end="", flush=True)
                elif isinstance(message, TaskFinishMessage):
                    print()  # New line
                    break

if __name__ == "__main__":
    asyncio.run(chatbot())
```

### Streaming Response Handling

```python
from iflow_sdk import query_stream
import asyncio

async def stream_example():
    prompt = "Explain what sublimation is"

    # query_stream returns an async generator of text chunks
    async for chunk in query_stream(prompt):
        print(chunk, end="", flush=True)
    print()  # Final new line

asyncio.run(stream_example())
```


## Advanced Configuration

### Manual Process Management

If you need to manually manage iFlow processes:

```python
import asyncio
from iflow_sdk import IFlowClient, IFlowOptions, AssistantMessage, TaskFinishMessage

async def manual_process_example():
    # Disable automatic process management
    options = IFlowOptions(
        auto_start_process=False,
        url="ws://localhost:8090/acp"  # Connect to existing iFlow
    )

    async with IFlowClient(options) as client:
        await client.send_message("Your question")
        async for message in client.receive_messages():
            if isinstance(message, AssistantMessage):
                print(message.chunk.text, end="", flush=True)
            elif isinstance(message, TaskFinishMessage):
                break

if __name__ == "__main__":
    asyncio.run(manual_process_example())
```

> Note
> Manual mode requires you to start iFlow separately:
>```bash
>iflow --experimental-acp --port 8090
>```

### Error Handling

The SDK provides detailed error handling mechanisms:

```python
import asyncio
from iflow_sdk import IFlowClient, ConnectionError, TimeoutError, AssistantMessage, TaskFinishMessage

async def error_handling_example():
    try:
        async with IFlowClient() as client:
            await client.send_message("Test")
            async for message in client.receive_messages():
                if isinstance(message, AssistantMessage):
                    print(message.chunk.text, end="", flush=True)
                elif isinstance(message, TaskFinishMessage):
                    break
    except ConnectionError as e:
        print(f"Connection error: {e}")
    except TimeoutError as e:
        print(f"Timeout error: {e}")
    except Exception as e:
        print(f"Unknown error: {e}")

if __name__ == "__main__":
    asyncio.run(error_handling_example())
```

### Synchronous Calls

For scenarios requiring synchronous calls:

```python
from iflow_sdk import query_sync, IFlowOptions

# Synchronous call with timeout control
options = IFlowOptions(timeout=30.0)
response = query_sync("Your question", options=options)
print(response)
```

## API Reference

### Core Classes

| Class Name | Description |
|------------|-------------|
| `IFlowClient` | Main client class for managing connections to iFlow |
| `IFlowOptions` | Configuration options class |
| `RawDataClient` | Client for accessing raw protocol data |

### Message Types

| Message Type | Description | Main Attributes |
|--------------|-------------|----------------|
| `AssistantMessage` | AI assistant text responses | `chunk.text`, `agent_id`, `agent_info` |
| `ToolCallMessage` | Tool execution requests and status | `label`, `status`, `tool_name`, `agent_info` |
| `PlanMessage` | Structured task plans | `entries` (containing `content`, `priority`, `status`) |
| `TaskFinishMessage` | Task completion signals | `stop_reason` |

### AgentInfo - Agent Information

The new `AgentInfo` class provides detailed information parsed from iFlow agent IDs:

| Attribute | Type | Description |
|-----------|------|-------------|
| `agent_id` | `str` | Complete agent ID |
| `agent_index` | `Optional[int]` | Agent index within the task |
| `task_id` | `Optional[str]` | Task or instance ID |
| `timestamp` | `Optional[int]` | Creation timestamp |

#### AgentInfo Usage Example

```python
from iflow_sdk import AgentInfo

# Parse information from agent ID
agent_id = "subagent-task-abc123-2-1735123456789"
agent_info = AgentInfo.from_agent_id_only(agent_id)

if agent_info:
    print(f"Agent ID: {agent_info.agent_id}")
    print(f"Task ID: {agent_info.task_id}")
    print(f"Agent Index: {agent_info.agent_index}")
    print(f"Timestamp: {agent_info.timestamp}")
```



## Troubleshooting

### Connection Issues

If you encounter connection errors, check:

1. **Is iFlow installed**
   ```bash
   iflow --version
   ```

2. **Is the port occupied**
   ```bash
   # Linux/Mac
   lsof -i :8090

   # Windows
   netstat -an | findstr :8090
   ```

3. **Manual connection testing**
   ```bash
   iflow --experimental-acp --port 8090
   ```

### Timeout Issues

For long-running tasks, you can increase the timeout:

```python
from iflow_sdk import IFlowClient, IFlowOptions

options = IFlowOptions(timeout=600.0)  # 10-minute timeout
client = IFlowClient(options)
```

### Debug Logging

Enable verbose logging for debugging:

```python
import logging
from iflow_sdk import IFlowClient, IFlowOptions

# Set logging level
logging.basicConfig(level=logging.DEBUG)

options = IFlowOptions(log_level="DEBUG")
client = IFlowClient(options)
```

