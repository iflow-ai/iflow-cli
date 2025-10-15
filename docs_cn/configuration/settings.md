---
sidebar_position: 0
hide_title: true
---

# CLI 配置

iFlow CLI 提供了丰富的配置选项，您可以通过环境变量、命令行参数和设置文件来定制CLI的行为。下面我们将详细介绍这些配置方式，帮助您打造专属的使用体验。

## 配置层级

iFlow CLI 采用分层配置系统，按照以下优先级顺序生效，优先级高的设置会覆盖低优先级的设置：

1.   应用默认值： CLI 内置的基础配置
2.   用户全局设置： 您的个人默认配置，适用于所有项目
3.   项目专属设置： 特定项目的配置，会覆盖用户设置
4.   系统级设置： 管理员配置，适用于整个系统
5.   命令行参数： 启动时指定的临时配置，优先级最高

## 环境变量配置

iFlow CLI 现在支持通过环境变量进行配置，**所有 `~/.iflow/settings.json` 中的配置项都可以通过 IFLOW_ 前缀的环境变量设置**，避免与其他项目的环境变量冲突。

### 环境变量命名约定

#### IFLOW 前缀规则

**为了避免与其他项目的环境变量冲突，所有环境变量都必须使用 `IFLOW` 或 `iflow` 前缀。**

对于 `settings.json` 中的任何配置项，iFlow 支持以下 4 种环境变量命名约定（按优先级排序）：

1. **IFLOW_前缀的驼峰命名** - `IFLOW_` + settings.json 中的 key 名称（推荐）
2. **IFLOW_前缀的下划线命名** - `IFLOW_` + 大写下划线格式
3. **iflow_前缀的驼峰命名** - `iflow_` + settings.json 中的 key 名称
4. **iflow_前缀的下划线命名** - `iflow_` + 大写下划线格式

#### 命名示例

| settings.json 中的 key | 1. IFLOW_驼峰 | 2. IFLOW_下划线 | 3. iflow_驼峰 | 4. iflow_下划线 |
|----------------------|---------------|----------------|---------------|----------------|
| `apiKey`             | `IFLOW_apiKey`| `IFLOW_API_KEY`| `iflow_apiKey`| `iflow_API_KEY`|
| `baseUrl`            | `IFLOW_baseUrl`| `IFLOW_BASE_URL`| `iflow_baseUrl`| `iflow_BASE_URL`|
| `modelName`          | `IFLOW_modelName`| `IFLOW_MODEL_NAME`| `iflow_modelName`| `iflow_MODEL_NAME`|
| `vimMode`            | `IFLOW_vimMode`| `IFLOW_VIM_MODE`| `iflow_vimMode`| `iflow_VIM_MODE`|
| `showMemoryUsage`    | `IFLOW_showMemoryUsage`| `IFLOW_SHOW_MEMORY_USAGE`| `iflow_showMemoryUsage`| `iflow_SHOW_MEMORY_USAGE`|

#### 支持的配置项

所有在 `~/.iflow/settings.json` 中的配置项都支持通过环境变量设置，包括但不限于：

- `apiKey` - API 密钥
- `baseUrl` - 基础 URL
- `modelName` - 模型名称  
- `vimMode` - Vim 模式开关
- `showMemoryUsage` - 显示内存使用
- `maxSessionTurns` - 最大会话轮数
- `theme` - 主题设置
- 以及 Settings 接口中的所有其他配置项

### 使用方法

#### 方法 1: 使用 IFLOW_前缀的驼峰命名（推荐）

```bash
export IFLOW_apiKey="your_api_key_here"
export IFLOW_baseUrl="https://your-api-url.com/v1"
export IFLOW_modelName="your_model_name"
iflow
```

#### 方法 2: 使用 IFLOW_前缀的下划线命名

```bash
export IFLOW_API_KEY="your_api_key_here"
export IFLOW_BASE_URL="https://your-api-url.com/v1"
export IFLOW_MODEL_NAME="your_model_name"
iflow
```

#### 方法 3: 使用 iflow_前缀（小写）

```bash
export iflow_apiKey="your_api_key_here"
export iflow_baseUrl="https://your-api-url.com/v1"
export iflow_modelName="your_model_name"
iflow
```

#### 方法 4: 一行设置并启动

```bash
IFLOW_apiKey=your_key IFLOW_baseUrl=https://api.example.com/v1 iflow
```

#### 方法 5: 设置更多配置项

```bash
# 所有 settings.json 中的配置都支持 IFLOW_ 前缀
export IFLOW_apiKey="your_api_key_here"
export IFLOW_baseUrl="https://your-api-url.com/v1"
export IFLOW_modelName="your_model_name"
export IFLOW_vimMode="true"
export IFLOW_showMemoryUsage="true"
export IFLOW_maxSessionTurns="50"
export IFLOW_coreTools="read,write,shell,grep"
export IFLOW_theme="dark"
iflow
```

### 配置优先级

配置的完整优先级（从高到低）：

1. **命令行参数** - 如 `iflow --model your-model`
2. **IFLOW 前缀环境变量** - 支持所有 settings.json 中的配置项
   - IFLOW_驼峰命名 > IFLOW_下划线命名 > iflow_驼峰命名 > iflow_下划线命名
3. **系统配置文件** - `/etc/iflow-cli/settings.json` 或类似路径
4. **工作区配置文件** - `./iflow/settings.json`
5. **用户配置文件** - `~/.iflow/settings.json`
6. **默认值** - 代码中定义的默认配置

### 实际使用案例

#### OpenAI 兼容 API

```bash
export IFLOW_apiKey="sk-1234567890abcdef"
export IFLOW_baseUrl="https://api.openai.com/v1"
export IFLOW_modelName="gpt-4"
iflow
```

#### 自定义 API 服务

```bash
export IFLOW_API_KEY="your_custom_key"
export IFLOW_BASE_URL="https://your-custom-api.com/v1"
export IFLOW_MODEL_NAME="your-custom-model"
iflow
```

#### 在 CI/CD 环境中使用

```bash
# 在 GitHub Actions 或其他 CI 环境中
export IFLOW_apiKey="${{ secrets.API_KEY }}"
export IFLOW_baseUrl="${{ vars.API_URL }}"
iflow --prompt "Generate documentation"
```

### 环境变量验证

iFlow 会自动检测和验证环境变量：

- 如果检测到有效的环境变量配置，会自动选择 iFlow 认证类型
- 如果没有任何配置，会显示帮助信息指导如何设置
- 错误的配置会显示详细的错误消息

### 安全注意事项

1. **不要在代码中硬编码 API 密钥**
2. **使用 `.env` 文件存储本地开发配置**
3. **在生产环境中使用环境变量或密钥管理服务**
4. **定期轮换 API 密钥**

### 故障排除

#### 优先级问题

如果配置没有按预期工作，检查是否有更高优先级的配置覆盖了环境变量：

1. 检查命令行参数
2. 检查 `~/.iflow/settings.json` 配置文件
3. 检查其他环境变量

#### 认证失败

确保：
1. API 密钥格式正确
2. 基础 URL 可访问
3. 模型名称正确

### 迁移指南

#### 从配置文件迁移到环境变量

如果您之前使用配置文件，可以将设置迁移到环境变量：

```bash
# 将以下内容添加到您的 .bashrc 或 .zshrc
export IFLOW_API_KEY="从 settings.json 中的 apiKey"
export IFLOW_BASE_URL="从 settings.json 中的 baseUrl"  
export IFLOW_MODEL_NAME="从 settings.json 中的 modelName"
```

#### 保持向后兼容

现有的所有配置方式继续有效：
- `settings.json` 配置文件
- 原有环境变量（`GEMINI_API_KEY` 等）
- 命令行参数

## 设置文件

通过 `settings.json` 文件，您可以保存常用配置。根据使用场景，可以将文件放置在以下位置：

- **用户设置文件：**
  - **位置：** `~/.iflow/settings.json`（`~` 代表您的主目录）
  - **作用域：** 个人默认配置，对所有项目生效
- **项目设置文件：**
  - **位置：** 项目根目录下的 `.iflow/settings.json`
  - **作用域：** 仅对当前项目生效，会覆盖用户全局设置
- **系统设置文件：**
  - **位置：** `/etc/iflow-cli/settings.json`（Linux）、`C:\ProgramData\iflow-cli\settings.json`（Windows）或 `/Library/Application Support/iFlowCli/settings.json`（macOS）。也可通过 `IFLOW_CLI_SYSTEM_SETTINGS_PATH` 环境变量自定义路径
  - **作用域：** 影响系统所有用户，通常由管理员配置。在企业环境中特别有用，便于统一管理团队配置

**环境变量引用：** 在 `settings.json` 文件中，您可以使用 `$VAR_NAME` 或 `${VAR_NAME}` 语法引用环境变量。这些变量会在加载设置时自动解析。例如，如果有环境变量 `MY_API_TOKEN`，可以在 `settings.json` 中这样使用：`"apiKey": "$MY_API_TOKEN"`。

### 项目中的 `.iflow` 目录

除了项目设置文件外，项目的 `.iflow` 目录还可以包含与 iFlow CLI 操作相关的其他项目特定文件，例如：

- [自定义沙箱配置文件](#沙箱)（如 `.iflow/sandbox-macos-custom.sb`、`.iflow/sandbox.Dockerfile`）。

### `settings.json` 中的可用设置：

- **`selectedAuthType`** (字符串)
  - **描述：** 认证类型，用于指定连接API的认证方式。`iflow` 表示使用心流认证，`openai-compatible` 支持任何提供OpenAI协议的模型服务商
  - **默认值：** `iflow`
  - **示例：** `"selectedAuthType": "api_key"`

- **`apiKey`** (字符串)
  - **描述：** API密钥，用于模型调用的身份验证
  - **默认值：** 必填
  - **示例：** `"apiKey": "sk-xxxxxxxxxxxxxxxxxxxxx"`

- **`baseUrl`** (字符串)
  - **描述：** API服务的基础URL地址
  - **默认值：** 必填
  - **示例：** `"baseUrl": "https://api.xinliu.ai/v1"`

- **`modelName`** (字符串)
  - **描述：** 要使用的AI模型名称
  - **默认值：** 必填
  - **示例：** `"modelName": "Qwen3-Coder"`


- **`contextFileName`**（字符串或字符串数组）：
  - **描述：** 上下文文件名（如 `IFLOW.md`、`AGENTS.md`）。可以是单个文件名或文件名列表
  - **默认值：** `IFLOW.md`
  - **示例：** `"contextFileName": "AGENTS.md"`

- **`bugCommand`**（对象）：
  - **描述：** 覆盖 `/bug` 命令的默认 URL。
  - **默认值：** `"urlTemplate": "https://github.com/iflow-ai/iflow-cli/issues/new?template=bug_report.yml&title={title}&info={info}"`
  - **属性：**
    - **`urlTemplate`**（字符串）：可以包含 `{title}` 和 `{info}` 占位符的 URL。
  - **示例：**
    ```json
    "bugCommand": {
      "urlTemplate": "https://bug.example.com/new?title={title}&info={info}"
    }
    ```

- **`fileFiltering`**（对象）：
  - **描述：** 控制 @ 命令和文件发现工具的 git 感知文件过滤行为。
  - **默认值：** `"respectGitIgnore": true, "enableRecursiveFileSearch": true`
  - **属性：**
    - **`respectGitIgnore`**（布尔值）：发现文件时是否遵循 .gitignore 模式。设置为 `true` 时，git 忽略的文件（如 `node_modules/`、`dist/`、`.env`）会自动从 @ 命令和文件列表操作中排除。
    - **`enableRecursiveFileSearch`**（布尔值）：在提示中完成 @ 前缀时是否启用在当前树下递归搜索文件名。
  - **示例：**
    ```json
    "fileFiltering": {
      "respectGitIgnore": true,
      "enableRecursiveFileSearch": false
    }
    ```

- **`coreTools`**（字符串数组）：
  - **描述：** 允许您指定应该提供给模型的核心工具名称列表。这可以用来限制内置工具集。查看`/tools`命令了解核心工具列表。您还可以为支持的工具指定命令特定限制，如 `ShellTool`。例如，`"coreTools": ["ShellTool(ls -l)"]` 将只允许执行 `ls -l` 命令。
  - **默认值：** 所有工具都可供 iFlow CLI使用。
  - **示例：** `"coreTools": ["ReadFileTool", "GlobTool", "ShellTool(ls)"]`。

- **`excludeTools`**（字符串数组）：
  - **描述：** 允许您指定应该从CLI中排除的核心工具名称列表。同时列在 `excludeTools` 和 `coreTools` 中的工具会被排除。您还可以为支持的工具指定命令特定限制，如 `ShellTool`。例如，`"excludeTools": ["ShellTool(rm -rf)"]` 将阻止 `rm -rf` 命令。
  - **默认值**：不排除任何工具。
  - **示例：** `"excludeTools": ["ShellTool", "glob"]`。
  - **安全注意：** `excludeTools` 中对 `ShellTool` 的命令特定限制基于简单字符串匹配，可以轻易绕过。此功能**不是安全机制**，不应依赖它来安全执行不受信任的代码。建议使用 `coreTools` 显式选择可以执行的命令。

- **`allowMCPServers`**（字符串数组）：
  - **描述：** 允许您指定应该提供给CLI的 MCP 服务器名称列表。这可以用来限制要连接的 MCP 服务器集合。注意，如果设置了 `--allowed-mcp-server-names`，此设置将被忽略。
  - **默认值：** 所有 MCP 服务器都可供 iFlow CLI使用。
  - **示例：** `"allowMCPServers": ["myPythonServer"]`。
  - **安全注意：** 这使用 MCP 服务器名称的简单字符串匹配，可以修改。如果您是系统管理员，希望阻止用户绕过此设置，请考虑在系统设置级别配置 `mcpServers`，这样用户将无法配置自己的任何 MCP 服务器。这不应作为严密的安全机制使用。

- **`excludeMCPServers`**（字符串数组）：
  - **描述：** 允许您指定应该从CLI中排除的 MCP 服务器名称列表。同时列在 `excludeMCPServers` 和 `allowMCPServers` 中的服务器会被排除。注意，如果设置了 `--allowed-mcp-server-names`，此设置将被忽略。
  - **默认值**：不排除任何 MCP 服务器。
  - **示例：** `"excludeMCPServers": ["myNodeServer"]`。
  - **安全注意：** 这使用 MCP 服务器名称的简单字符串匹配，可以修改。如果您是系统管理员，希望阻止用户绕过此设置，请考虑在系统设置级别配置 `mcpServers`，这样用户将无法配置自己的任何 MCP 服务器。这不应作为严密的安全机制使用。

- **`autoAccept`**（布尔值）：
  - **描述：** 控制 CLI 是否自动接受并执行被认为安全的工具调用（如只读操作），而无需显式用户确认。如果设置为 `true`，CLI 将绕过被认为安全的工具的确认提示。
  - **默认值：** `false`
  - **示例：** `"autoAccept": true`

- **`theme`**（字符串）：
  - **描述：** 设置 iFlow CLI 的视觉主题。
  - **默认值：** `"Default"`
  - **示例：** `"theme": "GitHub"`

- **`vimMode`**（布尔值）：
  - **描述：** 启用或禁用输入编辑的 vim 模式。启用后，输入区域支持 vim 风格的导航和编辑命令，具有 NORMAL 和 INSERT 模式。vim 模式状态显示在页脚中，并在会话间持续。
  - **默认值：** `false`
  - **示例：** `"vimMode": true`

- **`sandbox`**（布尔值或字符串）：
  - **描述：** 控制是否以及如何使用沙箱进行工具执行。如果设置为 `true`，iFlow CLI 使用预构建的 `iflow-cli-sandbox` Docker 镜像。更多信息请参见[沙箱](#沙箱)。
  - **默认值：** `false`
  - **示例：** `"sandbox": "docker"`

- **`mcpServers`**（对象）：
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
  - **示例：**
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

- **`checkpointing`**（对象）：
  - **描述：** 配置检查点功能，允许您保存和恢复对话和文件状态。更多详情请参见[检查点文档](../features/checkpointing.md)。
  - **默认值：** `{"enabled": false}`
  - **属性：**
    - **`enabled`**（布尔值）：为 `true` 时，`/restore` 命令可用。

- **`preferredEditor`**（字符串）：
  - **描述：** 指定查看差异时使用的首选编辑器。
  - **默认值：** `vscode`
  - **示例：** `"preferredEditor": "vscode"`

- **`telemetry`**（对象）
  - **描述：** 配置 iFlow CLI 的日志记录和指标收集。更多信息请参见[遥测](../features/telemetry.md)。
  - **默认值：** `{"enabled": false, "target": "local", "otlpEndpoint": "http://localhost:4317", "logPrompts": true}`
  - **属性：**
    - **`enabled`**（布尔值）：是否启用可观测性。
    - **`target`**（字符串）：收集的可观测性数据的目标。支持的值为 `local` 和 `gcp`。
    - **`otlpEndpoint`**（字符串）：OTLP 导出器的端点。
    - **`logPrompts`**（布尔值）：是否在日志中包含用户提示的内容。
  - **示例：**
    ```json
    "telemetry": {
      "enabled": true,
      "target": "local",
      "otlpEndpoint": "http://localhost:16686",
      "logPrompts": false
    }
    ```

- **`hideTips`**（布尔值）：
  - **描述：** 启用或禁用 CLI 界面中的有用提示。
  - **默认值：** `false`
  - **示例：**

    ```json
    "hideTips": true
    ```

- **`hideBanner`**（布尔值）：
  - **描述：** 启用或禁用 CLI 界面中的启动横幅（ASCII 艺术 logo）。
  - **默认值：** `false`
  - **示例：**

    ```json
    "hideBanner": true
    ```

- **`maxSessionTurns`**（数字）：
  - **描述：** 设置会话的最大轮数。如果会话超过此限制，CLI 将停止处理并开始新的聊天。
  - **默认值：** `-1`（无限制）
  - **示例：**
    ```json
    "maxSessionTurns": 10
    ```

- **`summarizeToolOutput`**（对象）：
  - **描述：** 启用或禁用工具输出的摘要。您可以使用 `tokenBudget` 设置指定摘要的令牌预算。
  - 注意：目前只支持 `run_shell_command` 工具。
  - **默认值：** `{}`（默认禁用）
  - **示例：**
    ```json
    "summarizeToolOutput": {
      "run_shell_command": {
        "tokenBudget": 2000
      }
    }
    ```
- **`disableAutoUpdate`**（布尔值）：
  - **描述：** 禁用自动更新，设置为true会禁用自动更新功能 
  - **默认值：** `false`（默认启动自动更新）
  - **示例：**
    ```json
    "disableAutoUpdate": true
    ```

- **`disableTelemetry`**（布尔值）：
  - **描述：** 禁用发送遥测数据（目前只发送接口耗时数据）
  - **默认值：** `false`（默认发送）
  - **示例：**
    ```json
    "disableTelemetry": true
    ```

- **`tokensLimit`**（数字）：
  - **描述：** 用于设置模型的上下文窗口长度
  - **默认值：** 128000
  - **示例：**
    ```json
    "tokensLimit": 100000
    ```

- **`compressionTokenThreshold`**（数字）：
  - **描述：** 用于控制自动压缩操作触发的阈值
  - **默认值：** 0.8
  - **示例：**
    ```json
    "compressionTokenThreshold": 0.8
    ```

- **`useRipgrep`**（布尔值）：
  - **描述：** 是否开启Ripgrep
  - **默认值：** true
  - **示例：**
    ```json
    "useRipgrep": false
    ```

- **`skipNextSpeakerCheck`**（布尔值）：
  - **描述：** 是否跳过任务结束检测
  - **默认值：** true
  - **示例：**
    ```json
    "skipNextSpeakerCheck": true
    ```

- **`shellTimeout`**（数字）
  - **描述：** shell工具执行的超时时间，单位毫秒
  - **默认值：** 120000
  - **示例：**
    ```json
    "shellTimeout": 120000
    ```

### `settings.json` 示例：

```json
{ 
  "selectedAuthType": "iflow",
  "apiKey": "sk-xxx",
  "baseUrl": "https://apis.iflow.cn/v1",
  "modelName": "Qwen3-Coder",
  "theme": "GitHub",
  "sandbox": "docker",
  "toolDiscoveryCommand": "bin/get_tools",
  "toolCallCommand": "bin/call_tool",
  "mcpServers": {
    "mainServer": {
      "command": "bin/mcp_server.py"
    },
    "anotherServer": {
      "command": "node",
      "args": ["mcp_server.js", "--verbose"]
    }
  },
  "telemetry": {
    "enabled": true,
    "target": "local",
    "otlpEndpoint": "http://localhost:4317",
    "logPrompts": true
  },
  "usageStatisticsEnabled": true,
  "hideTips": false,
  "hideBanner": false,
  "maxSessionTurns": 10,
  "summarizeToolOutput": {
    "run_shell_command": {
      "tokenBudget": 100
    }
  }
}
```

## Shell 历史记录

CLI 保存您运行的 shell 命令历史记录。为了避免不同项目之间的冲突，此历史记录存储在用户主文件夹内的项目特定目录中。

- **位置：** `~/.iflow/tmp/<project_hash>/shell_history`
  - `<project_hash>` 是从项目根路径生成的唯一标识符。
  - 历史记录存储在名为 `shell_history` 的文件中。

## 命令行参数

在运行CLI时传递的命令行参数，可以覆盖当前会话的其他配置。

- **`--model <model_name>`**（**`-m <model_name>`**）：
  - 指定当前会话使用的iFlow模型
  - 示例：`npm start -- --model Qwen3-Coder`
- **`--prompt <your_prompt>`**（**`-p <your_prompt>`**）：
  - 直接传递提示，以非交互模式运行iFlow CLI
- **`--prompt-interactive <your_prompt>`**（**`-i <your_prompt>`**）：
  - 以指定提示启动交互式会话
  - 提示在交互式会话内处理
  - 不支持stdin管道输入
  - 示例：`iflow -i "explain this code"`
- **`--sandbox`**（**`-s`**）：
  - 为此会话启用沙箱模式。
- **`--sandbox-image`**：
  - 设置沙箱镜像 URI。
- **`--debug`**（**`-d`**）：
  - 为此会话启用调试模式，提供更详细的输出。
- **`--all-files`**（**`-a`**）：
  - 如果设置，递归包含当前目录内的所有文件作为提示的上下文。
- **`--help`**（或 **`-h`**）：
  - 显示关于命令行参数的帮助信息。
- **`--show-memory-usage`**：
  - 显示当前内存使用情况。
- **`--yolo`**：
  - 启用 YOLO 模式，自动批准所有工具调用。
- **`--telemetry`**：
  - 启用[可观测性](../features/telemetry.md)。
- **`--telemetry-target`**：
  - 设置可观测性目标。更多信息请参见[可观测性](../features/telemetry.md)。
- **`--telemetry-otlp-endpoint`**：
  - 设置可观测性的 OTLP 端点。更多信息请参见[可观测性](../features/telemetry.md)。
- **`--telemetry-log-prompts`**：
  - 启用可观测性的提示日志记录。更多信息请参见[可观测性](../features/telemetry.md)。
- **`--checkpointing`**：
  - 启用[检查点](../features/checkpointing.md)。
- **`--extensions <extension_name ...>`**（**`-e <extension_name ...>`**）：
  - 指定会话要使用的扩展列表。如果未提供，则使用所有可用扩展。
  - 使用特殊术语 `iflow -e none` 禁用所有扩展。
  - 示例：`iflow -e my-extension -e my-other-extension`
- **`--list-extensions`**（**`-l`**）：
  - 列出所有可用扩展并退出。
- **`--proxy`**：
  - 设置 CLI 的代理。
  - 示例：`--proxy http://localhost:7890`。
- **`--include-directories <dir1,dir2,...>`**（**`--add-dir <dir1,dir2,...>`**）：
  - 在工作区中包含额外目录以支持多目录。
  - 可以多次指定或作为逗号分隔的值。
  - 最多可以添加 5 个目录。
  - 示例：`--include-directories /path/to/project1,/path/to/project2` 或 `--add-dir /path/to/project1 --add-dir /path/to/project2`
- **`--version`**：
  - 显示 CLI 的版本。

## 上下文文件（分层指令上下文）

虽然不严格来说是 CLI _行为_ 的配置，但上下文文件（默认为 `IFLOW.md`，但可通过 `contextFileName` 设置配置）对于配置提供给 iFlow 模型的 _指令上下文_（也称为"内存"）至关重要。这个强大的功能允许您为 AI 提供项目特定的指令、编码风格指南或任何相关背景信息，使其响应更加贴合您的需求。CLI 包含 UI 元素，如页脚中显示已加载上下文文件数量的指示器，让您了解活动上下文。

- **目的：** 这些 Markdown 文件包含您希望 iFlow 模型在交互过程中了解的指令、指南或上下文。系统设计为分层管理此指令上下文。

### 上下文文件内容示例（如 `IFLOW.md`）

以下是 TypeScript 项目根目录中上下文文件可能包含的概念性示例：

```markdown
# 项目：我的优秀 TypeScript 库

## 通用指令：

- 生成新的 TypeScript 代码时，请遵循现有的编码风格。
- 确保所有新函数和类都有 JSDoc 注释。
- 在适当的地方优先使用函数式编程范式。
- 所有代码应与 TypeScript 5.0 和 Node.js 20+ 兼容。

## 编码风格：

- 使用 2 个空格缩进。
- 接口名称应以 `I` 为前缀（如 `IUserService`）。
- 私有类成员应以下划线为前缀（`_`）。
- 始终使用严格相等（`===` 和 `!==`）。

## 特定组件：`src/api/client.ts`

- 此文件处理所有出站 API 请求。
- 添加新的 API 调用函数时，确保它们包含健壮的错误处理和日志记录。
- 对所有 GET 请求使用现有的 `fetchWithRetry` 实用程序。

## 关于依赖项：

- 除非绝对必要，否则避免引入新的外部依赖项。
- 如果需要新依赖项，请说明原因。
```

此示例演示了如何提供通用项目上下文、特定编码约定，甚至关于特定文件或组件的注释。您的上下文文件越相关和精确，AI 就越能更好地协助您。强烈建议使用项目特定的上下文文件来建立约定和上下文。

- **分层加载和优先级：** CLI 通过从多个位置加载上下文文件（如 `IFLOW.md`）实现了复杂的分层内存系统。来自此列表较低位置（更具体）的文件内容通常会覆盖或补充来自较高位置（更通用）的文件内容。可以使用 `/memory show` 命令检查确切的连接顺序和最终上下文。典型的加载顺序是：
  1.  **全局上下文文件：**
      - 位置：`~/.iflow/<contextFileName>`（如用户主目录中的 `~/.iflow/IFLOW.md`）。
      - 作用域：为您的所有项目提供默认指令。
  2.  **项目根目录和祖先上下文文件：**
      - 位置：CLI 在当前工作目录中搜索配置的上下文文件，然后在每个父目录中搜索，直到项目根目录（由 `.git` 文件夹标识）或您的主目录。
      - 作用域：提供与整个项目或其重要部分相关的上下文。
  3.  **子目录上下文文件（上下文相关/本地）：**
      - 位置：CLI 还在当前工作目录 _下方_ 的子目录中扫描配置的上下文文件（遵循常见的忽略模式，如 `node_modules`、`.git` 等）。此搜索的广度默认限制为 200 个目录，但可以通过 `settings.json` 文件中的 `memoryDiscoveryMaxDirs` 字段配置。
      - 作用域：允许与项目的特定组件、模块或子部分相关的高度特定指令。
- **连接和 UI 指示：** 所有找到的上下文文件的内容都会连接（带有指示其来源和路径的分隔符）并作为系统提示的一部分提供给 iFlow 模型。CLI 页脚显示已加载上下文文件的计数，为您提供关于活动指令上下文的快速视觉提示。
- **导入内容：** 您可以通过使用 `@path/to/file.md` 语法导入其他 Markdown 文件来模块化您的上下文文件。
- **内存管理命令：**
  - 使用 `/memory refresh` 强制重新扫描和重新加载所有配置位置的上下文文件。这会更新 AI 的指令上下文。
  - 使用 `/memory show` 显示当前加载的组合指令上下文，让您验证 AI 使用的层次结构和内容。

通过理解和利用这些配置层级和上下文文件的分层特性，您可以有效管理 AI 的内存，并根据您的特定需求和项目定制 iFlow CLI 的响应。