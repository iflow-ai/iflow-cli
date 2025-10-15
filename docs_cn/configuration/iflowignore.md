# 忽略项目中的文件

## 概述

`.iflowignore` 是 iFlow CLI 中的文件忽略功能，类似于 Git 的 `.gitignore`。它允许你指定哪些文件和目录在使用 iFlow CLI 工具时应该被忽略。

## 工作原理

当你在项目根目录创建 `.iflowignore` 文件并定义忽略规则后，支持此功能的 iFlow CLI 工具会自动跳过匹配的文件和目录，不会对它们进行处理。

## 支持的工具

以下 iFlow CLI 工具支持 `.iflowignore` 功能：

- `ls` - 目录列举工具
- `read_many_files` - 批量文件读取工具  
- `@filename` 语法 - AT命令文件引用
- 其他文件操作相关工具

## 使用方法

### 1. 创建 .iflowignore 文件

在你的项目根目录下创建 `.iflowignore` 文件：

```bash
touch .iflowignore
```

### 2. 添加忽略规则

`.iflowignore` 文件遵循与 `.gitignore` 相同的语法规则：

```bash
# 这是注释行

# 忽略特定文件
secrets.txt
config.json

# 忽略特定目录
build/
dist/
node_modules/

# 使用通配符忽略文件类型
*.log
*.tmp
*.cache

# 使用路径匹配
/root-only-file.txt
src/**/*.test.js

# 否定规则（不忽略）
*.log
!important.log
```

### 3. 语法规则

| 规则 | 说明 | 示例 |
|------|------|------|
| `#` | 注释行 | `# 这是注释` |
| `*` | 匹配任意字符 | `*.log` 匹配所有 .log 文件 |
| `?` | 匹配单个字符 | `file?.txt` 匹配 file1.txt |
| `[]` | 字符集匹配 | `[abc].txt` 匹配 a.txt, b.txt, c.txt |
| `/` 开头 | 根目录相对路径 | `/build/` 只匹配根目录下的 build |
| `/` 结尾 | 仅匹配目录 | `temp/` 只匹配目录，不匹配文件 |
| `!` 开头 | 否定规则 | `!important.log` 不忽略此文件 |

## 实际示例

### 前端项目

```bash
# .iflowignore for React/Vue project

# 构建输出
build/
dist/
.next/

# 依赖
node_modules/

# 日志和缓存
*.log
.cache/
.parcel-cache/

# 环境变量文件
.env.local
.env.production

# 测试覆盖率
coverage/

# IDE 配置（但保留 .vscode）
.idea/
*.swp
*.swo
```

### Node.js 后端项目

```bash
# .iflowignore for Node.js backend

# 运行时文件
*.pid
*.log
logs/

# 依赖和构建
node_modules/
dist/
build/

# 数据库文件
*.db
*.sqlite

# 上传文件目录
uploads/
temp/

# 敏感配置
.env
config/production.json
```

### Python 项目

```bash
# .iflowignore for Python project

# Python 缓存
__pycache__/
*.pyc
*.pyo
*.pyd

# 虚拟环境
venv/
env/
.venv/

# 构建文件
build/
dist/
*.egg-info/

# Jupyter Notebook 检查点
.ipynb_checkpoints/

# 测试和覆盖率
.pytest_cache/
.coverage
htmlcov/
```

## 功能验证

### 测试 ls 工具

```bash
# 使用 iFlow CLI 的 ls 工具查看目录
iflow -p "ls ."

# 被 .iflowignore 忽略的文件不会显示在输出中
# 工具会显示类似 "X 个文件被 iflow-ignored" 的统计信息
```

### 测试文件读取

```bash
# 使用批量文件读取
iflow -p "read_many_files *.txt"

# 被忽略的 .txt 文件会显示 "file is ignored by .iflowignore" 消息
```

### 测试 @ 命令

```bash
# 使用 @ 语法引用文件
iflow -p "@ignored-file.txt"

# 被忽略的文件会显示警告信息并跳过处理
```

## 注意事项

1. **重启生效**：修改 `.iflowignore` 文件后，需要重启 iFlow CLI 会话才能生效
2. **文件位置**：`.iflowignore` 文件必须放在项目根目录
3. **Git 独立**：`.iflowignore` 与 `.gitignore` 是独立的，互不影响
4. **工具支持**：并非所有工具都支持此功能，主要是文件操作相关的工具

## 调试技巧

如果发现忽略规则没有生效：

1. 检查 `.iflowignore` 文件是否在项目根目录
2. 检查文件路径是否正确（相对于项目根目录）
3. 重启 iFlow CLI 会话
4. 使用 `ls` 工具验证忽略效果

## 最佳实践

1. **版本控制**：将 `.iflowignore` 文件提交到 Git，让团队共享忽略规则
2. **分层忽略**：结合 `.gitignore` 使用，`.gitignore` 处理版本控制，`.iflowignore` 处理 AI 工具
3. **定期维护**：随着项目发展，及时更新忽略规则
4. **文档说明**：在项目 README 中说明特殊的忽略规则

通过合理使用 `.iflowignore`，你可以让 iFlow CLI 更专注于处理重要的代码文件，提高工作效率。