---
title: MCP
description: 使用模型上下文协议扩展 iFlow CLI 功能
sidebar_position: 4
---

# MCP 扩展系统

> **功能概述**：通过模型上下文协议(MCP)扩展iFlow CLI能力  
> **学习时间**：15-20分钟  
> **前置要求**：完成基础操作，了解CLI基本使用

## 什么是 MCP

**MCP**（Model Context Protocol，模型上下文协议）是AI领域的"USB接口"，它在大模型和外部工具之间建立标准化连接。

### 核心特点
- **标准化协议**：统一的通信标准，替代碎片化集成
- **安全连接**：可控的双向数据交换
- **功能扩展**：为AI助手添加专业工具能力
- **生态丰富**：社区提供数百种MCP服务器

## 安装 MCP 工具

### 方法一：心流 MCP 市场（推荐）

访问[心流MCP市场](https://platform.iflow.cn/mcp)，搜索并复制安装命令， 在终端执行安装命令：

```bash
# 基本语法
iflow mcp add-json 'server-name' '{JSON配置}'

# 示例：安装Playwright自动化工具
iflow mcp add-json 'playwright' "{\"command\":\"npx\",\"args\":[\"-y\",\"@iflow-mcp/playwright-mcp@0.0.32\"]}"


# 在iFlow CLI中执行（添加!前缀）需要手动刷新mcp列表
!iflow mcp add-json 'playwright' "{\"command\":\"npx\",\"args\":[\"-y\",\"@iflow-mcp/playwright-mcp@0.0.32\"]}"

/mcp refresh
```
以上命令都是在项目层面进行安装，如果确保所有项目都可见，在市场中复制对应的全局安装命令
```bash
iflow mcp add-json --scope user 'server-name' '{JSON配置}'

windows环境下使用转义后的JSON字符串配置
iflow mcp add-json --scope user 'server-name' "{JSON转义配置}"
```


### 方法二：使用 `/mcp online` 安装

在iFlow CLI中执行 `/mcp online`命令可以在线浏览MCP市场，选择合适的MCP进行安装

选中对应的MCP Server后，可以选择在项目范围内安装也可以在用户范围内安装(所有项目都可见)

### 方法三：使用命令行安装（高阶用户）

查看所有MCP命令：
```bash
iflow mcp --help
```
#### 使用 `iflow mcp add-json` 命令安装

适用于有现成配置文件的场景：

```bash
# 基本语法
iflow mcp add-json <name> '<json-config>'

# 示例：天气API服务器
iflow mcp add-json weather-api "{
  \"type\": \"stdio\",
  \"command\": \"/path/to/weather-cli\",
  \"args\": [\"--api-key\", \"abc123\"],
  \"env\": {\"CACHE_DIR\": \"/tmp\"}
}"

# 验证安装
iflow mcp get weather-api
```
**配置技巧**：
- 确保JSON格式正确，注意转义字符
- 使用 `--scope user` 添加到全局配置
- 避免服务器名称冲突（系统会自动添加后缀）

#### 使用 `iflow mcp add` 添加标准 stdio 服务器

适用于本地运行的工具：

```bash
# 基本语法
iflow mcp add <name> <command> [args...]

# 示例：本地文件处理工具
iflow mcp add file-manager python3 /path/to/file_manager.py
```

#### 使用 `iflow mcp add --transport sse` 添加SSE 服务器

适用于需要实时通信的Web服务：

```bash
# 基本语法
iflow mcp add --transport sse <name> <url>

# 示例：连接远程API服务
iflow mcp add --transport sse analytics-api https://api.example.com/mcp

# 带认证的连接
iflow mcp add --transport sse secure-api https://api.example.com/mcp --auth-token YOUR_TOKEN
```

#### 使用 `iflow mcp add --transport http` 添加远程 HTTP 服务器

```bash
# 基本语法
iflow mcp add --transport http <name> <url>

# 示例：连接到notion
iflow mcp -transport http notion https://mcp.notion.com/mcp

# 带认证的连接
iflow mcp add --transport http secure-api https://api.example.com/mcp \
  --header "Authorization: Bearer your-token"
```

### 方法四：从社区安装

**GitHub MCP服务器库**
- 浏览：[MCP服务器集合](https://github.com/modelcontextprotocol/servers)
- 自建：使用 [MCP SDK](https://modelcontextprotocol.io/quickstart/server)

**第三方市场**

在平台上获取serverConfig配置后，使用 `iflow mcp add-json` 命令安装，确保JSON配置是一个合法的json字符串格式

提示💡：使用第三方 MCP 服务器需要您自担风险 - iFlow CLI 未验证 所有这些服务器的正确性或安全性。 确保您信任正在安装的 MCP 服务器。 在使用可能获取不受信任内容的 MCP 服务器时要特别小心， 因为这些可能会使您面临提示注入风险。

### 方法五：修改配置文件
配置文件相关详情可以参考: [CLI配置文件说明](../configuration/settings.md)

全局/用户范围可用的MCP 服务器在 iFlow 设置文件中配置，位置为 `~/.iflow/settings.json`。配置定义了要连接的 MCP 服务器以及如何调用它们。

项目范围可用的MCP 服务器配置在项目文件夹的 `.iflow/settings.json`位置


#### **`mcpServers`**（对象）：
- **描述：** 配置与一个或多个模型上下文协议（MCP）服务器的连接，用于发现和使用自定义工具。iFlow CLI 尝试连接到每个配置的 MCP 服务器以发现可用工具。如果多个 MCP 服务器暴露同名工具，工具名称将以您在配置中定义的服务器别名为前缀（如 `serverAlias__actualToolName`）以避免冲突。注意，系统可能会从 MCP 工具定义中剥离某些模式属性以保持兼容性。
- **默认值：** 空
- **属性：**
- **`<SERVER_NAME>`**（对象）：命名服务器的服务器参数。
- `command`（字符串，必填）：启动 MCP 服务器要执行的命令。
- `args`（字符串数组，可选）：传递给命令的参数。
- `env`（对象，可选）：为服务器进程设置的环境变量。
- `cwd`（字符串，可选）：启动服务器的工作目录。
- `timeout`（数字，可选）：对此 MCP 服务器请求的超时时间（毫秒）。
- `trust`（布尔值，可选）：信任此服务器并绕过所有工具调用确认。
- `includeTools`（字符串数组，可选）：要从此 MCP 服务器包含的工具名称列表。指定时，只有这里列出的工具才可从此服务器使用（白名单行为）。如果未指定，默认启用服务器的所有工具。
- `excludeTools`（字符串数组，可选）：要从此 MCP 服务器排除的工具名称列表。这里列出的工具将不可用于模型，即使它们由服务器暴露。**注意：** `excludeTools` 优先于 `includeTools` - 如果工具在两个列表中，它将被排除。
#### **示例：**
```json
"mcpServers": {
  "myPythonServer": {
    "command": "python",
    "args": ["mcp_server.py", "--port", "8080"],
    "cwd": "./mcp_tools/python",
    "timeout": 5000,
    "includeTools": ["safe_tool", "file_reader"],
  },
  "myNodeServer": {
    "command": "node",
    "args": ["mcp_server.js"],
    "cwd": "./mcp_tools/node",
    "excludeTools": ["dangerous_tool", "file_deleter"]
  },
  "myDockerServer": {
    "command": "docker",
    "args": ["run", "-i", "--rm", "-e", "API_KEY", "ghcr.io/foo/bar"],
    "env": {
      "API_KEY": "$MY_API_TOKEN"
    }
  }
}
```


## MCP 服务器管理

### 查看已安装的服务器
```bash
# 列出所有MCP服务器
iflow mcp list

# 查看特定服务器详情
iflow mcp get <server-name>
```

### 删除
```bash
# 删除MCP服务器
iflow mcp remove <server-name>
```
### 在iFlow CLI中管理
```bash
/mcp list
```

## 平台兼容性

### 支持平台
- ✅ **macOS**：完全支持
- ✅ **Windows (WSL)**：通过WSL支持
- ✅ **Linux**：原生支持
- ⚠️ **Windows 原生**：部分功能受限

### 配置位置
- **全局配置**：`~/.iflow/mcp/config.json`
- **项目配置**：`{project}/.iflow/mcp.json`
- **Claude Desktop 集成**：自动读取Claude Desktop配置

## 故障排除

### 服务器无法启动
- 检查命令和参数是否正确
- 验证包是否已安装（针对 npm 包）
- 检查超时设置
- 查看 iFlow CLI 中的错误信息

### 连接问题
- 确保服务器支持 MCP 协议
- 检查网络连接（针对远程服务器）
- 验证环境变量设置是否正确

### 性能问题
- 调整超时值
- 检查服务器资源使用情况
- 考虑减少并发 MCP 服务器数量

## 最佳实践

1. **从简单开始**: 在添加自定义服务器之前先使用预配置的服务器
2. **充分测试**: 首先在安全环境中测试新的 MCP 服务器
3. **监控性能**: 关注响应时间和资源使用情况
4. **保持更新**: 定期更新 MCP 服务器包以获得安全性和功能改进
5. **记录更改**: 为团队成员记录自定义配置

## 使用示例

配置 MCP 服务器后，您可以在 iFlow 对话中利用它们的能力：

```
/mcp list
# 显示可用的 MCP 服务器

# 使用增强推理（sequential-thinking 服务器自动激活）
如何优化这个复杂的数据库查询？

# 利用上下文信息（context7 服务器自动激活）
在 Node.js 中实现身份验证的最佳实践是什么？
```

MCP 服务器在后台透明工作，增强 iFlow 的能力，在大多数情况下无需显式调用。

### 安全注意事项

**使用第三方MCP服务器时**：
- ⚠️ 验证服务器来源和可信度
- ⚠️ 审查服务器权限要求
- ⚠️ 注意提示注入攻击风险
- ⚠️ 定期更新服务器版本

**推荐做法**：
- ✅ 优先使用官方和知名开发者的服务器
- ✅ 在测试环境中先验证功能
- ✅ 定期审核已安装的服务器
- ✅ 保持服务器版本更新

## 下一步

完成MCP配置后，建议继续学习：

1. **[子代理配置](../examples/subagent.md)** - 配置专业化AI助手
2. **[最佳实践](../examples/best-practices)** - 工作流优化技巧
3. **[高级配置](../configuration/settings)** - 深度定制设置

---

**获得帮助**：📖 [MCP官方文档](https://modelcontextprotocol.io/) | 🐛 [问题反馈](https://github.com/iflow-ai/iflow-cli/issues)