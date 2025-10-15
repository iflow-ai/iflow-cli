---
title: Sub Command
description: 扩展 iFlow CLI 功能，安装和管理来自市场的自定义命令
sidebar_position: 6
---

# Sub Command

> **功能概述**：Sub Command是iFlow CLI的命令扩展系统，可以从在线市场安装和管理专业化的斜杠命令。  
> **学习时间**：10-15分钟  
> **前置要求**：已安装iFlow CLI，完成身份验证，了解基本的斜杠命令使用

## 什么是Sub Command

Sub Command是iFlow CLI中的命令市场系统，允许您从在线市场安装专业化的斜杠命令来扩展CLI功能。类似于应用商店，您可以浏览、安装、管理各种功能丰富的自定义命令。

## 核心特点

| 特点 | 说明 | 优势 |
|------|------|------|
| 市场化分发 | 从在线市场获取经过验证的命令 | 丰富的功能选择 |
| 即插即用 | 安装后立即可用，无需额外配置 | 简化使用流程 |
| 作用域管理 | 支持项目级和全局级别的命令安装 | 灵活的权限控制 |
| 版本追踪 | 每个命令都有明确的版本信息 | 确保功能稳定性 |
| 社区驱动 | 支持社区贡献和第三方开发 | 持续功能扩展 |

## 工作原理

### 命令市场架构

```
在线市场 → 本地安装 → CLI集成 → 斜杠命令
    ↓         ↓        ↓        ↓
[命令库] → [TOML配置] → [命令解析] → [功能执行]
```

### 作用域层级

- **全局作用域**：安装到 `~/.iflow/commands/`，所有项目都可使用
- **项目作用域**：安装到 `{project}/.iflow/commands/`，仅当前项目可用
- **优先级规则**：项目级命令优先于全局级命令

## 命令市场管理

### 从开放市场中安装命令

* 进入[命令开放市场](https://platform.iflow.cn/agents)


* 搜索类型选择**指令**
* 挑选心仪的指令
* 点击安装按钮，复制对应的命令
* 在自己的终端安装
### 在CLI中浏览在线市场

| 命令                           | 功能 | 说明 |
|------------------------------|------|------|
| `/commands online`           | 进入交互式市场 | 浏览、搜索、安装命令 |
| `/commands get <name or id>` | 查看命令详情 | 获取特定命令的详细信息 |

#### 市场导航操作

**交互式浏览快捷键**

| 操作 | 快捷键 | 说明 |
|------|--------|------|
| 向下浏览 | `j` 或 `↓` | 移动到下一个命令 |
| 向上浏览 | `k` 或 `↑` | 移动到上一个命令 |
| 查看详情 | `l` 或 `Enter` | 查看命令详细信息 |
| 安装命令 | `i` | 安装当前选中的命令 |
| 搜索过滤 | `/` | 按名称或分类搜索 |
| 退出浏览 | `q` | 退出市场浏览模式 |
| 刷新列表 | `r` | 重新加载命令列表 |

```bash
# 进入交互式命令市场
/commands online

# 浏览过程中的操作示例
# 1. 使用 j/k 或方向键浏览命令列表
# 2. 按 Enter 查看感兴趣命令的详细信息
# 3. 按 i 键直接安装命令
# 4. 按 / 键搜索特定功能的命令
```

### 查看命令详情

```bash
# 查看特定命令的详细信息
/commands get 123

# 输出示例：
# 📋 Command Details
# 
# 🆔 ID: 123
# 📝 Name: code-reviewer
# 📄 Description: 专业代码审查工具，支持多语言代码质量检测
# 📁 Category: Development
# 🤖 Model: claude-3-5-sonnet-20241022
# 🏷️  Tags: code-review, quality, best-practices
# 👤 Author: iflow-community
# 📊 Version: 2
# 👁️  Visibility: public
# 📋 Status: published
# 
# 📖 Detail Context:
# 这是一个专业的代码审查助手，可以：
# - 检测代码质量问题
# - 提供最佳实践建议
# - 支持多种编程语言
# - 生成详细的审查报告
# 
# 💡 To add this command to your CLI, use: /commands add 123
```

### 安装命令介绍

```bash
# 基本语法
iflow commands add <name or id> [--scope project|global]

# 安装到项目（默认）
iflow commands add 123
iflow commands add 123 --scope project

# 安装到全局
iflow commands add commit --scope global

# 实际示例
iflow commands add 456 --scope project   # 代码审查工具
iflow commands add docs --scope global    # 通用文档生成工具

# 更多详情查看
iflow commands -h
```

### 查看已安装命令

```bash
# 列出所有已安装的命令
/commands list
/commands show      # 别名
/commands local     # 别名

# 输出示例：
# Installed commands:
# 
# 🌍 Global Commands (2):
#   /code-reviewer - 专业代码审查工具，支持多语言代码质量检测
#   📁 /Users/username/.iflow/commands/code-reviewer.toml
# 
#   /doc-generator - 自动文档生成工具
#   📁 /Users/username/.iflow/commands/doc-generator.toml
# 
# 📂 Project Commands (1):
#   /project-analyzer - 项目结构分析工具
#   📁 /path/to/project/.iflow/commands/project-analyzer.toml
# 
# 💡 Tips:
#   • Use /commands online to browse online marketplace
#   • Use /commands add <id> to install new commands
#   • Use /commands remove <name> to remove commands
#   • Use /commands get <id> to view command details
```

### 删除命令

```bash
# 删除项目级命令（默认）
/commands remove <command-name>
/commands remove code-reviewer

# 删除全局命令
/commands remove code-reviewer --scope global

# 别名命令
/commands rm <command-name>
/commands delete <command-name>

# 删除成功示例：
# ✅ Successfully removed command 'code-reviewer' from project scope
# Location: /path/to/project/.iflow/commands/code-reviewer.toml
# 
# ⚠️  Please restart the CLI to see changes take effect.
```

## 命令分类与推荐

### 开发工具类

| 命令名称 | ID | 功能描述 | 适用场景 |
|----------|----|-----------|---------| 
| **refactor** | 79 | 重构代码，保持功能性的同时改进结构、可读性和可维护性 | 代码优化和结构调整 |
| **implement** | 80 | 智能实现功能特性，完美适配项目架构 | 新功能开发 |
| **test** | 81 | 基于当前上下文智能运行测试并帮助修复失败 | 测试自动化 |
| **scaffold** | 94 | 从模式生成完整功能特性 | 快速原型开发 |
| **fix-imports** | 87 | 重构后修复损坏的导入 | 重构后维护 |
| **fix-todos** | 88 | 智能实现TODO修复 | 任务管理 |
| **format** | 89 | 自动检测并应用项目格式化器 | 代码格式化 |

### 代码质量类

| 命令名称 | ID | 功能描述 | 适用场景 |
|----------|----|-----------|---------| 
| **review** | 93 | 多代理分析（安全、性能、质量、架构） | 代码审查 |
| **make-it-pretty** | 90 | 改善可读性而不改变功能 | 代码美化 |
| **remove-comments** | 92 | 清理明显的注释，保留有价值的文档 | 代码清理 |
| **predict-issues** | 91 | 主动问题检测与时间线估算 | 风险预测 |

### 文档工具类

| 命令名称 | ID | 功能描述 | 适用场景 |
|----------|----|-----------|---------| 
| **docs** | 84 | 智能文档管理和更新 | 项目文档维护 |
| **contributing** | 82 | 项目贡献准备性完整分析 | 开源项目 |
| **explain-like-senior** | 85 | 高级水平的代码解释和上下文分析 | 代码学习 |

### 安全分析类

| 命令名称 | ID | 功能描述 | 适用场景 |
|----------|----|-----------|---------| 
| **security-scan** | 95 | 扩展思考的漏洞分析和修复跟踪 | 安全检查 |

### 实用工具类

| 命令名称 | ID | 功能描述 | 适用场景 |
|----------|----|-----------|---------| 
| **commit** | 78 | 分析变更并创建有意义的提交信息 | Git工作流 |
| **cleanproject** | 77 | 清理开发工件同时保留工作代码 | 项目维护 |
| **create-todos** | 83 | 基于分析结果添加上下文TODO注释 | 任务管理 |
| **find-todos** | 86 | 定位和组织开发任务 | 任务跟踪 |
| **session-end** | 96 | 总结和保存会话上下文 | 会话管理 |

## 命令配置文件

### TOML文件结构

安装的命令会在本地生成TOML配置文件：

```toml
# Command: code-reviewer
# Description: 专业代码审查工具，支持多语言代码质量检测
# Category: Development
# Version: 2
# Author: iflow-community

description = "专业代码审查工具，支持多语言代码质量检测"

prompt = """
你是一个专业的代码审查专家。请分析用户提供的代码，从以下方面进行评估：

1. 代码质量和可读性
2. 安全性问题检测
3. 性能优化建议
4. 最佳实践遵循情况
5. 潜在的bug或逻辑错误

请提供具体的改进建议和示例代码。
"""
```

### md文件结构

除了TOML格式，iFlow CLI还支持Markdown格式的配置文件。

```bash
# 创建命令目录
mkdir -p ~/.iflow/commands

# 创建Markdown格式的命令文件
echo "Review this code for security vulnerabilities:" > ~/.iflow/commands/security-review.md
```

也支持添加描述，例如
```markdown
---
description: Create a git commit
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

## Your task

Based on the above changes, create a single git commit.
```

### 配置文件位置

| 作用域 | 配置路径 | 说明 |
|--------|----------|------|
| 全局 | `~/.iflow/commands/` | 所有项目都可访问 |
| 项目 | `{project}/.iflow/commands/` | 仅当前项目可访问 |

## 故障排除

### 常见问题及解决方案

| 问题 | 可能原因 | 解决方案 |
|------|----------|----------|
| 命令安装失败 | API密钥未设置或过期 | 重新进行身份验证 |
| 命令不可用 | 未重启CLI加载新配置 | 重启iFlow CLI |
| 权限错误 | 目录权限不足 | 检查文件系统权限 |
| 网络连接失败 | 无法访问命令市场API | 检查网络连接和防火墙设置 |
| 命令冲突 | 同名命令在不同作用域 | 使用 --scope 明确指定 |

### 诊断步骤

1. **连接检查**
   ```bash
   # 测试API连接
   /commands online
   
   # 检查身份验证状态
   /auth status
   ```

2. **配置验证**
   ```bash
   # 查看本地命令列表
   /commands list
   
   # 检查配置文件
   cat ~/.iflow/commands/command-name.toml
   ```

3. **权限验证**
   ```bash
   # 检查目录权限
   ls -la ~/.iflow/commands/
   ls -la ./.iflow/commands/
   ```

4. **日志检查**
   ```bash
   # 查看详细日志
   /log
   
   # 查看错误信息
   /debug
   ```

### 清理和重置

```bash
# 清理项目级命令
rm -rf ./.iflow/commands/

# 清理全局命令（谨慎操作）
rm -rf ~/.iflow/commands/

# 重新初始化命令配置
iflow commands init
```

## 安全注意事项

### 使用第三方命令时的安全建议

**验证命令来源**：
- ⚠️ 仅安装来自可信作者的命令
- ⚠️ 检查命令的评分和社区反馈
- ⚠️ 避免安装过于宽泛权限的命令

**命令权限控制**：
- ✅ 优先使用项目作用域安装
- ✅ 定期审核已安装的命令
- ✅ 及时更新命令到最新版本
- ✅ 移除不再使用的命令

## 开发自定义命令

### TOML配置文件完整规范

#### 基础配置结构

```toml
# 命令描述（必需）
description = "命令的简短描述"

# 命令提示词（必需）
prompt = """
发送给AI模型的完整提示词内容
支持多行文本和特殊占位符
"""
```

#### 高级功能特性

##### 1. 参数注入机制

**快捷参数注入**：使用 `{{args}}` 占位符

```toml
description = "代码审查工具"

prompt = """
请审查以下代码并提供改进建议：

{{args}}

重点关注：代码质量、安全性、性能优化。
"""
```

**默认参数处理**：如果不使用 `{{args}}`，系统会自动将用户输入追加到提示词后

```toml
description = "文档生成器"

prompt = """
根据提供的内容生成专业文档。
"""
# 用户输入 "/docs 用户手册" 会变成：
# "根据提供的内容生成专业文档。\n\n/docs 用户手册"
```

##### 2. Shell命令集成

使用 `!{command}` 语法在提示词中执行Shell命令：

```toml
description = "项目分析工具"

prompt = """
当前项目信息：

文件结构：
!{find . -name "*.js" -o -name "*.ts" | head -20}

Git状态：
!{git status --porcelain}

请分析项目状态并提供建议。
"""
```

**安全机制**：
- Shell命令需要通过安全检查
- 支持全局和会话级别的命令白名单
- 危险命令会要求用户确认

##### 3. 提示词处理器链

系统使用处理器链模式处理TOML配置：

| 处理器 | 触发条件 | 功能 |
|--------|----------|------|
| **ShellProcessor** | 包含 `!{...}` | 执行Shell命令并替换输出 |
| **ShorthandArgumentProcessor** | 包含 `{{args}}` | 替换参数占位符 |
| **DefaultArgumentProcessor** | 默认 | 追加用户输入到提示词 |

### 开发环境搭建

#### 目录结构管理

```bash
# 全局命令目录
~/.iflow/commands/
├── my-command.toml
├── code-reviewer.toml
└── project-analyzer.toml

# 项目命令目录
/path/to/project/.iflow/commands/
├── deploy.toml
├── test-runner.toml
└── build-helper.toml
```

#### 路径解析规则

系统使用以下函数获取命令目录：

```typescript
// 全局命令目录
getUserCommandsDir(): string {
  return path.join(os.homedir(), '.iflow', 'commands');
}

// 项目命令目录
getProjectCommandsDir(projectRoot: string): string {
  return path.join(projectRoot, '.iflow', 'commands');
}
```

#### 文件命名规范

- **基础命名**：`command-name.toml`
- **层级命名**：`parent:child.toml` → 创建嵌套命令结构
- **文件名清理**：非字母数字字符转换为连字符
- **扩展命名空间**：扩展命令自动获得 `[extensionName]` 前缀

### 实战开发示例

#### 示例1：简单信息查询命令

```toml
# ~/.iflow/commands/system-info.toml
description = "显示系统信息摘要"

prompt = """
请执行以下系统检查并提供摘要：

操作系统：!{uname -a}
磁盘使用：!{df -h /}
内存使用：!{free -h}
当前目录：!{pwd}

请分析系统状态并给出建议。
"""
```

使用方式：`/system-info`

#### 示例2：参数化代码生成器

```toml
# ./iflow/commands/generate-component.toml  
description = "React组件生成器"

prompt = """
请生成一个React组件，需求如下：

{{args}}

请包含：
1. TypeScript接口定义
2. 完整的组件实现
3. 基础的CSS样式
4. 使用示例

遵循最佳实践和现代React模式。
"""
```

使用方式：`/generate-component 用户登录表单组件`

#### 示例3：复杂项目管理工具

```toml
# ./.iflow/commands/project:status.toml
description = "项目状态全面分析"

prompt = """
项目全面状态报告：

## 代码库状态
Git分支：!{git branch --show-current}
未提交变更：!{git status --porcelain | wc -l}
最近提交：!{git log --oneline -5}

## 依赖状态  
Package.json存在：!{test -f package.json && echo "✅ 存在" || echo "❌ 不存在"}
Node模块状态：!{test -d node_modules && echo "✅ 已安装" || echo "❌ 未安装"}

## 代码质量
TypeScript文件数：!{find . -name "*.ts" -o -name "*.tsx" | wc -l}
JavaScript文件数：!{find . -name "*.js" -o -name "*.jsx" | wc -l}
测试文件数：!{find . -name "*.test.*" -o -name "*.spec.*" | wc -l}

请分析项目健康状况并提供改进建议。
"""
```

使用方式：`/project:status`

#### 示例4：动态脚本执行器

```toml
# ~/.iflow/commands/run-with-context.toml
description = "在项目上下文中执行命令"

prompt = """
在当前项目环境中执行指定操作：

项目根目录：!{pwd}
操作内容：{{args}}

执行结果：
!{{{args}}}

请分析执行结果并提供后续建议。
"""
```

使用方式：`/run-with-context npm test`

### 调试和测试指南

#### 配置验证

系统使用Zod进行TOML配置验证：

```typescript
const TomlCommandDefSchema = z.object({
  prompt: z.string({
    required_error: "The 'prompt' field is required.",
    invalid_type_error: "The 'prompt' field must be a string.",
  }),
  description: z.string().optional(),
});
```

#### 常见错误和解决方案

| 错误类型 | 原因 | 解决方案 |
|----------|------|----------|
| `TOML解析错误` | 语法不正确 | 检查引号、缩进和转义字符 |
| `Schema验证失败` | 缺少必需字段 | 确保包含 `prompt` 字段 |
| `Shell命令被阻止` | 安全策略限制 | 添加到命令白名单或修改安全配置 |
| `命令不显示` | 文件位置错误 | 检查文件路径和重启CLI |

#### 开发工作流

1. **创建TOML文件**
   ```bash
   mkdir -p ./.iflow/commands
   touch ./.iflow/commands/my-command.toml
   ```

2. **编写配置内容**
   ```toml
   description = "测试命令"
   prompt = "这是一个测试命令"
   ```

3. **重启CLI加载新命令**
   ```bash
   # 退出当前会话
   /quit
   # 重新启动
   iflow
   ```

4. **测试命令功能**
   ```bash
   /my-command 测试参数
   ```

5. **查看调试信息**
   ```bash
   /log  # 查看系统日志
   /debug # 启用调试模式
   ```
