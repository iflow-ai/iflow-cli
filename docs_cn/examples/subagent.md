---
title: Sub Agent
description: 配置专业化的 AI 助手来处理特定开发任务
sidebar_position: 5
---

# Sub Agent

> **功能概述**：Sub Agent是iFlow CLI的智能Agent系统，根据任务类型自动选择最合适的专业Agent处理请求。
> 
> **学习时间**：10-15分钟
> 
> **前置要求**：已安装iFlow CLI，了解基本的斜杠命令使用

## 什么是Sub

Sub Agent是iFlow CLI中的智能分工系统，类似于拥有一个专业团队，每个成员都有自己的专长领域。系统能够根据不同的任务类型自动选择最合适的专业Agent来处理您的请求，确保每个任务都能得到最专业的处理。

## 核心特点

| 特点 | 说明 | 优势 |
|------|------|------|
| 专业化分工 | 每个Sub Agent针对特定领域优化 | 提高任务处理质量 |
| 工具访问控制 | 不同Agent访问不同工具集合 | 安全性和效率兼顾 |
| 智能调度 | 根据任务描述自动选择Agent | 用户无需手动选择 |
| 模型验证 | 自动验证模型兼容性 | 确保最佳性能表现 |
| 动态扩展 | 支持自定义和第三方Agent | 满足个性化需求 |

## 工作原理

### 任务分析与Agent选择

```
用户请求 → 任务分析 → Agent匹配 → 工具授权 → 任务执行
    ↓
[描述内容] → [领域识别] → [最佳Agent] → [工具集合] → [专业处理]
```

### Agent类型分类

- **开发类Agent**：代码审查、前端开发、后端开发、测试等
- **分析类Agent**：数据分析、性能分析、安全分析等  
- **创作类Agent**：文档编写、内容创作、翻译等
- **运维类Agent**：部署管理、监控报警、故障诊断等

## 详细功能说明

### Agent管理

#### 查看可用Agent

| 命令 | 功能 | 说明 |
|------|------|------|
| `/agents list` | 列出本地Agent | 显示已安装的Agent列表 |
| `/agents list desc` | 详细描述 | 显示Agent的详细功能说明 |
| `/agents online` | 在线市场 | 浏览可安装的Agent |
| `/agents install` | 安装向导 | 创建新Agent的引导式安装 |
| `/agents refresh` | 刷新Agent | 从源文件重新加载Agent配置 |

#### Agent市场导航

**在线浏览操作**

| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 向下浏览 | `j` 或 `↓` | 移动到下一个选项 |
| 向上浏览 | `k` 或 `↑` | 移动到上一个选项 |
| 返回上级 | `h` | 返回上级目录 |
| 进入选中项 | `l` 或 `Enter` | 查看详细信息或安装 |
| 退出浏览 | `q` | 退出浏览模式 |
| 刷新列表 | `r` | 重新加载Agent列表 |

```bash
# 进入在线Agent市场
/agents online
```

#### Agent安装管理

**通过CLI命令安装**

```bash
# 添加项目级别的Agent
iflow agent add <agent-name-or-id> --scope project

# 添加用户级别的Agent（全局作用域）
iflow agent add <agent-name-or-id> --scope global

# 实际示例
iflow agent add python-expert --scope project
iflow agent add code-reviewer --scope global

# 其他管理命令
iflow agent list              # 列出所有已配置的Agent
iflow agent remove <name>     # 移除指定Agent
iflow agent get <name>        # 查看Agent详细信息
iflow agent online            # 浏览在线Agent市场
```

**重要提醒**：使用第三方Sub Agent时请谨慎选择！确保您信任要安装的Agent配置，特别是那些可能访问敏感数据的Agent。

**引导式安装（推荐）**

使用 `/agents install` 命令启动引导式安装向导，支持三种创建方式：

```bash
# 启动Agent安装向导
/agents install
```

**安装向导功能**：

1. **智能创建模式**：
   - **iFlow生成**（推荐）：通过智能引导创建Agent
   - **手动配置**：逐步手动配置Agent参数
   - **在线仓库**：从在线Agent仓库安装

2. **配置选项**：
   - 安装位置选择（项目级别/用户级别）
   - 工具权限配置
   - MCP服务器访问权限
   - 自定义系统提示词
   - Agent外观颜色选择

3. **向导导航**：
   - 使用方向键 `↑/↓` 或 `j/k` 导航选项
   - `Enter` 确认选择
   - `Esc` 返回上一步
   - `q` 退出向导

**使用示例**：

```bash
# 步骤1：启动安装向导
/agents install

# 步骤2：选择安装位置
→ Project Agent (仅当前项目可用)
  User Agent (全局可用)

# 步骤3：选择创建方式
→ Generate with iFlow (recommended)
  Manual configuration
  From Online Repository

# 步骤4：描述Agent目标（iFlow模式）
Describe your agent goal: 审查代码安全性和最佳实践

# 步骤5：配置工具和权限
Select tools: [✓] Read [✓] Write [✓] Bash [ ] WebFetch
Select MCP servers: [✓] filesystem [✓] git

# 步骤6：预览并确认创建
Agent Type: code-security-reviewer
Description: 专门审查代码安全性和最佳实践的专家Agent
Tools: Read, Write, Bash
Location: Project Agent
```

**手动安装**
1. 创建Agent目录
```bash
mkdir -p ~/.iflow/agents
```

2. 创建自定义Agent
```bash
# 创建新的Agent文件
nano ~/.iflow/agents/my-agent.md
```

3. 重启 CLI 加载新Agent
```bash
iflow
```

**注意**  iFlow CLI会使用Task工具调用Sub Agent

### 快速调用功能

#### 使用 $ 符号快速调用

iFlow CLI支持使用 `$` 符号快速调用Sub Agent，类似于 `@` 符号选择文件的方式：

**基本语法**
```bash
$<agent-type> <任务描述>
```

**使用示例**
```bash
$code-reviewer 对当前项目进行代码审查
$frontend-developer 创建一个响应式的导航组件
$python-expert 优化这个算法的性能
$data-scientist 分析这个数据集的趋势
```

#### 快速调用特性

| 特性 | 说明 | 优势 |
|------|------|------|
| 智能补全 | 输入 `$` 后显示可用Agent列表 | 快速选择合适Agent |
| 快速执行 | 直接在当前对话中执行 | 无需额外配置步骤 |
| 实时反馈 | 显示Agent执行状态和过程 | 了解任务进展情况 |
| 可视化界面 | 工具调用过程可视化展示 | 提高用户体验 |
| 结果展示 | Agent响应直接显示在对话中 | 无缝集成到工作流 |

#### 使用技巧

1. **快速选择**：输入 `$` 后使用方向键或鼠标选择Agent类型
2. **明确任务**：提供清晰、具体的任务描述
3. **上下文感知**：Agent会自动获取当前项目的上下文信息
4. **工具权限**：Agent根据其配置获得相应的工具访问权限

### 预置Agent类型

#### 内置Agent

| Agent类型 | 功能描述 | 适用场景 |
|----------|----------|----------|
| general-purpose | 通用Agent | 复杂的多步骤任务 |

#### 扩展Agent

更丰富的Agent可以通过心流AI在线市场进行快速安装，包括：
- **代码审查专家**：专门用于代码质量检查
- **前端开发专家**：专注于前端技术和UI开发
- **数据分析专家**：处理数据分析和可视化任务
- **文档编写专家**：专业的技术文档创作

## 使用示例

### 常见使用场景

#### 代码审查
```bash
$code-reviewer 请对当前项目进行全面的代码审查，关注代码质量和最佳实践
```

#### 前端开发
```bash
$frontend-developer 创建一个响应式的用户登录组件，支持表单验证
```

#### 数据分析
```bash
$data-scientist 分析sales_data.csv中的销售趋势，生成可视化图表
```

#### 文档编写
```bash
$doc-writer 为这个API端点编写详细的技术文档和使用示例
```

### Agent协作场景

多个Agent可以在同一个项目中协作工作：

```bash
# 首先进行代码审查
$code-reviewer 检查当前代码的安全性问题

# 然后优化性能
$performance-expert 基于审查结果优化代码性能

# 最后生成文档
$doc-writer 为优化后的代码生成完整文档
```

## 智能模型管理

### 自动模型验证

| 功能 | 说明 | 优势 |
|------|------|------|
| 兼容性检测 | 执行前自动检查模型支持情况 | 避免执行错误 |
| 智能推荐 | 推荐最佳替代模型 | 保证任务质量 |
| 用户选择 | 提供模型选择对话框 | 保持用户控制权 |
| 偏好记忆 | 记住用户的模型选择偏好 | 简化后续操作 |

### 模型切换模式

**交互模式（默认）**
- 显示模型选择对话框
- 用户可以从可用模型列表中选择替代模型
- 支持"一次性"和"永久记住"两种选择

**YOLO模式**
- 自动使用推荐的替代模型
- 显示警告信息说明模型切换情况
- 无需用户干预，快速执行

## 自定义Agent配置

### 配置文件管理

在项目的 `.iflow/agents/` 目录中创建自定义Agent配置：

```markdown
---
agentType: "custom-expert"
systemPrompt: "你是一个自定义领域的专家..."
whenToUse: "当需要处理特定领域任务时使用"
model: "claude-3-5-sonnet-20241022"
allowedTools: ["*"]
proactive: false
---

# Custom Expert Agent

这是一个自定义专家Agent的详细说明...
```

### 配置属性说明

#### 必需属性

| 属性 | 类型 | 说明 |
|------|------|------|
| agentType | 字符串 | Agent的唯一标识符 |
| systemPrompt | 字符串 | Agent的系统提示词 |
| whenToUse | 字符串 | 何时使用此Agent的说明 |

#### 可选属性

| 属性 | 类型 | 说明 | 默认值 |
|------|------|------|-------|
| model | 字符串 | 偏好的AI模型 | - |
| allowedTools | 数组 | 可使用的工具列表 | [] |
| allowedMcps | 数组 | 允许访问的MCP服务器列表 | [] |
| isInheritTools | 布尔值 | 是否继承父级Agent的工具权限 | true |
| isInheritMcps | 布尔值 | 是否继承父级Agent的MCP权限 | true |
| proactive | 布尔值 | 是否主动推荐使用 | false |
| color | 字符串 | UI中的显示颜色 | - |
| name | 字符串 | 显示名称 | agentType |
| description | 字符串 | 简短描述 | - |

**权限继承机制说明**

Sub Agent的工具和MCP权限系统采用继承机制，允许精确控制Agent的能力边界：

**工具继承（isInheritTools）**
- `true`（默认）：继承主Agent的所有工具权限，并额外获得allowedTools中指定的工具
- `false`：仅使用allowedTools中明确指定的工具，不继承任何父级权限

**MCP继承（isInheritMcps）**
- `true`（默认）：继承主Agent对所有MCP服务器的访问权限，并额外获得allowedMcps中指定的服务器
- `false`：仅访问allowedMcps中明确指定的MCP服务器，不继承任何父级权限

**MCP服务器访问控制（allowedMcps）**
- 指定Agent可以访问的MCP（Model Context Protocol）服务器列表
- 用于限制Agent对特定外部服务和API的访问
- 空数组表示不限制MCP服务器访问（继承父级权限）

**权限配置示例**

```markdown
---
agentType: "security-auditor"
systemPrompt: "你是一个安全审计专家..."
whenToUse: "当需要进行安全审计和漏洞检查时使用"
allowedTools: ["Read", "Grep", "Bash"]
allowedMcps: ["security-scanner", "vulnerability-db"]
isInheritTools: false
isInheritMcps: false
---
```

在这个示例中：
- Agent只能使用Read、Grep、Bash三个工具，不继承其他工具权限
- Agent只能访问security-scanner和vulnerability-db两个MCP服务器
- 这种配置确保了安全审计Agent的权限被严格限制在必要范围内

## 故障排除

### 常见问题及解决方案

| 问题 | 可能原因 | 解决方案 |
|------|----------|----------|
| Agent不响应 | 模型不兼容或网络问题 | 检查模型设置，确认网络连接 |
| 工具权限错误 | allowedTools配置错误 | 检查Agent配置中的工具权限设置 |
| Agent列表为空 | 配置文件路径错误 | 确认.iflow/agents/目录存在且有配置文件 |
| 快速调用失败 | Agent类型不存在 | 使用/agents list查看可用Agent |
| 模型切换失败 | 目标模型不可用 | 选择其他可用模型或检查配置 |

### 诊断步骤

1. **基础检查**
   ```bash
   /agents list              # 查看已安装的Agent
   /agents refresh           # 刷新Agent配置
   ```

2. **配置验证**
   - 检查`.iflow/agents/`目录是否存在
   - 验证配置文件格式是否正确
   - 确认Agent类型命名规范

3. **权限验证**
   - 检查工具访问权限设置
   - 验证模型访问权限
   - 确认网络连接状态

4. **日志检查**
   ```bash
   /log                      # 查看详细日志
   /stats                    # 查看使用统计
   ```

### 平台兼容性

| 平台 | 支持程度 | 特殊说明 |
|------|----------|----------|
| Windows | 完全支持 | 配置文件路径使用反斜杠 |
| macOS | 完全支持 | 可能需要文件系统权限 |
| Linux | 完全支持 | 依赖系统包管理器 |
