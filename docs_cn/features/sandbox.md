---
sidebar_position: 6
hide_title: true
---

# 沙箱配置

iFlow CLI 可以在沙箱环境中执行潜在不安全的操作（如 shell 命令和文件修改）以保护您的系统。

沙箱默认禁用，但您可以通过几种方式启用：

- 使用 `--sandbox` 或 `-s` 标志。
- 设置 `IFLOW_SANDBOX` 环境变量。

默认情况下，它使用预构建的 `iflow-cli-sandbox` Docker 镜像。

对于项目特定的沙箱需求，您可以在项目根目录的 `.iflow/sandbox.Dockerfile` 创建自定义 Dockerfile。此 Dockerfile 可以基于基础沙箱镜像：

```dockerfile
FROM iflow-cli-sandbox

# 在这里添加您的自定义依赖项或配置
# 例如：
# RUN apt-get update && apt-get install -y some-package
# COPY ./my-config /app/my-config
```

当 `.iflow/sandbox.Dockerfile` 存在时，您可以在运行 iFlow CLI 时使用 `BUILD_SANDBOX` 环境变量自动构建自定义沙箱镜像：

```bash
BUILD_SANDBOX=1 iflow -s
```