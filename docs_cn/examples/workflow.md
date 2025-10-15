---
title: Workflow
description: 构建包含agents、commands、MCP工具的完整工作流程
sidebar_position: 8
---
# 工作流
> **功能概述**：Workflow是iFlow CLI中的工作流管理系统，整合agents、commands、IFLOW.md和MCP工具，创建完整的自动化工作流程。
>
> **学习时间**：15-20分钟
>
> **前置要求**：已安装iFlow CLI，完成身份验证，了解agents、commands和MCP的基本使用
## 什么是工作流
工作流将不同的AI能力（agents、commands、MCP工具）组合成完整的工作流程。通过workflow，您可以创建复杂的自动化任务链，实现从代码分析、开发、测试到部署的全流程自动化。

心流开放平台已经预置了大量优秀的工作流，例如小红书发文、深度研究、ppt制作、画流程图等，你可以在心流开放市场中下载安装到本地，再基于您个人独特的需求对工作流进行调整

对于开发者，心流开放平台预置了github spec、bmad、NioPD、ai-dev-task等开发者工作流，欢迎大家使用

## 目录结构
当您安装工作流后，项目目录会按照以下结构组织：

```
项目根目录/
├── .iflow/                   # iFlow CLI配置和资源目录
│   ├── agents/               # 智能体配置文件夹
│   │   ├── agent1.md         # 具体的agent配置文件
│   │   └── agent2.md         # 更多agent配置
│   ├── commands/             # 自定义命令文件夹
│   │   ├── command1.md       # 具体的command实现
│   │   └── command2.md       # 更多command实现
│   ├── IFLOW.md              # 详细的工作流文档和配置
│   └── settings.json         # mcp相关配置
├── [项目文件夹]/               # 您的项目文件和代码
└── IFLOW.md                  # 工作流配置和说明文件
```

**目录说明：**
- `.iflow/` - 存储所有iFlow CLI相关的配置文件和资源
- `agents/` - 包含工作流中使用的智能体配置，每个agent一个md文件
- `commands/` - 存储自定义命令的实现代码，每个command一个md文件
- `IFLOW.md` - 工作流的核心配置文件，定义工作流程、参数和使用说明
- `settings.json` - 工作流所依赖的MCP工具配置和其余iFlow CLI的配置
- `项目文件夹` - 工作流产出的内容所依赖的文件目录结构

## 工作原理
### Workflow架构
```
输入数据 → Workflow引擎 → 步骤编排 → 结果输出
    ↓           ↓           ↓          ↓
[用户请求] → [流程解析] → [组件调用] → [结果聚合]
             ↓           ↓
         [Agent执行] → [Command执行] → [MCP工具调用]
```

## 安装
1. 浏览[心流开放市场](https://platform.iflow.cn/agents?type=workflows)
2. 浏览并选择希望安装的工作流
3. 点击安装获取安装命令
4. 在终端中执行复制的命令
> 💡 工作流默认是安装在项目级别的，在其他工作目录无法使用
## 使用
首先您可以参考工作流对应的描述使用，一般情况下使用方式有两种：
1. 直接使用自然语言描述您的需求，iFlow CLI会自动调用工作流里的组件完成您的需求
2. 使用工作流内置的斜杠命令触发工作流的流程
## 举例
### AI PPT生成
1. 进入到一个工作文件夹中执行安装命令
```shell
iflow workflow add "ppt-generator-v3-OzctqA"
```
2. 在当前工作文件夹中启动iFlow CLI
```shell
iflow
```
3. 执行斜杠命令制作ppt
```shell
/ppt-generator
```
他会先了解当前的工作目录，了解里面的内容，然后和你不断地交互制作一个优美的ppt
### 流程图绘制
1. 进入到一个工作文件夹中执行安装命令
```shell
iflow workflow add "excalidraw-OzctqA"
```
2. 在当前工作文件夹中启动iFlow CLI
```shell
iflow
```
3. 执行斜杠命令绘制流程图
```shell
/excalidraw 你需要画图的主题
```
4. 在[Excalidraw](https://excalidraw.com/)中打开生成的图像文件
5. 简单微调就可以制作出来一个优美的流程图了

## 上传自己的工作流

当您开发了优秀的工作流并希望分享给其他用户时，需要先将工作流打包上传到心流开放平台。

### 打包工作流

1. **进入工作流根目录**
   ```bash
   cd /path/to/your/workflow/directory
   ```

2. **打包所有工作流文件**
   ```bash
   zip -r your-workflow-name.zip . -x your-workflow-name.zip
   ```
   
   这个命令会：
   - 压缩当前目录下的所有文件和文件夹（包括 `.iflow` 文件夹、项目文件、`IFLOW.md` 等）
   - 包含隐藏文件（如 `.iflow` 目录）
   - 排除生成的压缩包本身，避免递归包含
   - 解压时保持原始目录结构，不会创建额外的目录层级

3. **验证打包内容**
   ```bash
   unzip -l your-workflow-name.zip
   ```

### 上传到心流开放平台

1. 访问[心流开放平台](https://platform.iflow.cn/agents?type=workflows)
2. 登录您的账户
3. 点击"上传工作流"按钮
4. 上传您打包好的 `.zip` 文件
5. 填写工作流信息：
   - 工作流名称和描述
   - 使用说明和示例
   - 标签和分类
   - 版本信息
6. 提交审核，通过后即可在市场中展示

### 打包注意事项

- 确保 `IFLOW.md` 文件包含完整的工作流说明
- `.iflow/` 目录中的所有配置文件都应该被包含
- 移除任何敏感信息（如API密钥、个人数据等）
- 测试打包后的工作流能否正常安装和运行
- 添加适当的文档和使用示例

### 工作流分享最佳实践

1. **文档完善**：提供详细的使用说明和配置指南
2. **示例丰富**：包含典型的使用场景和输出示例
3. **配置清晰**：明确说明所需的环境配置和依赖
4. **测试充分**：在不同环境下测试工作流的稳定性
5. **持续维护**：及时更新和修复工作流中的问题

