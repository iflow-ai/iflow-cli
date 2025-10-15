# 记忆

## 概述

IFLOW.md 是 iFlow CLI 的核心记忆文件，它为 AI 助手提供项目特定的指令上下文和背景信息。与传统的配置文件不同，IFLOW.md 使用自然语言编写，让 AI 能够更好地理解你的项目结构、编码规范和工作流程。对于CLI工作你有任何的说明和约束都可以编写在这个文件当中

### 主要功能

- **上下文提供**：为 AI 提供项目背景、编码规范、架构信息
- **个性化定制**：根据项目特点定制 AI 的行为和响应
- **分级管理**：支持全局、项目和子目录级的分层配置
- **模块化组织**：通过文件导入实现配置的模块化管理
- **记忆保存**：通过 save_memory 功能持久化重要信息

## 文件存储位置和分级设计

IFLOW.md 采用分级系统，按照以下优先级加载（数字越大优先级越高）：

### 1. 全局级别（优先级：低）
```
~/.iflow/IFLOW.md
```
- **作用范围**：所有 iFlow CLI 会话
- **用途**：存储个人偏好、通用编码规范、全局记忆
- **示例内容**：个人编程习惯、常用库偏好、个人信息

### 2. 项目级别（优先级：中）
```
/path/to/your/project/IFLOW.md
```
- **作用范围**：特定项目
- **用途**：项目架构、技术栈、团队规范
- **示例内容**：项目概述、API 文档、部署说明

### 3. 子目录级别（优先级：高）
```
/path/to/your/project/src/IFLOW.md
/path/to/your/project/tests/IFLOW.md
```
- **作用范围**：特定目录及其子目录
- **用途**：模块特定的指令和约定
- **示例内容**：模块说明、特殊测试要求

### 加载机制

iFlow CLI 会从当前工作目录开始，向上搜索到项目根目录和用户主目录，加载所有找到的 IFLOW.md 文件。内容会按照优先级顺序合并，高优先级的内容会覆盖低优先级的内容。

### 自定义文件名

可以通过[配置文件](./settings.md)自定义上下文文件名：

```json
{
  "contextFileName": "AGENTS.md"
}
```

或支持多个文件名：

```json
{
  "contextFileName": ["IFLOW.md", "AGENTS.md", "CONTEXT.md"]
}
```

## /init 操作详解

`/init` 命令是快速开始的最佳方式，它会自动分析你的项目并生成定制化的 IFLOW.md 文件。

### 执行流程

1. **检查现有文件**：如果当前目录已有 IFLOW.md，会提示不进行修改
2. **创建空文件**：首先创建一个空的 IFLOW.md 文件
3. **项目分析**：扫描项目结构、依赖、配置文件
4. **内容生成**：基于分析结果生成定制化内容
5. **文件填充**：将生成的内容写入 IFLOW.md

### 分析内容

`/init` 命令会分析以下项目特征：

- **技术栈识别**：基于 package.json、requirements.txt 等文件
- **项目结构**：目录布局、关键文件位置
- **构建工具**：webpack、vite、rollup 等配置
- **测试框架**：jest、mocha、pytest 等
- **代码规范**：ESLint、Prettier、Black 等配置
- **文档结构**：README、API 文档等

### 使用示例

```bash
# 在项目根目录执行
$ iflow
> /init

# 输出示例
Empty IFLOW.md created. Now analyzing the project to populate it.
Analyzing project structure...
Generating customized context...
IFLOW.md has been successfully populated with project-specific information.
```

### 生成内容示例

```markdown
# 项目上下文

## 项目概述
这是一个基于 TypeScript + React + Node.js 的全栈应用。

## 技术栈
- 前端：React 18, TypeScript, Vite
- 后端：Node.js, Express, TypeScript
- 数据库：PostgreSQL
- 测试：Jest, React Testing Library

## 项目结构
```
src/
├── components/     # React 组件
├── services/      # API 服务
├── utils/         # 工具函数
└── types/         # TypeScript 类型定义
```

## 开发规范
- 使用 TypeScript 严格模式
- 组件采用函数式写法
- 使用 ESLint + Prettier 代码格式化
- 提交前运行 pre-commit hooks
```

## 模块化管理（导入功能）

IFLOW.md 支持通过 `@` 语法导入其他文件，实现配置的模块化管理。

### 导入语法

```markdown
# 主 IFLOW.md 文件

@./shared/coding-standards.md

@./project-specific/architecture.md

@../global/personal-preferences.md
```

### 支持的路径格式

#### 相对路径
```markdown
@./file.md                    # 同目录
@../file.md                   # 父目录
@./components/readme.md       # 子目录
```

#### 绝对路径
```markdown
@/absolute/path/to/file.md
```

### 文件组织示例

```
project/
├── IFLOW.md                  # 主配置文件
├── .iflow/
│   ├── architecture.md       # 架构说明
│   ├── coding-style.md       # 编码规范  
│   └── deployment.md         # 部署说明
└── src/
    └── IFLOW.md             # 源码目录特定配置
```

主 IFLOW.md：
```markdown
# 项目总体配置

@./.iflow/architecture.md
@./.iflow/coding-style.md
@./.iflow/deployment.md

## 项目特定指令
请在处理这个项目时遵循上述架构和编码规范。
```

### 安全特性

1. **循环导入检测**：自动检测并阻止循环引用
2. **路径验证**：确保只能访问允许的目录
3. **深度限制**：防止过深的导入嵌套（默认最大 5 层）
4. **错误处理**：优雅处理文件不存在或权限问题

### 调试导入

使用 `/memory show` 命令查看完整的合并结果和导入树：

```
Memory Files
 L project: IFLOW.md
            L .iflow/architecture.md
            L .iflow/coding-style.md
            L .iflow/deployment.md
```

## 实际应用示例

### 1. React 项目示例

```markdown
# React 项目配置

## 项目类型
这是一个现代 React 应用，使用 TypeScript 和 Vite。

## 开发规范
- 优先使用函数组件和 Hooks
- 状态管理使用 Zustand
- 样式使用 Tailwind CSS
- 测试使用 Jest + Testing Library

## 代码风格
- 组件文件使用 PascalCase 命名
- Hook 文件以 use 开头
- 常量使用 UPPER_SNAKE_CASE
- 接口以 I 开头（如 IUser）

## 文件结构约定
```
src/
├── components/     # 可复用组件
├── pages/         # 页面组件
├── hooks/         # 自定义 hooks
├── stores/        # Zustand stores
├── services/      # API 调用
├── types/         # TypeScript 类型
└── utils/         # 工具函数
```

## 特殊要求
- 所有组件必须有 TypeScript 类型声明
- 异步操作使用 React Query
- 路由使用 React Router v6
```

### 2. Node.js 后端项目示例

```markdown
# Node.js 后端项目

## 技术栈
- Framework: Express.js
- Database: PostgreSQL + Prisma ORM
- Authentication: JWT
- Validation: Zod
- Testing: Jest + Supertest

## 架构模式
采用分层架构：Controller -> Service -> Repository -> Database

## API 规范
- RESTful API 设计
- 统一错误处理中间件
- 请求参数验证使用 Zod
- 响应格式：`{ success: boolean, data?: any, error?: string }`

## 安全要求
- 所有路由需要适当的认证和授权
- 敏感信息使用环境变量
- 输入数据必须验证和清理
- 错误信息不暴露内部实现

## 部署配置
- 使用 Docker 容器化
- 环境变量通过 .env 文件管理
- 生产环境使用 PM2 进程管理
```

### 3. 团队协作示例

```markdown
# 团队开发规范

## 代码提交规范
- 使用 Conventional Commits 格式
- 提交前必须通过 lint 和 test
- 每个 PR 必须有代码审查
- 重要变更需要技术方案讨论

## 分支策略
- main: 生产环境代码
- develop: 开发环境代码  
- feature/*: 功能分支
- hotfix/*: 紧急修复分支

## 代码审查要点
1. 代码逻辑正确性
2. 性能考虑
3. 安全性检查
4. 测试覆盖度
5. 文档完整性

## 沟通协作
- 重大架构变更先讨论再实现
- 遇到问题及时在群里沟通
- 定期进行技术分享
- 保持代码和文档同步更新
```

## 进阶功能

### 1. 与 /memory 命令配合

```bash
# 查看当前加载的记忆内容
/memory show

# 手动添加记忆
/memory add 这个项目的测试覆盖率要求是 80% 以上

# 刷新记忆（重新加载所有 IFLOW.md 文件）
/memory refresh
```

### 2. 环境变量引用

在 IFLOW.md 中可以引用环境变量：

```markdown
# 项目配置

## 数据库连接
使用环境变量 `$DATABASE_URL` 连接数据库。

## API 配置
API 基础地址：`${API_BASE_URL}`
API 密钥：`$API_SECRET_KEY`
```

### 3. 动态配置

根据不同环境加载不同配置：

```markdown
# 环境相关配置

@./config/development.md
@./config/production.md

## 当前环境
当前运行在 ${NODE_ENV} 环境。
```

## 常见问题和故障排除

### 1. IFLOW.md 不生效

**症状**：修改 IFLOW.md 后 AI 行为没有变化

**排查步骤**：
1. 检查文件位置是否正确
2. 使用 `/memory show` 查看是否被加载
3. 使用 `/memory refresh` 强制重新加载
4. 检查文件权限是否可读

**解决方案**：
```bash
# 查看当前加载的记忆
/memory show

# 重新加载所有记忆文件
/memory refresh

# 检查配置的文件名
# 确保与 contextFileName 设置一致
```

### 2. 优先级冲突

**症状**：不同级别的 IFLOW.md 内容冲突

**解决方案**：
1. 理解加载优先级：子目录 > 项目 > 全局
2. 使用 `/memory show` 查看最终合并结果
3. 在高优先级文件中明确覆盖低优先级设置

### 3. 导入文件失败

**症状**：`@file.md` 语法不工作

**常见原因**：
- 文件路径错误
- 文件不存在
- 循环导入
- 权限问题

**解决方案**：
```bash
# 使用绝对路径测试
@/absolute/path/to/file.md

# 检查文件是否存在
ls -la ./path/to/file.md

# 查看导入树结构
/memory show
```

### 4. 性能问题

**症状**：启动慢或响应延迟

**优化建议**：
1. 减少导入文件数量
2. 避免过深的导入嵌套
3. 删除不必要的内容
4. 使用更具体的配置而非通用配置

### 5. save_memory 不工作

**可能原因**：
- 全局目录 `~/.iflow/` 不存在
- 权限不足
- 磁盘空间不足

**解决方案**：
```bash
# 创建全局配置目录
mkdir -p ~/.iflow

# 检查权限
ls -la ~/.iflow/

# 手动创建文件测试
touch ~/.iflow/IFLOW.md
```

## 最佳实践总结

### 1. 内容组织
- **分层管理**：全局通用设置，项目特定配置，模块局部规则
- **模块化导入**：将大文件拆分为逻辑模块
- **版本控制**：项目级 IFLOW.md 纳入版本控制，全局文件不纳入

### 2. 内容编写
- **使用自然语言**：让 AI 容易理解的描述方式
- **具体明确**：避免模糊的描述，给出具体示例
- **保持更新**：随着项目发展及时更新配置

### 3. 团队协作
- **统一规范**：团队成员使用一致的 IFLOW.md 模板
- **文档同步**：配置变更与代码变更同步进行
- **定期评审**：定期评审和优化 IFLOW.md 内容

### 4. 维护管理
- **定期清理**：删除过时的配置和记忆
- **监控效果**：观察 AI 行为是否符合预期
- **渐进优化**：根据使用效果逐步完善配置

通过合理使用 IFLOW.md，你可以让 iFlow CLI 更好地理解你的项目和需求，从而提供更精准、更有价值的帮助。记住，IFLOW.md 是一个强大的工具，合理配置能够显著提升开发效率和 AI 协作体验。