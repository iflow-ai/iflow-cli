---
sidebar_position: 0
hide_title: true
title: '快速开始'
---

import Controlled from '@/components/Controlled';

<Controlled type="ApiKeyFailureMechanism" hideMsg>

:::info 🔔 重要通知

2025-10-10起，iFlow CLI将统一切换至新的认证方式，届时您需要手动更新API Key。建议使用 /auth 通过iFlow登录，避免服务中断。

:::

</Controlled>


# 快速开始

iFlow CLI 是一款终端AI助手，可以分析代码、执行编程任务、处理文件操作。本指南帮您快速上手核心功能。

> **目标**：5分钟内完成 iFlow CLI 的安装、配置并运行第一个AI辅助任务  
> **前置条件**：基本的终端操作经验  
> **您将学到**：安装iFlow CLI、设置API密钥、执行基础命令

## 核心概念（30秒了解）

| 术语 | 说明 |
|------|------|
| **iFlow CLI** | 基于终端的AI助手工具 |
| **斜杠命令** | 以 `/` 开头的控制命令（如 `/init`、`/help`） |
| **@** | 文件引用 @文件路径(如`@src/App.tsx`) |
| **$** | 以`$`开头执行某个subagent(如`$code-reviewer`) |
| **Shell命令** | 以 `!` 开头，可在CLI中执行系统命令 |
| **yolo** | 默认允许CLI执行所有操作的执行模式 |
| **MCP** | 模型上下文协议，用于扩展AI能力的服务器系统 |
| **Sub Agent** | 智能Agent系统,适用于执行不同专业的任务 |
| **Sub Command** | 命令行扩展 |
| **context left** | CLI右下角的提示信息，代表模型在对话过程中剩余的上下文长度 |

> 💡 **更多术语**：查看完整的 [术语词汇表](./glossary) 了解所有概念定义

## 第1步：安装（2分钟）

### 系统要求
- Node.js 22+ 
- 4GB+ 内存
- 互联网连接

### 快速安装

**macOS/Linux**
```shell
# Homebrew 安装
brew tap iflow-ai/iflow-cli
brew install iflow-cli

# 一键安装脚本，会安装全部所需依赖
bash -c "$(curl -fsSL https://gitee.com/iflow-ai/iflow-cli/raw/main/install.sh)"

# 已有Node.js 22+
npm i -g @iflow-ai/iflow-cli@latest
```

**Windows**
```shell
1. 访问 https://nodejs.org/zh-cn/download 下载最新的 Node.js 安装程序
2. 运行安装程序来安装 Node.js
3. 重启终端：CMD(Windows + r 输入cmd) 或 PowerShell
4. 运行 `npm install -g @iflow-ai/iflow-cli@latest` 来安装 iFlow CLI
5. 运行 `iflow` 来启动 iFlow CLI
```

> **验证安装**：运行 `iflow --version` 确认安装成功

## 第2步：首次设置（1分钟）

### 启动iFlow
```shell
iflow
```

### 选择登录方式

iFlow CLI 支持三种登录方式，不同方式提供的功能有所差异：

#### 🌟 方式一：Login with iFlow 登录（推荐）
**强烈推荐使用 Login with iFlow 方式登录心流平台**，享受最完整的功能体验：

✅ **完整功能支持**
- **WebSearch 服务**：智能网络搜索，获取最新信息
- **WebFetch 服务**：网页内容抓取和分析  
- **多模态能力**：内置图像理解等多模态功能
- **工具调用优化**：心流平台提供的模型经过专门优化，工具调用更加精准高效

✅ **最佳使用体验**
- **自动续期**：令牌自动刷新，永不过期
- **无缝连接**：一次授权，持续使用

** Login with iFlow 登录步骤：**
1. 运行 `iflow` 后选择 OLogin with iFlow 登录
2. CLI 会自动打开浏览器跳转到心流平台
3. 完成注册/登录后授权 iFlow CLI
4. 自动返回终端，开始使用

#### 方式二：心流 API Key 登录
> 💡 **适用场景**：服务器环境或无浏览器访问的场景

✅ **功能支持**：与 第一种 登录相同，享受心流平台的完整功能（WebSearch、WebFetch、多模态、工具调用优化等）

⚠️ **注意事项**：API Key 有效期为 7 天，需定期更新

**API Key 登录步骤：**
1. 访问[心流官网](https://iflow.cn/?spm=54878a4d.2ef5001f.0.0.7c1257832yovzX&open=setting)完成注册
2. 在用户设置页面生成 API KEY
3. 在 iFlow CLI 中选择 API Key 登录并输入密钥

#### 方式三：OpenAI Compatible API
> 💡 **适用场景**：使用自有模型服务或其他兼容 OpenAI 协议的服务

⚠️ **功能限制**：
- 不支持 WebSearch 服务
- 不支持 WebFetch 服务
- 不支持心流平台的内置多模态能力
- 无法享受心流平台模型的工具调用优化


**配置步骤：**
1. 选择 "OpenAI Compatible API" 选项
2. 输入服务端点 URL
3. 输入对应的 API Key

### 选择模型
登录成功后，选择一个心仪的大模型就可以开始使用了

## 第3步：运行第一个任务（2分钟）

### 方式A：项目分析
```shell
# 在任意代码项目目录下
cd your-project/
iflow
> /init
> 分析这个项目的结构和主要功能
```

### 方式B：简单任务
```shell
iflow
> 创建一个Python脚本，计算斐波那契数列的前10项
```

### 方式C：Shell命令辅助
```shell
iflow
> !ls -la
> 帮我分析这个目录结构，建议如何整理文件
```
## 自动更新
iFlow CLI在启动时会检测是否有最新版本，会自动更新
### 自动更新失败
此时需要手动更新
```shell
# 更新命令
npm i -g @iflow-ai/iflow-cli to update
# 查看最新版本
iflow -v
```

### 卸载重新安装
手动更新也失败，需要执行卸载并重新安装
```shell
# 卸载
npm uninstall -g @iflow-ai/iflow-cli
# 检查iflow命令是否存在
iflow -v

# 重新安装
npm i -g @iflow-ai/iflow-cli
```

## 常用命令速查

| 命令 | 功能 | 示例 |
|------|------|------|
| `/help` | 查看帮助 | `/help` |
| `/init` | 分析项目结构 | `/init` |
| `/clear` | 清空对话历史 | `/clear` |
| `/exit` | 退出CLI | `/exit` |
| `!命令` | 执行系统命令 | `!npm install` |

## 故障排除

### 安装问题
```shell
# 检查Node.js版本
node --version  # 需要 22+

# 检查网络连接
curl -I https://apis.iflow.cn/v1
```

### 认证问题
- 确保API密钥正确复制（无多余空格）
- 检查网络连接是否正常
- 重新生成API密钥并重试

### 命令不响应
- 使用 `Ctrl+C` 中断当前操作
- 运行 `/clear` 清空上下文
- 重启CLI：`/exit` 后重新运行 `iflow`

## 下一步学习

完成快速开始后，推荐按以下顺序深入学习：

1. **[基础用法](./examples/basic-usage)** - 掌握日常使用技巧（10分钟）
2. **[交互模式](./features/interactive)** - 学习高效交互方式（15分钟）
3. **[MCP扩展](./examples/mcp)** - 扩展AI能力（15分钟）
4. **[最佳实践](./examples/best-practices)** - 提升工作效率（20分钟）

> **获得帮助**：遇到问题？查看 [完整文档](./examples/index.md) 或 [提交反馈](https://github.com/iflow-ai/iflow-cli/issues)