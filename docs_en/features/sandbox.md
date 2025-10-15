---
sidebar_position: 6
hide_title: true
---

# Sandbox Configuration

iFlow CLI can execute potentially unsafe operations (such as shell commands and file modifications) in a sandbox environment to protect your system.

The sandbox is disabled by default, but you can enable it in several ways:

- Use the `--sandbox` or `-s` flag.
- Set the `IFLOW_SANDBOX` environment variable.

By default, it uses the prebuilt `iflow-cli-sandbox` Docker image.

For project-specific sandbox requirements, you can create a custom Dockerfile at `.iflow/sandbox.Dockerfile` in your project root. This Dockerfile can be based on the base sandbox image:

```dockerfile
FROM iflow-cli-sandbox

# Add your custom dependencies or configurations here
# For example:
# RUN apt-get update && apt-get install -y some-package
# COPY ./my-config /app/my-config
```

When `.iflow/sandbox.Dockerfile` exists, you can automatically build a custom sandbox image when running iFlow CLI by using the `BUILD_SANDBOX` environment variable:

```bash
BUILD_SANDBOX=1 iflow -s
```