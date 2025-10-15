---
title: Android SDK
description: 基于iFlow CLI SDK搭建你的专属Agent项目
sidebar_position: 8
---

# SDK

## 概述

iFlow Android SDK 是一个用于与 iFlow CLI 进行编程交互的 Android SDK。它通过代理通信协议（ACP）允许开发者构建具有对话、工具执行和任务规划能力的 AI 驱动应用程序。

目前提供 **Android SDK**，支持简单查询和完整的双向客户端进行复杂交互。

## 系统要求

- **Android API**: 21+ (Android 5.0 Lollipop 或更高版本)
- **Kotlin**: 1.8 或更高版本
- **iFlow CLI**: 需通过 WebSocket 访问

## 依赖

添加到你的 `build.gradle`：

```kotlin
dependencies {
    // OkHttp 用于 WebSocket
    implementation 'com.squareup.okhttp3:okhttp:4.12.0'

    // Gson 用于 JSON
    implementation 'com.google.code.gson:gson:2.10.1'

    // 协程
    implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.3'
}
```

## 快速开始

### 基础示例

使用 `IFlowClient` 进行基本的对话交互：

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

val options = IFlowOptions()

IFlowClient(options).use { client ->
    client.connect()
    client.sendMessage("你好,iFlow!")

    client.receiveMessages { message ->
        when (message) {
            is AssistantMessage -> {
                println(message.chunk.text)
            }
            is TaskFinishMessage -> {
                return@receiveMessages // 完成
            }
        }
    }
}
```

### 简单查询

最简单的使用方式是通过 `IFlowQuery.query` 函数：

```kotlin
import com.iflow.sdk.query.IFlowQuery

// 简单一键查询
val result = IFlowQuery.query("What is 2 + 2?")
println(result) // "2 + 2 equals 4."
```

## 核心概念

### IFlowClient

`IFlowClient` 是与 iFlow CLI 交互的主要接口，管理 WebSocket 连接的生命周期：

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions

// 使用默认配置
val options = IFlowOptions()
IFlowClient(options).use { client ->
    client.connect()
    client.sendMessage("你的问题")

    client.receiveMessages { message ->
        // 处理消息
    }
}

// 使用自定义配置
val options = IFlowOptions(
    url = "ws://localhost:8090/acp?peer=iflow",
    timeout = 300_000L, // 5 分钟
    permissionMode = PermissionMode.AUTO
)
IFlowClient(options).use { client ->
    client.connect()
    client.sendMessage("你的问题")

    client.receiveMessages { message ->
        // 处理消息
    }
}
```

### 消息类型

SDK 支持多种消息类型，对应 iFlow 协议的不同响应：

#### AssistantMessage - AI 助手响应

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

fun handleAssistantMessage() {
    val options = IFlowOptions()

    IFlowClient(options).use { client ->
        client.connect()
        client.sendMessage("请介绍一下 Kotlin")

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

#### ToolCallMessage - 工具调用

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
        client.sendMessage("列出当前目录的文件")

        client.receiveMessages { message ->
            when (message) {
                is ToolCallMessage -> {
                    println("工具调用: ${message.label}")
                    println("状态: ${message.status}")

                    // 处理工具确认
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

#### PlanMessage - 任务计划

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

fun showPlan() {
    val options = IFlowOptions()

    IFlowClient(options).use { client ->
        client.connect()
        client.sendMessage("帮我创建一个 Android 项目结构")

        client.receiveMessages { message ->
            when (message) {
                is PlanMessage -> {
                    println("执行计划：")
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

#### TaskFinishMessage - 任务完成

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

fun checkCompletion() {
    val options = IFlowOptions()

    IFlowClient(options).use { client ->
        client.connect()
        client.sendMessage("计算 1+1")

        client.receiveMessages { message ->
            when (message) {
                is AssistantMessage -> {
                    print(message.chunk.text)
                }
                is TaskFinishMessage -> {
                    println() // 换行
                    println("任务完成: ${message.stopReason}")
                    return@receiveMessages
                }
            }
        }
    }
}
```

## 常见用例

### 交互式聊天机器人

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

fun chatbot() {
    println("iFlow 聊天机器人 (输入 'quit' 退出)")
    println("-".repeat(50))

    val options = IFlowOptions()

    IFlowClient(options).use { client ->
        client.connect()

        while (true) {
            print("\n你: ")
            val userInput = readLine() ?: break

            if (userInput.lowercase() in listOf("quit", "exit", "q")) {
                println("再见！")
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
                        println() // 换行
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

### 流式响应处理

```kotlin
import com.iflow.sdk.query.IFlowQuery

fun streamExample() {
    // 流式响应
    IFlowQuery.queryStream(
        text = "解释一下什么是升华现象",
        onChunk = { chunk -> print(chunk) },
        onComplete = { reason -> println("\n完成!") }
    )
}
```

## 高级配置

### 权限模式配置

配置工具调用的权限管理：

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

// 自动批准所有工具
val autoOptions = IFlowOptions(
    permissionMode = PermissionMode.AUTO
)

// 每次确认都询问
val manualOptions = IFlowOptions(
    permissionMode = PermissionMode.MANUAL
)

// 选择性批准
val selectiveOptions = IFlowOptions(
    permissionMode = PermissionMode.SELECTIVE
)
```

### 会话配置

```kotlin
import com.iflow.sdk.IFlowClient
import com.iflow.sdk.IFlowOptions
import com.iflow.sdk.models.*

val options = IFlowOptions(
    url = "ws://localhost:8090/acp?peer=iflow",
    timeout = 300_000L, // 5 分钟
    permissionMode = PermissionMode.AUTO,
    fileAccess = true,
    fileReadOnly = true,
    authMethodId = "iflow",
    sessionSettings = SessionSettings(
        workingDirectory = "/workspace"
    )
)
```

### 文件附件支持

SDK 支持多种文件类型：

- **图片**：PNG, JPG, GIF, WebP, SVG (base64 编码)
- **音频**：MP3, WAV, M4A, OGG, FLAC (base64 编码)
- **文档**：PDF, TXT, 代码文件 (资源链接)

```kotlin
client.sendMessage(
    text = "分析这些文件",
    files = listOf(
        "/path/to/image.png",
        "/path/to/audio.mp3",
        "/path/to/document.pdf"
    )
)
```

### 错误处理

SDK 提供特定的异常类型：

```kotlin
import com.iflow.sdk.query.IFlowQuery
import com.iflow.sdk.exceptions.*

try {
    val result = IFlowQuery.query("你好")
    println(result)
} catch (e: ConnectionException) {
    println("连接失败: ${e.message}")
} catch (e: AuthenticationException) {
    println("认证失败: ${e.message}")
} catch (e: TimeoutException) {
    println("操作超时: ${e.message}")
} catch (e: IFlowException) {
    println("iFlow 错误: ${e.message}")
}
```

## API 参考

### 核心类

| 类名 | 描述 |
|------|------|
| `IFlowClient` | 主客户端类，管理与 iFlow 的连接 |
| `IFlowOptions` | 配置选项类 |
| `IFlowQuery` | 简单查询工具类 |

### IFlowQuery 方法

| 方法 | 描述 |
|------|------|
| `query(text, files, options)` | 发送查询并返回完整响应 |
| `queryStream(text, files, options, onChunk, onToolCall, onComplete, onError)` | 实时流式响应 |
| `querySync(text, files, options)` | 同步版本的 query（阻塞当前线程） |
| `queryBatch(queries, options)` | 并行发送多个查询 |
| `queryWithFile(text, filePath, options)` | 带单个文件附件的查询 |
| `queryCode(prompt, language, options)` | 生成带语言提示的代码 |
| `queryAnalyze(filePath, question, options)` | 分析文件 |

### IFlowClient 方法

| 方法 | 描述 |
|------|------|
| `connect()` | 建立与 iFlow 的连接 |
| `sendMessage(text, files)` | 发送带可选文件的消息 |
| `receiveMessages(callback)` | 接收流式响应 |
| `getMessageChannel()` | 获取消息通道用于接收消息 |
| `interrupt()` | 取消当前生成 |
| `approveToolCall(id, outcome)` | 批准工具调用 |
| `rejectToolCall(id)` | 拒绝工具调用 |
| `disconnect()` | 优雅地关闭连接 |

### 消息类型

| 消息类型 | 描述 | 主要属性 |
|----------|------|----------|
| `AssistantMessage` | AI 助手的文本响应 | `chunk.text` |
| `ToolCallMessage` | 工具执行请求和状态 | `label`, `status`, `confirmation` |
| `PlanMessage` | 结构化任务计划 | `entries` (包含 `content`, `priority`, `status`) |
| `TaskFinishMessage` | 任务完成信号 | `stopReason` |
| `ErrorMessage` | 错误信息 | `message` |

### 配置选项

| 选项 | 类型 | 描述 |
|------|------|------|
| `url` | `String` | WebSocket URL (默认: `ws://localhost:8090/acp?peer=iflow`) |
| `timeout` | `Long` | 超时时间（毫秒，默认: 300000 即 5 分钟） |
| `permissionMode` | `PermissionMode` | 工具调用权限模式 |
| `fileAccess` | `Boolean` | 是否允许文件访问 |
| `fileReadOnly` | `Boolean` | 文件访问是否只读 |
| `authMethodId` | `String` | 认证方法 ID |
| `sessionSettings` | `SessionSettings` | 会话配置 |

### 权限模式

| 模式 | 描述 |
|------|------|
| `PermissionMode.AUTO` | 自动批准所有工具 |
| `PermissionMode.MANUAL` | 每次确认都询问 |
| `PermissionMode.SELECTIVE` | 自动批准某些类型 |

## 架构

SDK 的结构如下：

```
com.iflow.sdk/
├── IFlowClient.kt              // 主客户端类
├── IFlowOptions.kt             // 配置
├── models/                     // 数据类和枚举
├── transport/                  // WebSocket 传输 (OkHttp)
├── protocol/                   // ACP 协议实现
├── query/                      // 简单查询工具
├── exceptions/                 // 自定义异常
└── utils/                      // JSON 和日志工具
```

## 故障排除

### 连接问题

如果遇到连接错误，请检查：

1. **iFlow 是否已安装**
   ```bash
   iflow --version
   ```

2. **端口是否被占用**
   ```bash
   # Linux/Mac
   lsof -i :8090

   # Windows
   netstat -an | findstr :8090
   ```

3. **手动测试连接**
   ```bash
   iflow --experimental-acp --port 8090
   ```

4. **WebSocket URL 是否正确**
   - 默认: `ws://localhost:8090/acp?peer=iflow`
   - 确保 URL 格式正确且IP地址和端口可访问

### 超时问题

对于长时间运行的任务，可以增加超时时间：

```kotlin
val options = IFlowOptions(
    timeout = 600_000L  // 10 分钟超时
)
```