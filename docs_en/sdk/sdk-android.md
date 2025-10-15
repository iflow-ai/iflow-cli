---
title: Build Agent with SDK
description: Build your dedicated Agent project with iFlow CLI SDK
sidebar_position: 8
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# SDK

## Overview

The iFlow Android SDK is an Android SDK for programmatic interaction with iFlow CLI. It enables developers to build AI-driven applications with conversation, tool execution, and task planning capabilities through the Agent Communication Protocol (ACP).

Currently provides **Android SDK** with support for simple queries and full bidirectional client for complex interactions.

## System Requirements

- **Android API**: 21+ (Android 5.0 Lollipop or higher)
- **Kotlin**: 1.8 or higher
- **iFlow CLI**: Requires WebSocket access

## Dependencies

Add to your `build.gradle`:

```kotlin
dependencies {
    // OkHttp for WebSocket
    implementation 'com.squareup.okhttp3:okhttp:4.12.0'

    // Gson for JSON
    implementation 'com.google.code.gson:gson:2.10.1'

    // Coroutines
    implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3'
}
```

## Quick Start

### Basic Example

Use `IFlowClient` for basic conversational interaction:

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

val options = IFlowOptions()

IFlowClient(options).use { client ->
    client.connect()
    client.sendMessage("Hello, iFlow!")

    client.receiveMessages { message ->
        when (message) {
            is AssistantMessage -> {
                println(message.chunk.text)
            }
            is TaskFinishMessage -> {
                return@receiveMessages // Completed
            }
        }
    }
}
```

### Simple Query

The simplest way to use is through the `IFlowQuery.query` function:

```kotlin
import com.iflow.sdk.query.IFlowQuery

// Simple one-click query
val result = IFlowQuery.query("What is 2 + 2?")
println(result) // "2 + 2 equals 4."
```

## Core Concepts

### IFlowClient

`IFlowClient` is the main interface for interacting with iFlow CLI, managing the WebSocket connection lifecycle:

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions

// Using default configuration
val options = IFlowOptions()
IFlowClient(options).use { client ->
    client.connect()
    client.sendMessage("Your question")

    client.receiveMessages { message ->
        // Handle messages
    }
}

// Using custom configuration
val options = IFlowOptions(
    url = "ws://localhost:8090/acp?peer=iflow",
    timeout = 300_000L, // 5 minutes
    permissionMode = PermissionMode.AUTO
)
IFlowClient(options).use { client ->
    client.connect()
    client.sendMessage("Your question")

    client.receiveMessages { message ->
        // Handle messages
    }
}
```

### Message Types

The SDK supports multiple message types corresponding to different responses from the iFlow protocol:

#### AssistantMessage - AI Assistant Response

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

fun handleAssistantMessage() {
    val options = IFlowOptions()

    IFlowClient(options).use { client ->
        client.connect()
        client.sendMessage("Please introduce Kotlin")

        client.receiveMessages { message ->
            when (message) {
                is AssistantMessage -> {
                    println(message.chunk.text)
                }
                is TaskFinishMessage -> {
                    return@receiveMessages
                }
            }
        }
    }
}
```

#### ToolCallMessage - Tool Calls

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

fun handleToolCalls() {
    val options = IFlowOptions(
        permissionMode = PermissionMode.MANUAL
    )

    IFlowClient(options).use { client ->
        client.connect()
        client.sendMessage("List files in current directory")

        client.receiveMessages { message ->
            when (message) {
                is ToolCallMessage -> {
                    println("Tool call: ${message.label}")
                    println("Status: ${message.status}")

                    // Handle tool confirmation
                    if (message.confirmation?.required == true) {
                        client.approveToolCall(message.id)
                    }
                }
                is TaskFinishMessage -> {
                    return@receiveMessages
                }
            }
        }
    }
}
```

#### PlanMessage - Task Plans

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

fun showPlan() {
    val options = IFlowOptions()

    IFlowClient(options).use { client ->
        client.connect()
        client.sendMessage("Help me create an Android project structure")

        client.receiveMessages { message ->
            when (message) {
                is PlanMessage -> {
                    println("Execution plan:")
                    message.entries.forEach { entry ->
                        val statusIcon = if (entry.status == "completed") "✅" else "⏳"
                        println("$statusIcon [${entry.priority}] ${entry.content}")
                    }
                }
                is TaskFinishMessage -> {
                    return@receiveMessages
                }
            }
        }
    }
}
```

#### TaskFinishMessage - Task Completion

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

fun checkCompletion() {
    val options = IFlowOptions()

    IFlowClient(options).use { client ->
        client.connect()
        client.sendMessage("Calculate 1+1")

        client.receiveMessages { message ->
            when (message) {
                is AssistantMessage -> {
                    print(message.chunk.text)
                }
                is TaskFinishMessage -> {
                    println() // New line
                    println("Task completed: ${message.stopReason}")
                    return@receiveMessages
                }
            }
        }
    }
}
```

## Common Use Cases

### Interactive Chatbot

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

fun chatbot() {
    println("iFlow Chatbot (type 'quit' to exit)")
    println("-".repeat(50))

    val options = IFlowOptions()

    IFlowClient(options).use { client ->
        client.connect()

        while (true) {
            print("\nYou: ")
            val userInput = readLine() ?: break

            if (userInput.lowercase() in listOf("quit", "exit", "q")) {
                println("Goodbye!")
                break
            }

            client.sendMessage(userInput)

            print("iFlow: ")
            client.receiveMessages { message ->
                when (message) {
                    is AssistantMessage -> {
                        print(message.chunk.text)
                    }
                    is TaskFinishMessage -> {
                        println() // New line
                        return@receiveMessages
                    }
                }
            }
        }
    }
}

fun main() {
    chatbot()
}
```

### Streaming Response Handling

```kotlin
import com.iflow.sdk.query.IFlowQuery

fun streamExample() {
    // Streaming response
    IFlowQuery.queryStream(
        text = "Explain what sublimation is",
        onChunk = { chunk -> print(chunk) },
        onComplete = { reason -> println("\nCompleted!") }
    )
}
```

## Advanced Configuration

### Permission Mode Configuration

Configure permission management for tool calls:

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

// Auto-approve all tools
val autoOptions = IFlowOptions(
    permissionMode = PermissionMode.AUTO
)

// Ask for confirmation every time
val manualOptions = IFlowOptions(
    permissionMode = PermissionMode.MANUAL
)

// Selective approval
val selectiveOptions = IFlowOptions(
    permissionMode = PermissionMode.SELECTIVE
)
```

### Session Configuration

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

val options = IFlowOptions(
    url = "ws://localhost:8090/acp?peer=iflow",
    timeout = 300_000L, // 5 minutes
    permissionMode = PermissionMode.AUTO,
    fileAccess = true,
    fileReadOnly = true,
    authMethodId = "iflow",
    sessionSettings = SessionSettings(
        workingDirectory = "/workspace"
    )
)
```

### File Attachment Support

The SDK supports multiple file types:

- **Images**: PNG, JPG, GIF, WebP, SVG (base64 encoded)
- **Audio**: MP3, WAV, M4A, OGG, FLAC (base64 encoded)
- **Documents**: PDF, TXT, code files (resource links)

```kotlin
client.sendMessage(
    text = "Analyze these files",
    files = listOf(
        "/path/to/image.png",
        "/path/to/audio.mp3",
        "/path/to/document.pdf"
    )
)
```

### Error Handling

The SDK provides specific exception types:

```kotlin
import com.iflow.sdk.query.IFlowQuery
import com.iflow.sdk.exceptions.*

try {
    val result = IFlowQuery.query("Hello")
    println(result)
} catch (e: ConnectionException) {
    println("Connection failed: ${e.message}")
} catch (e: AuthenticationException) {
    println("Authentication failed: ${e.message}")
} catch (e: TimeoutException) {
    println("Operation timed out: ${e.message}")
} catch (e: IFlowException) {
    println("iFlow error: ${e.message}")
}
```

## API Reference

### Core Classes

| Class | Description |
|-------|-------------|
| `IFlowClient` | Main client class, manages connection to iFlow |
| `IFlowOptions` | Configuration options class |
| `IFlowQuery` | Simple query utility class |

### IFlowQuery Methods

| Method | Description |
|--------|-------------|
| `query(text, files, options)` | Send query and return complete response |
| `queryStream(text, files, options, onChunk, onToolCall, onComplete, onError)` | Real-time streaming response |
| `querySync(text, files, options)` | Synchronous version of query (blocks current thread) |
| `queryBatch(queries, options)` | Send multiple queries in parallel |
| `queryWithFile(text, filePath, options)` | Query with single file attachment |
| `queryCode(prompt, language, options)` | Generate code with language hints |
| `queryAnalyze(filePath, question, options)` | Analyze files |

### IFlowClient Methods

| Method | Description |
|--------|-------------|
| `connect()` | Establish connection to iFlow |
| `sendMessage(text, files)` | Send message with optional files |
| `receiveMessages(callback)` | Receive streaming responses |
| `getMessageChannel()` | Get message channel for receiving messages |
| `interrupt()` | Cancel current generation |
| `approveToolCall(id, outcome)` | Approve tool call |
| `rejectToolCall(id)` | Reject tool call |
| `disconnect()` | Gracefully close connection |

### Message Types

| Message Type | Description | Main Properties |
|--------------|-------------|-----------------|
| `AssistantMessage` | Text response from AI assistant | `chunk.text` |
| `ToolCallMessage` | Tool execution request and status | `label`, `status`, `confirmation` |
| `PlanMessage` | Structured task plan | `entries` (contains `content`, `priority`, `status`) |
| `TaskFinishMessage` | Task completion signal | `stopReason` |
| `ErrorMessage` | Error information | `message` |

### Configuration Options

| Option | Type | Description |
|--------|------|-------------|
| `url` | `String` | WebSocket URL (default: `ws://localhost:8090/acp?peer=iflow`) |
| `timeout` | `Long` | Timeout duration (milliseconds, default: 300000 i.e. 5 minutes) |
| `permissionMode` | `PermissionMode` | Tool call permission mode |
| `fileAccess` | `Boolean` | Whether to allow file access |
| `fileReadOnly` | `Boolean` | Whether file access is read-only |
| `authMethodId` | `String` | Authentication method ID |
| `sessionSettings` | `SessionSettings` | Session configuration |

### Permission Modes

| Mode | Description |
|------|-------------|
| `PermissionMode.AUTO` | Auto-approve all tools |
| `PermissionMode.MANUAL` | Ask for confirmation every time |
| `PermissionMode.SELECTIVE` | Auto-approve certain types |

## Architecture

The SDK structure is as follows:

```
com.iflow.sdk/
├── IFlowClient.kt              // Main client class
├── IFlowOptions.kt             // Configuration
├── models/                     // Data classes and enums
├── transport/                  // WebSocket transport (OkHttp)
├── protocol/                   // ACP protocol implementation
├── query/                      // Simple query tools
├── exceptions/                 // Custom exceptions
└── utils/                      // JSON and logging utilities
```

## Troubleshooting

### Connection Issues

If you encounter connection errors, please check:

1. **Whether iFlow is installed**
   ```bash
   iflow --version
   ```

2. **Whether the port is occupied**
   ```bash
   # Linux/Mac
   lsof -i :8090

   # Windows
   netstat -an | findstr :8090
   ```

3. **Test connection manually**
   ```bash
   iflow --experimental-acp --port 8090
   ```

4. **Whether WebSocket URL is correct**
   - Default: `ws://localhost:8090/acp?peer=iflow`
   - Ensure URL format is correct and IP address and port are accessible

### Timeout Issues

For long-running tasks, you can increase the timeout duration:

```kotlin
val options = IFlowOptions(
    timeout = 600_000L  // 10 minute timeout
)
```