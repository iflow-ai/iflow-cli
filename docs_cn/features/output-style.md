---
sidebar_position: 4
hide_title: true
---

# 输出样式

> **功能概述**：输出样式允许您将 iFlow CLI 适配用于软件工程之外的用途，自定义AI助手的行为模式。
> 
> **学习时间**：10-15分钟
> 
> **前置要求**：已安装并配置iFlow CLI，了解基本配置概念

## 什么是输出样式

输出样式允许您将 iFlow CLI 用作任何类型的任务，同时保持其核心功能，如运行本地脚本、读写文件和跟踪 TODO。

## 内置输出样式

iFlow CLI 的 **默认(Default)** 输出样式是现有的系统提示，旨在帮助您高效完成软件工程任务。

还有两种额外的内置输出样式，专注于提供更详细的解释和帮助您学习：

* **解释性(Explanatory)**：在帮助您完成软件工程任务的过程中提供教育性的"见解"。帮助您理解实现选择和代码库模式。

* **学习(Learning)**：协作式的边做边学模式，iFlow CLI 不仅会在编码时分享"见解"，还会要求您自己贡献小的、战略性的代码片段。iFlow CLI 会在您的代码中添加 `TODO(human)` 标记供您实现。

## 输出样式的工作原理

输出样式直接修改 iFlow CLI 的系统提示。

* 非默认输出样式排除了通常内置在 iFlow CLI 中的特定于代码生成和高效输出的指令（如简洁回应和通过测试验证代码）
* 相反，这些输出样式在系统提示中添加了自己的自定义指令。

## 更改您的输出样式

您可以：

* 运行 `/output-style` 来访问菜单并选择您的输出样式

* 运行 `/output-style [样式]`，如 `/output-style explanatory`，直接切换到某种样式

## 创建自定义输出样式

要在 iFlow 的帮助下设置新的输出样式，运行
`/output-style:new I want an output style that ...`

默认情况下，通过 `/output-style:new` 创建的输出样式作为 markdown 文件保存在用户级别的 `~/.iflow/output-styles` 中，可以跨项目使用。它们具有以下结构：

```markdown
---
name: My Custom Style
description:
  A brief description of what this style does, to be displayed to the user
---

# Custom Style Instructions

You are an interactive CLI tool that helps users with software engineering
tasks. [Your custom instructions here...]

## Specific Behaviors

[Define how the assistant should behave in this style...]
```

您也可以创建自己的输出样式 Markdown 文件，并将它们保存在用户级别（`~/.iflow/output-styles`）或项目级别（`.iflow/output-styles`）。

## 与相关功能的比较

### 输出样式 vs. IFLOW.md

输出样式完全去掉了 iFlow CLI 默认系统提示中特定于输出样式的部分。IFLOW.md 不会编辑 iFlow CLI 的默认系统提示。IFLOW.md 将内容作为用户消息添加在 iFlow CLI 默认系统提示之后。

### 输出样式 vs. SubAgent

输出样式直接影响主代理循环，只影响系统提示。SubAgent 被调用来处理特定任务，可以包括额外的设置，如要使用的模型、它们可用的工具以及何时使用代理的一些上下文。

### 输出样式 vs. 自定义斜杠命令

您可以将输出样式视为"存储的系统提示"，将自定义斜杠命令视为"存储的提示"。
