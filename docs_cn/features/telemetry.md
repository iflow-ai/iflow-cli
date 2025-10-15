---
sidebar_position: 20
hide_title: true
---

# 可观测性

> **功能概述**：可观测性是iFlow CLI的监控分析系统，提供性能监控、使用分析和调试支持。
> 
> **学习时间**：10-15分钟
> 
> **前置要求**：了解基本的JSON配置，熟悉系统监控概念

## 什么是可观测性

可观测性是iFlow CLI提供的监控分析系统，让您能够深入了解CLI的性能表现、运行状态和使用情况。通过启用可观测性功能，您可以获得追踪数据、性能指标和结构化日志，从而更好地监控操作、调试问题和优化使用体验。

## 核心特点

| 特点 | 说明 | 优势 |
|------|------|------|
| 标准化协议 | 基于OpenTelemetry标准构建 | 兼容各种监控后端 |
| 多种数据类型 | 支持追踪、指标、日志三种数据 | 全面的可观测性 |
| 灵活配置 | 支持本地和云端多种输出方式 | 适应不同部署环境 |
| 隐私保护 | 可配置是否记录敏感信息 | 保护用户隐私 |
| 性能优化 | 异步处理，不影响CLI性能 | 无感知监控 |

## 工作原理

### 可观测性数据流

```
CLI操作 → 数据收集 → 数据处理 → 数据输出 → 监控分析
    ↓
[用户行为] → [追踪记录] → [指标聚合] → [本地/云端] → [性能洞察]
```

### 技术架构

- **数据收集**：基于OpenTelemetry SDK自动收集性能数据
- **数据处理**：结构化处理，支持过滤和聚合
- **数据输出**：支持本地文件、OTLP端点、云服务等多种输出
- **隐私保护**：可配置的数据脱敏和过滤机制

## 详细功能说明

### 配置管理

可观测性功能支持多种灵活的配置方式，主要通过配置文件和环境变量进行管理，CLI标志可以覆盖特定会话的设置。

#### 配置优先级

| 优先级 | 配置方式 | 说明 |
|--------|----------|------|
| 最高 | CLI标志 | 临时覆盖当前会话 |
| 高 | 环境变量 | 全局环境配置 |
| 中 | 项目配置 | `.iflow/settings.json` |
| 低 | 用户配置 | `~/.iflow/settings.json` |
| 最低 | 默认值 | 系统默认设置 |

#### CLI标志参数

| 参数 | 功能 | 示例 |
|------|------|------|
| `--telemetry` / `--no-telemetry` | 启用/禁用可观测性 | `iflow --telemetry` |
| `--telemetry-target <local\|gcp>` | 设置输出目标 | `iflow --telemetry-target local` |
| `--telemetry-otlp-endpoint <URL>` | 设置OTLP端点 | `iflow --telemetry-otlp-endpoint http://localhost:4317` |
| `--telemetry-outfile <path>` | 导出到文件 | `iflow --telemetry-outfile ./metrics.json` |
| `--telemetry-log-prompts` | 记录提示词 | `iflow --telemetry-log-prompts` |

#### 环境变量

| 变量名 | 作用 | 示例 |
|--------|------|------|
| `OTEL_EXPORTER_OTLP_ENDPOINT` | 设置OTLP导出端点 | `http://localhost:4317` |

#### 默认设置

| 配置项 | 默认值 | 说明 |
|--------|--------|------|
| `telemetry.enabled` | `false` | 默认关闭可观测性 |
| `telemetry.target` | `local` | 本地输出 |
| `telemetry.otlpEndpoint` | `http://localhost:4317` | 本地OTLP端点 |
| `telemetry.logPrompts` | `true` | 记录提示词 |

### 配置示例

#### 本地开发环境

在 `.iflow/settings.json` 中启用本地可观测性：

```json
{
  "telemetry": {
    "enabled": true,
    "target": "gcp"
  },
  "sandbox": false
}
```

### 导出到文件

您可以将所有可观测性数据导出到本地文件，方便进行详细分析和检查。

只需使用 `--telemetry-outfile` 标志并指定输出文件路径即可开启文件导出功能。注意这个功能需要配合 `--telemetry-target=local` 使用。

```bash
iflow --telemetry --telemetry-target=local --telemetry-outfile=/path/to/telemetry.log "your prompt"
```

## 运行 OTEL 收集器

OTEL 收集器是一个强大的服务，负责接收、处理和导出可观测性数据。
CLI 通过高效的 OTLP/gRPC 协议发送数据。

想了解更多 OTEL 导出器的标准配置？请查看 [官方文档][otel-config-docs] 获取详细信息。

[otel-config-docs]: https://opentelemetry.io/docs/languages/sdk-configuration/otlp-exporter/

### 本地部署

使用 `npm run telemetry -- --target=local` 命令可以轻松自动化设置本地可观测性管道，包括自动配置 `.iflow/settings.json` 文件中的必要设置。脚本会帮您安装 `otelcol-contrib`（OpenTelemetry 收集器）和 `jaeger`（用于可视化追踪的 Jaeger UI）。

**使用步骤：**

1.  **运行命令**：
    在仓库根目录执行以下命令：

    ```bash
    npm run telemetry -- --target=local
    ```

    脚本会自动为您完成以下工作：
    - 按需下载 Jaeger 和 OTEL 组件
    - 启动本地 Jaeger 实例
    - 启动配置好的 OTEL 收集器来接收 iFlow CLI 数据
    - 自动在您的工作区设置中启用可观测性
    - 退出时自动禁用可观测性

2.  **查看追踪**：
    打开浏览器访问 **http://localhost:16686** 来使用 Jaeger UI。在这里您可以深入查看 iFlow CLI 操作的详细追踪信息。

3.  **检查日志和指标**：
    脚本会将 OTEL 收集器的输出（包括日志和指标）保存到 `~/.iflow/tmp/<projectHash>/otel/collector.log`。脚本会提供便捷的查看链接和本地命令来跟踪您的可观测性数据。

4.  **停止服务**：
    在运行脚本的终端中按 `Ctrl+C` 即可停止 OTEL 收集器和 Jaeger 服务。

## 日志和指标参考

以下部分详细介绍了 iFlow CLI 生成的日志和指标结构，帮助您更好地理解和分析数据。

- 所有日志和指标都包含 `sessionId` 作为通用标识属性。

### 日志

日志记录了特定事件的时间戳信息，iFlow CLI 会记录以下重要事件：

- `iflow_cli.config`：此事件在启动时发生一次，包含 CLI 的配置。
  - **属性**：
    - `model`（字符串）
    - `embedding_model`（字符串）
    - `sandbox_enabled`（布尔值）
    - `core_tools_enabled`（字符串）
    - `approval_mode`（字符串）
    - `api_key_enabled`（布尔值）
    - `vertex_ai_enabled`（布尔值）
    - `code_assist_enabled`（布尔值）
    - `log_prompts_enabled`（布尔值）
    - `file_filtering_respect_git_ignore`（布尔值）
    - `debug_mode`（布尔值）
    - `mcp_servers`（字符串）

- `iflow_cli.user_prompt`：此事件在用户提交提示时发生。
  - **属性**：
    - `prompt_length`
    - `prompt`（如果 `log_prompts_enabled` 配置为 `false`，则排除此属性）
    - `auth_type`

- `iflow_cli.tool_call`：此事件为每个函数调用发生。
  - **属性**：
    - `function_name`
    - `function_args`
    - `duration_ms`
    - `success`（布尔值）
    - `decision`（字符串："accept"、"reject" 或 "modify"，如果适用）
    - `error`（如果适用）
    - `error_type`（如果适用）

- `iflow_cli.api_request`：此事件在向 iFlow API 发出请求时发生。
  - **属性**：
    - `model`
    - `request_text`（如果适用）

- `iflow_cli.api_error`：此事件在 API 请求失败时发生。
  - **属性**：
    - `model`
    - `error`
    - `error_type`
    - `status_code`
    - `duration_ms`
    - `auth_type`

- `iflow_cli.api_response`：此事件在收到来自 iFlow API 的响应时发生。
  - **属性**：
    - `model`
    - `status_code`
    - `duration_ms`
    - `error`（可选）
    - `input_token_count`
    - `output_token_count`
    - `cached_content_token_count`
    - `thoughts_token_count`
    - `tool_token_count`
    - `response_text`（如果适用）
    - `auth_type`

- `iflow_cli.flash_fallback`：此事件在 iFlow CLI 切换到 flash 作为回退时发生。
  - **属性**：
    - `auth_type`

- `iflow_cli.slash_command`：此事件在用户执行斜杠命令时发生。
  - **属性**：
    - `command`（字符串）
    - `subcommand`（字符串，如果适用）

### 指标

指标提供了随时间变化的数值化行为测量，iFlow CLI 收集以下关键指标：

- `iflow_cli.session.count`（计数器，整数）：每次 CLI 启动时递增一次。

- `iflow_cli.tool.call.count`（计数器，整数）：计算工具调用次数。
  - **属性**：
    - `function_name`
    - `success`（布尔值）
    - `decision`（字符串："accept"、"reject" 或 "modify"，如果适用）

- `iflow_cli.tool.call.latency`（直方图，毫秒）：测量工具调用延迟。
  - **属性**：
    - `function_name`
    - `decision`（字符串："accept"、"reject" 或 "modify"，如果适用）

- `iflow_cli.api.request.count`（计数器，整数）：计算所有 API 请求。
  - **属性**：
    - `model`
    - `status_code`
    - `error_type`（如果适用）

- `iflow_cli.api.request.latency`（直方图，毫秒）：测量 API 请求延迟。
  - **属性**：
    - `model`

- `iflow_cli.token.usage`（计数器，整数）：计算使用的令牌数量。
  - **属性**：
    - `model`
    - `type`（字符串："input"、"output"、"thought"、"cache" 或 "tool"）

- `iflow_cli.file.operation.count`（计数器，整数）：计算文件操作次数。
  - **属性**：
    - `operation`（字符串："create"、"read"、"update"）：文件操作的类型。
    - `lines`（整数，如果适用）：文件中的行数。
    - `mimetype`（字符串，如果适用）：文件的 MIME 类型。
    - `extension`（字符串，如果适用）：文件的扩展名。

### 云部署环境

对于云部署，请参考以下平台的可观测性集成指南：

#### Google Cloud Platform (GCP)

**配置示例**
```json
{
  "telemetry": {
    "enabled": true,
    "target": "gcp",
    "gcpProjectId": "your-project-id",
    "gcpServiceAccount": "path/to/service-account.json"
  }
}
```

**环境变量设置**
```bash
export GOOGLE_APPLICATION_CREDENTIALS="path/to/service-account.json"
export GOOGLE_CLOUD_PROJECT="your-project-id"
```

#### 其他云平台

**AWS集成**
- 支持通过OTLP协议向AWS X-Ray发送追踪数据
- 可配置CloudWatch指标收集

**Azure集成**
- 支持Application Insights集成
- 提供Azure Monitor兼容的数据格式

## 使用示例

### 基本配置启用

#### CLI启动时启用可观测性

```bash
# 启用可观测性并设置本地输出
iflow --telemetry --telemetry-target local

# 启用可观测性并设置OTLP端点
iflow --telemetry --telemetry-otlp-endpoint http://localhost:4317

# 启用可观测性并记录提示词内容
iflow --telemetry --telemetry-log-prompts
```

#### 项目级配置

在项目根目录创建 `.iflow/settings.json`：

```json
{
  "telemetry": {
    "enabled": true,
    "target": "local",
    "otlpEndpoint": "http://localhost:4317",
    "logPrompts": true,
    "outputFile": "./logs/telemetry.json"
  }
}
```

#### 全局用户配置

在 `~/.iflow/settings.json` 中配置：

```json
{
  "telemetry": {
    "enabled": false,
    "target": "local",
    "defaultEndpoint": "http://localhost:4317"
  }
}
```

### 高级使用场景

#### 性能监控

```bash
# 启用详细性能监控
iflow --telemetry --telemetry-target local --telemetry-outfile performance.log

# 执行任务并监控性能
"请分析这个大型项目"

# 查看性能数据
cat performance.log | jq '.metrics[] | select(.name == "iflow_cli.api.request.latency")'
```

#### 团队协作监控

```bash
# 团队共享OTLP收集器
iflow --telemetry --telemetry-otlp-endpoint http://team-collector:4317

# 设置团队标识
export OTEL_RESOURCE_ATTRIBUTES="team=frontend,project=webapp"
```

#### 调试模式数据收集

```bash
# 启用完整调试可观测性
iflow --telemetry --telemetry-log-prompts --telemetry-outfile debug.log

# 执行问题操作
"执行可能有问题的操作"

# 分析调试数据
grep "error" debug.log | jq .
```

## 故障排除

### 常见问题及解决方案

| 问题 | 可能原因 | 解决方案 |
|------|----------|----------|
| 可观测性数据不记录 | 可观测性功能未启用 | 使用 `--telemetry` 标志或配置文件启用 |
| OTLP连接失败 | 端点不可访问或配置错误 | 检查端点URL和网络连接 |
| 文件导出失败 | 磁盘空间不足或权限问题 | 检查磁盘空间和文件写入权限 |
| 数据不完整 | 过滤配置过于严格 | 检查数据过滤和脱敏设置 |
| 性能影响明显 | 可观测性数据量过大 | 调整采样率或减少记录详情 |

### 诊断步骤

#### 1. 基础配置检查

```bash
# 检查当前配置状态
/about

# 查看可观测性相关设置
cat .iflow/settings.json | jq '.telemetry'

# 验证CLI标志是否生效
iflow --help | grep telemetry
```

#### 2. 连接性测试

```bash
# 测试OTLP端点连接
curl -X POST http://localhost:4317/v1/traces -H "Content-Type: application/json" -d '{}'

# 检查本地收集器状态
ps aux | grep otelcol

# 验证网络端口开放
netstat -ln | grep 4317
```

#### 3. 数据验证

```bash
# 检查输出文件内容
tail -f /path/to/telemetry.log

# 验证数据格式
cat telemetry.log | jq '.traces[0]'

# 统计数据量
wc -l telemetry.log
```

#### 4. 性能分析

```bash
# 监控CLI性能
time iflow --telemetry "简单测试命令"

# 检查可观测性开销
iflow --telemetry --telemetry-outfile perf.log "测试" && ls -la perf.log

# 对比开关可观测性性能
time iflow "相同命令" # 无可观测性
time iflow --telemetry "相同命令" # 有可观测性
```

### 数据隐私保护

#### 敏感信息过滤

- **提示词保护**：使用 `--no-telemetry-log-prompts` 禁用提示词记录
- **参数过滤**：自动过滤包含密码、密钥的工具参数
- **路径脱敏**：用户路径信息进行哈希处理
- **内容清理**：自动识别和清理敏感内容

#### 数据存储安全

- **本地存储**：默认数据仅存储在本地文件系统
- **传输加密**：OTLP协议支持TLS加密传输
- **访问控制**：配置文件和日志文件权限控制
- **数据保留**：可配置数据自动清理策略

### 平台兼容性

| 平台 | 支持程度 | 特殊说明 |
|------|----------|----------|
| Windows | 完全支持 | 路径分隔符自动处理，支持PowerShell |
| macOS | 完全支持 | 支持系统级OpenTelemetry集成 |
| Linux | 完全支持 | 原生OpenTelemetry支持，完整容器兼容性 |

### 容器化部署注意事项

- **Docker环境**：需要正确配置网络和卷挂载
- **Kubernetes集成**：支持通过Service Mesh收集数据
- **权限管理**：容器内需要适当的文件系统权限