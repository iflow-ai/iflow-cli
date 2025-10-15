---
title: Python SDK
description: 基于iFlow CLI SDK搭建你的专属Agent项目
sidebar_position: 8
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

# SDK

## 概述

iFlow CLI SDK 是一个用于与 iFlow CLI 进行编程交互的 SDK。它通过代理通信协议（ACP）允许开发者构建具有对话、工具执行和任务规划能力的 AI 驱动应用程序。

**✨ 核心特性：SDK 自动管理 iFlow 进程 - 无需手动配置！**

## 系统要求

- **Python**: 3.8 或更高版本
- **iFlow CLI**: 0.2.24 或更高版本
- **操作系统**: Windows、macOS、Linux

## 安装

```bash
pip install iflow-cli-sdk
```

## 快速开始

### 基础示例

SDK 会自动检测并启动 iFlow 进程，无需手动配置：

```python
import asyncio
from iflow_sdk import IFlowClient, AssistantMessage, TaskFinishMessage

async def main():
    # SDK 自动处理：
    # 1. 检测 iFlow 是否已安装
    # 2. 启动 iFlow 进程（如果未运行）
    # 3. 查找可用端口并建立连接
    # 4. 退出时自动清理资源
    async with IFlowClient() as client:
        await client.send_message("你好，iFlow！")
        
        async for message in client.receive_messages():
            if isinstance(message, AssistantMessage):
                print(message.chunk.text, end="\n", flush=True)
            elif isinstance(message, TaskFinishMessage):
                break

asyncio.run(main())
```

### 简单查询

最简单的使用方式是通过 `query` 函数：

```python
from iflow_sdk import query
import asyncio

async def main():
    response = await query("法国的首都是哪里？")
    print(response)  # 输出：法国的首都是巴黎。

asyncio.run(main())
```

## 核心概念

### IFlowClient

`IFlowClient` 是与 iFlow CLI 交互的主要接口，管理 WebSocket 连接的生命周期：

```python
from iflow_sdk import IFlowClient, IFlowOptions

# 使用默认配置（自动管理进程）
async with IFlowClient() as client:
    await client.send_message("你的问题")
    async for message in client.receive_messages():
        # 处理消息
        pass

# 使用自定义配置
options = IFlowOptions(
    url="ws://localhost:8090/acp",  # WebSocket URL
    auto_start_process=True,         # 自动启动 iFlow
    timeout=30.0                     # 超时时间（秒）
)
async with IFlowClient(options) as client:
    await client.send_message("你的问题")
    async for message in client.receive_messages():
        # 处理消息
        pass
```

### 消息类型

SDK 支持多种消息类型，对应 iFlow 协议的不同响应：

#### AssistantMessage - AI 助手响应

包含AgentInfo支持，可以获取代理的详细信息：

```python
import asyncio
from iflow_sdk import IFlowClient, AssistantMessage, TaskFinishMessage, AgentInfo

async def handle_assistant_message():
    async with IFlowClient() as client:
        await client.send_message("请介绍一下Python")
        
        async for message in client.receive_messages():
            if isinstance(message, AssistantMessage):
                print(message.chunk.text, end="\n", flush=True)
                
                # 访问代理信息（如果有）
                if message.agent_info:
                    print(f"代理ID: {message.agent_info.agent_id}")
                    if message.agent_info.task_id:
                        print(f"任务ID: {message.agent_info.task_id}")
                    if message.agent_info.agent_index is not None:
                        print(f"代理索引: {message.agent_info.agent_index}")
                        
            elif isinstance(message, TaskFinishMessage):
                break

if __name__ == "__main__":
    asyncio.run(handle_assistant_message())
```

#### ToolCallMessage - 工具调用

工具调用消息现在也包含AgentInfo信息和工具名称：

```python
import asyncio
from iflow_sdk import IFlowClient, ToolCallMessage, ToolCallStatus, TaskFinishMessage

async def handle_tool_calls():
    async with IFlowClient() as client:
        # 注意：这个示例演示如何查看工具调用消息
        # iFlow 会要求提供完整路径和内容来创建文件
        await client.send_message("列出当前目录的文件")
        
        async for message in client.receive_messages():
            if isinstance(message, ToolCallMessage):
                print(f"状态: {message.status}")
                
                # 新增：工具名称
                if message.tool_name:
                    print(f"工具名称: {message.tool_name}")
                
                # 访问代理信息
                if message.agent_info:
                    print(f"代理ID: {message.agent_info.agent_id}")
                    
            elif isinstance(message, TaskFinishMessage):
                break

if __name__ == "__main__":
    asyncio.run(handle_tool_calls())
```

#### PlanMessage - 任务计划

```python
import asyncio
from iflow_sdk import IFlowClient, PlanMessage, TaskFinishMessage

async def show_plan():
    async with IFlowClient() as client:
        await client.send_message("帮我创建一个Python项目结构")
        
        async for message in client.receive_messages():
            if isinstance(message, PlanMessage):
                print("执行计划：")
                for entry in message.entries:
                    status_icon = "✅" if entry.status == "completed" else "⏳"
                    print(f"{status_icon} [{entry.priority}] {entry.content}")
            elif isinstance(message, TaskFinishMessage):
                break

if __name__ == "__main__":
    asyncio.run(show_plan())
```

#### TaskFinishMessage - 任务完成

```python
import asyncio
from iflow_sdk import IFlowClient, AssistantMessage, TaskFinishMessage, StopReason

async def check_completion():
    async with IFlowClient() as client:
        await client.send_message("计算 1+1")
        
        async for message in client.receive_messages():
            if isinstance(message, AssistantMessage):
                print(message.chunk.text, end="", flush=True)
            elif isinstance(message, TaskFinishMessage):
                print()  # 换行
                if message.stop_reason == StopReason.END_TURN:
                    print("任务正常完成")
                elif message.stop_reason == StopReason.MAX_TOKENS:
                    print("达到最大令牌限制")
                break  # TaskFinishMessage 表示对话结束

if __name__ == "__main__":
    asyncio.run(check_completion())
```

## 常见用例

### 交互式聊天机器人

```python
#!/usr/bin/env python3
import asyncio
from iflow_sdk import IFlowClient, AssistantMessage, TaskFinishMessage

async def chatbot():
    print("iFlow 聊天机器人 (输入 'quit' 退出)")
    print("-" * 50)
    
    async with IFlowClient() as client:
        while True:
            user_input = input("\n你: ")
            
            if user_input.lower() in ['quit', 'exit', 'q']:
                print("再见！")
                break
            
            await client.send_message(user_input)
            
            print("iFlow: ", end="", flush=True)
            async for message in client.receive_messages():
                if isinstance(message, AssistantMessage):
                    print(message.chunk.text, end="", flush=True)
                elif isinstance(message, TaskFinishMessage):
                    print()  # 换行
                    break

if __name__ == "__main__":
    asyncio.run(chatbot())
```

### 流式响应处理

```python
from iflow_sdk import query_stream
import asyncio

async def stream_example():
    prompt = "解释一下什么是升华现象"
    
    # query_stream 返回文本块的异步生成器
    async for chunk in query_stream(prompt):
        print(chunk, end="", flush=True)
    print()  # 最后换行

asyncio.run(stream_example())
```


## 高级配置

### 手动进程管理

如果需要手动管理 iFlow 进程：

```python
import asyncio
from iflow_sdk import IFlowClient, IFlowOptions, AssistantMessage, TaskFinishMessage

async def manual_process_example():
    # 禁用自动进程管理
    options = IFlowOptions(
        auto_start_process=False,
        url="ws://localhost:8090/acp"  # 连接到已存在的 iFlow
    )
    
    async with IFlowClient(options) as client:
        await client.send_message("你的问题")
        async for message in client.receive_messages():
            if isinstance(message, AssistantMessage):
                print(message.chunk.text, end="", flush=True)
            elif isinstance(message, TaskFinishMessage):
                break

if __name__ == "__main__":
    asyncio.run(manual_process_example())
```

> 注意
> 手动模式需要您单独启动 iFlow：
>```bash
>iflow --experimental-acp --port 8090
>```

### 错误处理

SDK 提供了详细的错误处理机制：

```python
import asyncio
from iflow_sdk import IFlowClient, ConnectionError, TimeoutError, AssistantMessage, TaskFinishMessage

async def error_handling_example():
    try:
        async with IFlowClient() as client:
            await client.send_message("测试")
            async for message in client.receive_messages():
                if isinstance(message, AssistantMessage):
                    print(message.chunk.text, end="", flush=True)
                elif isinstance(message, TaskFinishMessage):
                    break
    except ConnectionError as e:
        print(f"连接错误: {e}")
    except TimeoutError as e:
        print(f"超时错误: {e}")
    except Exception as e:
        print(f"未知错误: {e}")

if __name__ == "__main__":
    asyncio.run(error_handling_example())
```

### 同步调用

对于需要同步调用的场景：

```python
from iflow_sdk import query_sync, IFlowOptions

# 同步调用，带超时控制
options = IFlowOptions(timeout=30.0)
response = query_sync("你的问题", options=options)
print(response)
```

## API 参考

### 核心类

| 类名 | 描述 |
|------|------|
| `IFlowClient` | 主客户端类，管理与 iFlow 的连接 |
| `IFlowOptions` | 配置选项类 |
| `RawDataClient` | 访问原始协议数据的客户端 |

### 消息类型

| 消息类型 | 描述 | 主要属性 |
|----------|------|----------|
| `AssistantMessage` | AI 助手的文本响应 | `chunk.text`, `agent_id`, `agent_info` |
| `ToolCallMessage` | 工具执行请求和状态 | `label`, `status`, `tool_name`, `agent_info` |
| `PlanMessage` | 结构化任务计划 | `entries` (包含 `content`, `priority`, `status`) |
| `TaskFinishMessage` | 任务完成信号 | `stop_reason` |

### AgentInfo - 代理信息

新增的`AgentInfo`类提供了从iFlow代理ID解析的详细信息：

| 属性 | 类型 | 描述 |
|------|------|------|
| `agent_id` | `str` | 完整的代理ID |
| `agent_index` | `Optional[int]` | 代理在任务中的索引 |
| `task_id` | `Optional[str]` | 任务或实例ID |
| `timestamp` | `Optional[int]` | 创建时间戳 |

#### AgentInfo 使用示例

```python
from iflow_sdk import AgentInfo

# 从代理ID解析信息
agent_id = "subagent-task-abc123-2-1735123456789"
agent_info = AgentInfo.from_agent_id_only(agent_id)

if agent_info:
    print(f"代理ID: {agent_info.agent_id}")
    print(f"任务ID: {agent_info.task_id}")
    print(f"代理索引: {agent_info.agent_index}")
    print(f"时间戳: {agent_info.timestamp}")
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

### 超时问题

对于长时间运行的任务，可以增加超时时间：

```python
from iflow_sdk import IFlowClient, IFlowOptions

options = IFlowOptions(timeout=600.0)  # 10分钟超时
client = IFlowClient(options)
```

### 日志调试

启用详细日志以便调试：

```python
import logging
from iflow_sdk import IFlowClient, IFlowOptions

# 设置日志级别
logging.basicConfig(level=logging.DEBUG)

options = IFlowOptions(log_level="DEBUG")
client = IFlowClient(options)
```

