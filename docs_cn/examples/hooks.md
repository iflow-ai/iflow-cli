---
title: Hooks
description: 配置 Hooks，允许 iFlow CLI 在特定事件发生时自动执行自定义命令
sidebar_position: 7
---

# Hooks 配置

## 概述

Hooks（钩子）是 iFlow CLI 中的事件驱动机制，允许您在特定的生命周期事件发生时自动执行自定义命令。通过配置 Hooks，您可以实现工具调用前后的自动化处理、环境设置增强、会话停止时的清理操作等功能。

### 主要功能

- **工具调用拦截**：在工具执行前后运行自定义逻辑
- **环境增强**：在会话开始时动态设置环境信息
- **生命周期管理**：在会话或子代理停止时执行清理操作
- **灵活配置**：支持用户级和项目级的分层配置
- **安全控制**：可阻止工具执行或修改工具行为

## Hook 类型

iFlow CLI 支持以下 9 种 Hook 类型：

### 1. PreToolUse Hook
**触发时机**：在工具执行之前
**用途**：
- 验证工具参数
- 设置执行环境
- 记录工具调用日志
- 阻止不安全的操作

**示例配置**：
```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'File edit detected'"
          }
        ]
      }
    ]
  }
}
```

### 2. PostToolUse Hook
**触发时机**：在工具执行之后
**用途**：
- 处理工具执行结果
- 清理临时文件
- 发送通知
- 记录执行统计

**示例配置**：
```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "write_file",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'File operation completed'"
          }
        ]
      }
    ]
  }
}
```

### 3. SetUpEnvironment Hook
**触发时机**：会话开始时，环境信息设置阶段
**用途**：
- 动态生成项目信息
- 设置运行时环境变量
- 增强 AI 的上下文信息
- 加载项目特定配置

**示例配置**：
```json
{
  "hooks": {
    "SetUpEnvironment": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "echo 'Session environment initialized'"
          }
        ]
      }
    ]
  }
}
```

### 4. Stop Hook
**触发时机**：主会话结束时
**用途**：
- 清理会话资源
- 保存会话信息
- 发送会话总结
- 执行清理脚本

**示例配置**：
```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "echo 'Main session ended'"
          }
        ]
      }
    ]
  }
}
```


### 5. SubagentStop Hook
**触发时机**：子代理会话结束时
**用途**：
- 清理子代理资源
- 记录子任务执行情况
- 合并子任务结果
- 执行子任务后处理

**示例配置**：
```json
{
  "hooks": {
    "SubagentStop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "echo 'Subagent task completed'"
          }
        ]
      }
    ]
  }
}
```

### 6. SessionStart Hook
**触发时机**：会话开始时（启动、恢复、清理、压缩）
**用途**：
- 初始化会话环境
- 设置日志记录
- 发送会话开始通知
- 执行启动时的预处理

**支持matcher**：是 - 可以根据会话启动来源进行匹配（startup、resume、clear、compress）

**示例配置**：
```json
{
  "hooks": {
    "SessionStart": [
      {
        "matcher": "startup",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'New session started'"
          }
        ]
      }
    ]
  }
}
```

### 7. SessionEnd Hook
**触发时机**：会话正常结束时
**用途**：
- 生成会话总结报告
- 备份会话数据
- 发送会话结束通知
- 执行会话清理操作

**示例配置**：
```json
{
  "hooks": {
    "SessionEnd": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "python3 ~/.iflow/hooks/session_report.py",
            "timeout": 30
          }
        ]
      }
    ]
  }
}
```

### 8. UserPromptSubmit Hook
**触发时机**：用户提交提示词之前，在iFlow处理之前
**用途**：
- 内容过滤和审核
- 提示词预处理和增强
- 阻止不当的用户输入
- 记录用户交互日志

**支持matcher**：是 - 可以根据提示词内容进行匹配
**特殊行为**：可以阻止提示词提交（返回非零退出码）

**示例配置**：
```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "matcher": ".*sensitive.*",
        "hooks": [
          {
            "type": "command",
            "command": "python3 ~/.iflow/hooks/content_filter.py",
            "timeout": 10
          }
        ]
      }
    ]
  }
}
```

### 9. Notification Hook
**触发时机**：当iFlow向用户发送通知时
**用途**：
- 通知内容记录
- 第三方系统集成
- 通知格式转换
- 自定义通知处理

**支持matcher**：是 - 可以根据通知消息内容进行匹配
**特殊行为**：退出码2不阻止通知，仅将stderr显示给用户

**示例配置**：
```json
{
  "hooks": {
    "Notification": [
      {
        "matcher": ".*permission.*",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'Permission notification logged' >> ~/.iflow/permission.log"
          }
        ]
      }
    ]
  }
}
```


## 配置方式

### 1. 配置层级

Hooks 配置遵循 iFlow CLI 的分层配置系统：

- **用户配置**：`~/.iflow/settings.json`
- **项目配置**：`./.iflow/settings.json`
- **系统配置**：系统级配置文件

高层级的配置会与低层级配置合并，项目配置会补充用户配置。

### 2. 配置格式

在 `settings.json` 文件中添加 `hooks` 配置项：

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "tool_pattern",
        "hooks": [
          {
            "type": "command",
            "command": "your_command",
            "timeout": 30
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "another_pattern",
        "hooks": [
          {
            "type": "command",
            "command": "cleanup_command"
          }
        ]
      }
    ],
    "SetUpEnvironment": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "python ~/.iflow/hooks/env_enhancer.py",
            "timeout": 30
          }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "echo 'Session ended'"
          }
        ]
      }
    ],
    "SubagentStop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "cleanup_subagent.sh"
          }
        ]
      }
    ],
    "SessionStart": [
      {
        "matcher": "startup",
        "hooks": [
          {
            "type": "command",
            "command": "echo 'Session initialized'"
          }
        ]
      }
    ],
    "SessionEnd": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "python ~/.iflow/hooks/session_summary.py"
          }
        ]
      }
    ],
    "UserPromptSubmit": [
      {
        "matcher": ".*sensitive.*",
        "hooks": [
          {
            "type": "command",
            "command": "python ~/.iflow/hooks/content_filter.py"
          }
        ]
      }
    ],
    "Notification": [
      {
        "matcher": ".*permission.*",
        "hooks": [
          {
            "type": "command",
            "command": "logger 'iFlow permission request'"
          }
        ]
      }
    ]
  }
}
```

### 3. Hook 配置项说明

每个 Hook 类型包含一个配置数组，每个配置项包含：

#### 通用字段

- **`hooks`** (必需)：Hook 命令数组，每个命令包含：
  - **`type`**：命令类型，目前仅支持 `"command"`
  - **`command`**：要执行的命令字符串
  - **`timeout`**：超时时间（秒），可选，默认无超时

#### 工具相关 Hook（PreToolUse/PostToolUse）专用字段

- **`matcher`**：工具匹配模式，用于指定Hook应该在哪些工具执行时触发

##### 匹配模式

| 匹配模式 | 语法示例 | 说明 |
|---------|---------|------|
| 通配符匹配 | `"*"` 或 `""` | 匹配所有工具（默认行为） |
| 精确匹配 | `"Edit"` | 只匹配名为"Edit"的工具或别名 |
| 正则表达式 | `"Edit\|MultiEdit\|Write"` | 匹配多个工具名或别名 |
| 模式匹配 | `".*_file"` | 匹配以"_file"结尾的工具名 |
| MCP工具匹配 | `"mcp__.*"` | 匹配所有MCP工具 |
| MCP服务器匹配 | `"mcp__github__.*"` | 匹配特定MCP服务器的所有工具 |

##### 匹配规则

- **大小写敏感**：matcher匹配是区分大小写的
- **正则表达式**：包含 `|\\^$.*+?()[]{}` 等字符时自动识别为正则表达式
- **工具别名**：匹配时会同时检查工具名和别名
- **错误处理**：无效的正则表达式会回退到精确匹配模式

##### Hook类型与matcher支持

| Hook类型 | 支持matcher | 说明 |
|----------|-------------|------|
| PreToolUse | ✅ | 可以指定匹配特定工具 |
| PostToolUse | ✅ | 可以指定匹配特定工具 |
| SetUpEnvironment | ❌ | 始终执行，不支持matcher |
| Stop | ❌ | 始终执行，不支持matcher |
| SubagentStop | ❌ | 始终执行，不支持matcher |
| SessionStart | ✅ | 可以根据会话启动来源匹配（startup、resume、clear、compress） |
| SessionEnd | ❌ | 始终执行，不支持matcher |
| UserPromptSubmit | ✅ | 可以根据用户提示词内容匹配 |
| Notification | ✅ | 可以根据通知消息内容匹配 |

##### 常用工具名称参考

| 工具类别 | 实际工具名 | 常用别名 |
|---------|-----------|----------|
| 文件编辑 | `replace` | `Edit`, `edit`, `Write`, `write` |
| 批量编辑 | `multi_edit` | `MultiEdit`, `multiEdit` |
| 文件写入 | `write_file` | `write`, `create`, `save` |
| 文件读取 | `read_file` | `read` |
| Shell执行 | `run_shell_command` | `shell`, `Shell`, `bash`, `Bash` |
| 文件搜索 | `search_file_content` | `grep`, `search` |
| 目录列表 | `list_directory` | `ls`, `list` |

#### 特殊约束

- **SetUpEnvironment Hook**：不支持 `matcher` 字段，对所有会话生效
- **Stop/SubagentStop/SessionEnd Hook**：不支持 `matcher` 字段，在相应生命周期结束时执行
- **UserPromptSubmit Hook**：可通过返回非零退出码阻止提示词提交
- **Notification Hook**：退出码2有特殊含义，不阻止通知显示，仅将stderr内容显示给用户

## 复杂配置示例

### 1. 文件保护 Hook

**Python脚本 (file_protection.py)**：
```python
import json, sys
data = json.load(sys.stdin)
file_path = data.get('tool_input', {}).get('file_path', '')
sensitive_files = ['.env', 'package-lock.json', '.git/']
sys.exit(2 if any(p in file_path for p in sensitive_files) else 0)
```

**功能描述**：在文件编辑操作执行前进行安全检查，阻止对敏感文件的修改操作。

**前置依赖**：
- 系统需要安装 `python3`
- 确保Python能够正常执行并访问标准输入

**具体功能**：
- 监控所有文件编辑操作（Edit、MultiEdit、Write工具）
- 检查目标文件路径是否包含敏感文件（.env、package-lock.json、.git/目录）
- 如果检测到敏感文件，返回退出码2阻止工具执行
- 提供文件操作的安全防护，避免意外修改重要配置文件



**Hook配置**：
```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|MultiEdit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "python3 file_protection.py",
            "timeout": 10
          }
        ]
      }
    ]
  }
}
```

### 2. TypeScript 代码格式化

**功能描述**：在文件编辑操作完成后自动对TypeScript文件进行代码格式化，确保代码风格的一致性。

**前置依赖**：
- 系统需要安装 `jq` 工具（用于JSON数据处理）
- 需要安装 `prettier` 代码格式化工具（`npm install -g prettier` 或项目本地安装）
- 确保项目中有prettier配置文件或使用默认配置

**具体功能**：
- 监控文件编辑和写入操作（Edit、MultiEdit、write_file工具）
- 从工具参数中提取文件路径信息
- 检查文件是否为TypeScript文件（.ts扩展名）
- 对符合条件的文件自动执行prettier格式化
- 提升代码质量和团队协作效率

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|MultiEdit|Write",
        "hooks": [
          {
            "type": "command", 
            "command": "bash -c 'path=$(jq -r \".tool_input.file_path\"); [[ $path == *.ts ]] && npx prettier --write \"$path\"'",
            "timeout": 30
          }
        ]
      }
    ]
  }
}
```

### 3. 会话管理与性能监控

**Python脚本 (session_summary.py)**：
```python
import os, datetime, subprocess
session_id = os.environ.get('IFLOW_SESSION_ID', 'unknown')
timestamp = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
summary_dir = os.path.expanduser('~/.iflow/session-summaries')
os.makedirs(summary_dir, exist_ok=True)
try:
    git_log = subprocess.check_output(['git', 'log', '--oneline', '-3']).decode().strip()
except:
    git_log = 'No git repository'
summary_content = f'# Session Summary\\n\\n**ID:** {session_id}\\n**Time:** {timestamp}\\n\\n**Git Log:**\\n```\\n{git_log}\\n```'
with open(f'{summary_dir}/session-{session_id}.md', 'w') as f:
    f.write(summary_content)
```

**功能描述**：在会话结束时自动生成会话总结，在子代理结束时记录性能指标，实现完整的会话生命周期管理。

**前置依赖**：
- 系统需要安装 `python3`
- 需要 `git` 命令（用于获取仓库活动信息）
- 确保有足够的磁盘空间存储会话总结和性能数据

**具体功能**：
- **会话总结生成**：在主会话结束时生成包含会话ID、结束时间、工作目录和近期Git活动的Markdown总结文件
- **性能指标收集**：记录子代理的运行时间、类型、成功状态等性能数据到JSONL格式文件
- **自动目录创建**：自动创建 `~/.iflow/session-summaries` 和 `~/.iflow/metrics` 目录
- **环境变量支持**：利用 `IFLOW_SESSION_ID`、`IFLOW_AGENT_TYPE`、`IFLOW_SUBAGENT_START_TIME` 等环境变量
- **容错处理**：Git命令失败时提供默认值，确保总结生成不被中断

**Hook配置**：
```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "python3 session_summary.py",
            "timeout": 15
          }
        ]
      }
    ]
  }
}
```

### 4. 用户输入内容过滤

**Python脚本 (content_filter.py)**：
```python
import json, sys, re
data = json.load(sys.stdin)
prompt = data.get('prompt', '')
# 检查是否包含敏感信息
sensitive_patterns = [
    r'password\s*[=:]\s*\S+',
    r'api[_-]?key\s*[=:]\s*\S+',
    r'secret\s*[=:]\s*\S+',
    r'\b\d{4}[\s-]?\d{4}[\s-]?\d{4}[\s-]?\d{4}\b'  # 信用卡号
]
for pattern in sensitive_patterns:
    if re.search(pattern, prompt, re.IGNORECASE):
        print(f"检测到敏感信息，请移除后重新提交", file=sys.stderr)
        sys.exit(1)  # 阻止提示词提交
print("内容审核通过")
```

**功能描述**：在用户提交提示词前进行内容过滤，检测并阻止包含敏感信息的输入。

**前置依赖**：
- 系统需要安装 `python3`
- 确保Python的正则表达式模块可用

**具体功能**：
- 监控用户提交的所有提示词内容
- 使用正则表达式检测密码、API密钥、信用卡号等敏感信息
- 如果检测到敏感内容，返回退出码1阻止提示词提交
- 提供清晰的错误信息指导用户修改输入
- 保护用户隐私和数据安全

**Hook配置**：
```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "python3 content_filter.py",
            "timeout": 5
          }
        ]
      }
    ]
  }
}
```

### 5. 通知处理与集成

**Bash脚本 (notification_handler.sh)**：
```bash
#!/bin/bash
# 从stdin读取通知信息
notification_data=$(cat)
message=$(echo "$notification_data" | jq -r '.message // "Unknown message"')
timestamp=$(date '+%Y-%m-%d %H:%M:%S')

# 记录到日志文件
echo "[$timestamp] iFlow Notification: $message" >> ~/.iflow/notifications.log

# 如果是权限请求，发送到Slack
if [[ "$message" == *"permission"* ]]; then
    curl -X POST -H 'Content-type: application/json' \
         --data "{\"text\":\"iFlow Permission Request: $message\"}" \
         "$SLACK_WEBHOOK_URL" 2>/dev/null || true
fi

# 如果是错误通知，发送邮件告警
if [[ "$message" == *"error"* ]] || [[ "$message" == *"failed"* ]]; then
    echo "iFlow Error: $message" | mail -s "iFlow Alert" admin@company.com 2>/dev/null || true
fi
```

**功能描述**：处理iFlow的通知消息，实现日志记录和第三方系统集成。

**前置依赖**：
- 系统需要安装 `jq`、`curl`、`mail` 命令
- 配置 `SLACK_WEBHOOK_URL` 环境变量
- 配置邮件系统

**具体功能**：
- 捕获所有iFlow通知消息
- 将通知记录到本地日志文件
- 对权限请求类通知自动发送到Slack频道
- 对错误类通知发送邮件告警
- 支持多种通知渠道集成

**Hook配置**：
```json
{
  "hooks": {
    "Notification": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "bash ~/.iflow/hooks/notification_handler.sh",
            "timeout": 10
          }
        ]
      }
    ]
  }
}
```

### 6. Git状态环境增强器

**Python脚本 (git_status.py)**：
```python
import subprocess, os
try:
    branch = subprocess.check_output(['git', 'rev-parse', '--abbrev-ref', 'HEAD']).decode().strip()
    status = subprocess.check_output(['git', 'status', '--porcelain']).decode().strip()
    commit = subprocess.check_output(['git', 'log', '-1', '--oneline']).decode().strip()
    print(f'## Git信息\\n\\n**分支:** {branch}\\n**状态:** {"干净" if not status else "有变更"}\\n**最新提交:** {commit}')
except:
    print('## Git信息\\n\\n未找到Git仓库')
```

**功能描述**：在会话开始时自动获取并展示当前Git仓库的详细状态信息，为AI提供项目背景上下文。

**前置依赖**：
- 系统需要安装 `python3`
- 需要 `git` 命令和有效的Git仓库
- 确保当前工作目录位于Git仓库中
- 需要对仓库有读取权限

**具体功能**：
- **分支信息获取**：自动识别并显示当前所在的Git分支名称
- **工作目录状态**：检查并显示工作目录中的未提交更改（修改、新增、删除的文件）
- **最新提交信息**：获取并显示最近一次提交的简要信息（哈希值和提交消息）
- **格式化输出**：将Git状态信息格式化为清晰的Markdown格式，便于AI理解项目当前状态
- **状态判断**：自动判断工作目录是否干净，分别显示不同的状态信息
- **增强AI上下文**：帮助AI更好地理解项目的版本控制状态，做出更合适的决策

**Hook配置**：
```json
{
  "hooks": {
    "SetUpEnvironment": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "python3 git_status.py",
            "timeout": 10
          }
        ]
      }
    ]
  }
}
```

## Hook 执行机制

### 1. 执行流程

1. **事件触发**：当相应的生命周期事件发生时
2. **匹配检查**：检查 Hook 配置的匹配条件（如工具名称）
3. **并行执行**：符合条件的 Hook 命令并行执行
4. **结果处理**：收集执行结果和输出
5. **错误处理**：处理执行失败的情况

### 2. 执行环境

Hook 命令在以下环境中执行：

- **工作目录**：当前 iFlow CLI 工作目录
- **环境变量**：继承 iFlow CLI 的环境变量
- **通用特殊变量**：
  - `IFLOW_SESSION_ID`：当前会话ID（所有Hook）
  - `IFLOW_TRANSCRIPT_PATH`：会话记录文件路径（所有Hook）
  - `IFLOW_CWD`：当前工作目录（所有Hook）
  - `IFLOW_HOOK_EVENT_NAME`：触发的Hook事件名称（所有Hook）

- **工具相关Hook专用变量**：
  - `IFLOW_TOOL_NAME`：当前工具名称（PreToolUse/PostToolUse Hook）
  - `IFLOW_TOOL_ARGS`：工具参数的 JSON 字符串（PreToolUse/PostToolUse Hook）
  - `IFLOW_TOOL_ALIASES`：工具别名数组的 JSON 字符串（PreToolUse/PostToolUse Hook）

- **会话相关Hook专用变量**：
  - `IFLOW_SESSION_SOURCE`：会话启动来源，如startup、resume、clear、compress（SessionStart Hook）

- **用户输入Hook专用变量**：
  - `IFLOW_USER_PROMPT`：用户提交的原始提示词内容（UserPromptSubmit Hook）

- **通知Hook专用变量**：
  - `IFLOW_NOTIFICATION_MESSAGE`：通知消息内容（Notification Hook）

### 3. 返回值处理

- **可阻塞执行的Hook**：
  - **PreToolUse Hook**：返回码非0阻止工具执行，显示错误信息
  - **UserPromptSubmit Hook**：返回码非0阻止提示词提交，显示错误信息

- **特殊处理的Hook**：
  - **Notification Hook**：
    - 返回码0：正常处理，显示标准输出
    - 返回码2：不阻止通知显示，仅将stderr内容显示给用户
    - 其他返回码：显示警告信息，但不影响通知流程

- **其他 Hook**：
  - 返回码不影响主流程
  - 错误输出会显示警告信息
  - 标准输出会显示给用户

### 4. 超时处理

- 配置了 `timeout` 的 Hook 会在指定时间后终止
- 超时不会中断主流程，但会记录警告
- 未配置超时的 Hook 使用系统默认超时

## 高级功能

### 1. 条件执行

通过在 Hook 脚本中添加条件判断：

```bash
#!/bin/bash
# 只在 Git 仓库中执行
if [ -d ".git" ]; then
    echo "在 Git 仓库中执行特殊操作"
    # 你的逻辑
fi
```

### 2. 参数传递

Hook 可以通过环境变量接收相关参数：

```python
import os
import json

# 通用环境变量（所有Hook可用）
session_id = os.environ.get('IFLOW_SESSION_ID', '')
hook_event = os.environ.get('IFLOW_HOOK_EVENT_NAME', '')
cwd = os.environ.get('IFLOW_CWD', '')

print(f"会话ID: {session_id}")
print(f"Hook事件: {hook_event}")
print(f"工作目录: {cwd}")

# 工具相关Hook专用变量
if hook_event in ['PreToolUse', 'PostToolUse']:
    tool_args = json.loads(os.environ.get('IFLOW_TOOL_ARGS', '{}'))
    tool_name = os.environ.get('IFLOW_TOOL_NAME', '')
    print(f"工具名称: {tool_name}")
    print(f"工具参数: {tool_args}")

# 用户输入Hook专用变量
if hook_event == 'UserPromptSubmit':
    user_prompt = os.environ.get('IFLOW_USER_PROMPT', '')
    print(f"用户提示词: {user_prompt}")

# 通知Hook专用变量
if hook_event == 'Notification':
    notification_message = os.environ.get('IFLOW_NOTIFICATION_MESSAGE', '')
    print(f"通知消息: {notification_message}")

# 会话启动Hook专用变量
if hook_event == 'SessionStart':
    session_source = os.environ.get('IFLOW_SESSION_SOURCE', '')
    print(f"会话启动来源: {session_source}")
```

### 3. 输出处理

Hook 的标准输出会显示给用户：

```bash
#!/bin/bash
echo "INFO: 开始执行预处理"
echo "WARNING: 检测到潜在风险"
echo "ERROR: 操作被阻止" >&2  # 错误输出
exit 1  # 阻止工具执行（仅 PreToolUse Hook）
```

### 4. 配置验证

iFlow CLI 会在启动时验证 Hook 配置：

- 检查 JSON 格式正确性
- 验证必需字段存在
- 检查字段类型和值范围
- 验证 Hook 类型特定约束

## 故障排除

### 1. Hook 不执行

**可能原因**：
- 配置文件格式错误
- 匹配模式不正确
- Hook 脚本路径错误
- 权限不足

**排查步骤**：
1. 检查 `settings.json` 格式
2. 验证 Hook 脚本是否存在且可执行
3. 查看 iFlow CLI 错误日志
4. 使用简单的测试 Hook 验证配置

### 2. Hook 执行失败

**可能原因**：
- 脚本语法错误
- 依赖程序不存在
- 权限不足
- 超时

**排查步骤**：
1. 手动执行 Hook 脚本测试
2. 检查脚本依赖是否安装
3. 增加 Hook 脚本的调试输出
4. 调整超时设置

### 3. 性能问题

**优化建议**：
- 减少不必要的 Hook
- 优化 Hook 脚本性能
- 设置合理的超时时间
- 避免阻塞操作

### 4. 调试技巧

#### 启用详细日志

```bash
export IFLOW_DEBUG=1
iflow
```

#### 创建测试 Hook

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "*",
        "hooks": [
          {
            "type": "command",
            "command": "echo \"Hook 触发: $IFLOW_TOOL_NAME\""
          }
        ]
      }
    ]
  }
}
```

#### 输出调试信息

```bash
#!/bin/bash
echo "DEBUG: Hook 开始执行"
echo "DEBUG: 工具名称: $IFLOW_TOOL_NAME"
echo "DEBUG: 工具参数: $IFLOW_TOOL_ARGS"
echo "DEBUG: 当前目录: $(pwd)"
echo "DEBUG: Hook 执行完成"
```

## 安全注意事项

### 1. 脚本安全

- **验证输入**：始终验证从环境变量获取的数据
- **路径检查**：避免路径注入攻击
- **权限最小化**：Hook 脚本使用最小必要权限

### 2. 执行环境

- **沙箱化**：考虑在受限环境中执行 Hook
- **资源限制**：设置合理的超时和资源限制
- **错误隔离**：Hook 错误不应影响主要功能

### 3. 配置安全

- **配置验证**：启动时验证 Hook 配置
- **路径限制**：限制 Hook 脚本的存放路径
- **权限检查**：检查配置文件和脚本权限

## 最佳实践

### 1. 配置管理

- **版本控制**：项目级 Hook 配置纳入版本控制
- **文档说明**：为每个 Hook 添加清晰的说明
- **模块化**：将相关 Hook 逻辑组织到独立脚本中

### 2. 脚本编写

- **错误处理**：添加完善的错误处理逻辑
- **日志记录**：记录 Hook 执行的关键信息
- **性能优化**：避免不必要的重复操作

### 3. 测试验证

- **单元测试**：为 Hook 脚本编写测试
- **集成测试**：测试 Hook 与 iFlow CLI 的集成
- **回归测试**：确保 Hook 更改不影响现有功能

### 4. 监控维护

- **执行监控**：监控 Hook 执行状态和性能
- **定期评审**：定期评审和更新 Hook 配置
- **文档维护**：保持 Hook 文档的及时更新

通过合理配置和使用 Hooks，您可以显著扩展 iFlow CLI 的功能，实现更加智能化和自动化的开发工作流程。Hook 系统提供了强大的扩展能力，让您能够根据具体需求定制 AI 助手的行为。