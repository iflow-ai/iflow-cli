---
sidebar_position: 0
hide_title: true
---

# CLI Configuration

iFlow CLI provides rich configuration options. You can customize CLI behavior through environment variables, command line parameters, and settings files. Below we will detail these configuration methods to help you create a personalized user experience.

## Configuration Hierarchy

iFlow CLI uses a layered configuration system that takes effect in the following priority order, with higher priority settings overriding lower priority settings:

1. Application Defaults: CLI built-in basic configuration
2. User Global Settings: Your personal default configuration, applies to all projects
3. Project-Specific Settings: Configuration for specific projects, overrides user settings
4. System-Level Settings: Administrator configuration, applies to the entire system
5. Command Line Parameters: Temporary configuration specified at startup, highest priority

## Environment Variable Configuration

iFlow CLI now supports configuration through environment variables. **All configuration items in `~/.iflow/settings.json` can be set through environment variables with the IFLOW\_ prefix**, avoiding conflicts with environment variables from other projects.

### Environment Variable Naming Conventions

#### IFLOW Prefix Rules

**To avoid conflicts with environment variables from other projects, all environment variables must use the `IFLOW` or `iflow` prefix.**

For any configuration item in `settings.json`, iFlow supports the following 4 environment variable naming conventions (sorted by priority):

1. **IFLOW\_ prefixed camelCase naming** - `IFLOW_` + key name in settings.json (recommended)
2. **IFLOW\_ prefixed underscore naming** - `IFLOW_` + uppercase underscore format
3. **iflow\_ prefixed camelCase naming** - `iflow_` + key name in settings.json
4. **iflow\_ prefixed underscore naming** - `iflow_` + uppercase underscore format

#### Naming Examples

| key in settings.json | 1. IFLOW_camelCase      | 2. IFLOW_underscore       | 3. iflow_camelCase      | 4. iflow_underscore       |
| -------------------- | ----------------------- | ------------------------- | ----------------------- | ------------------------- |
| `apiKey`             | `IFLOW_apiKey`          | `IFLOW_API_KEY`           | `iflow_apiKey`          | `iflow_API_KEY`           |
| `baseUrl`            | `IFLOW_baseUrl`         | `IFLOW_BASE_URL`          | `iflow_baseUrl`         | `iflow_BASE_URL`          |
| `modelName`          | `IFLOW_modelName`       | `IFLOW_MODEL_NAME`        | `iflow_modelName`       | `iflow_MODEL_NAME`        |
| `vimMode`            | `IFLOW_vimMode`         | `IFLOW_VIM_MODE`          | `iflow_vimMode`         | `iflow_VIM_MODE`          |
| `showMemoryUsage`    | `IFLOW_showMemoryUsage` | `IFLOW_SHOW_MEMORY_USAGE` | `iflow_showMemoryUsage` | `iflow_SHOW_MEMORY_USAGE` |

#### Supported Configuration Items

All configuration items in `~/.iflow/settings.json` support environment variable settings, including but not limited to:

- `apiKey` - API key
- `baseUrl` - Base URL
- `modelName` - Model name
- `vimMode` - Vim mode toggle
- `showMemoryUsage` - Show memory usage
- `maxSessionTurns` - Maximum session turns
- `theme` - Theme settings
- And all other configuration items in the Settings interface

### Usage Methods

#### Method 1: Use IFLOW\_ prefixed camelCase naming (recommended)

```bash
export IFLOW_apiKey="your_api_key_here"
export IFLOW_baseUrl="https://your-api-url.com/v1"
export IFLOW_modelName="your_model_name"
iflow
```

#### Method 2: Use IFLOW\_ prefixed underscore naming

```bash
export IFLOW_API_KEY="your_api_key_here"
export IFLOW_BASE_URL="https://your-api-url.com/v1"
export IFLOW_MODEL_NAME="your_model_name"
iflow
```

#### Method 3: Use iflow\_ prefix (lowercase)

```bash
export iflow_apiKey="your_api_key_here"
export iflow_baseUrl="https://your-api-url.com/v1"
export iflow_modelName="your_model_name"
iflow
```

#### Method 4: Set and start in one line

```bash
IFLOW_apiKey=your_key IFLOW_baseUrl=https://api.example.com/v1 iflow
```

#### Method 5: Set more configuration items

```bash
# All configurations in settings.json support IFLOW_ prefix
export IFLOW_apiKey="your_api_key_here"
export IFLOW_baseUrl="https://your-api-url.com/v1"
export IFLOW_modelName="your_model_name"
export IFLOW_vimMode="true"
export IFLOW_showMemoryUsage="true"
export IFLOW_maxSessionTurns="50"
export IFLOW_coreTools="read,write,shell,grep"
export IFLOW_theme="dark"
iflow
```

### Configuration Priority

Complete configuration priority (from high to low):

1. **Command Line Parameters** - such as `iflow --model your-model`
2. **IFLOW Prefixed Environment Variables** - supports all configuration items in settings.json
   - IFLOW_camelCase > IFLOW_underscore > iflow_camelCase > iflow_underscore
3. **System Configuration File** - `/etc/iflow-cli/settings.json` or similar path
4. **Workspace Configuration File** - `./iflow/settings.json`
5. **User Configuration File** - `~/.iflow/settings.json`
6. **Default Values** - default configuration defined in code

### Practical Use Cases

#### OpenAI Compatible API

```bash
export IFLOW_apiKey="sk-1234567890abcdef"
export IFLOW_baseUrl="https://api.openai.com/v1"
export IFLOW_modelName="gpt-4"
iflow
```

#### Custom API Service

```bash
export IFLOW_API_KEY="your_custom_key"
export IFLOW_BASE_URL="https://your-custom-api.com/v1"
export IFLOW_MODEL_NAME="your-custom-model"
iflow
```

#### Use in CI/CD Environment

```bash
# In GitHub Actions or other CI environments
export IFLOW_apiKey="${{ secrets.API_KEY }}"
export IFLOW_baseUrl="${{ vars.API_URL }}"
iflow --prompt "Generate documentation"
```

### Environment Variable Validation

iFlow automatically detects and validates environment variables:

- If valid environment variable configuration is detected, it will automatically select the iFlow authentication type
- If there is no configuration, it will display help information guiding how to set up
- Incorrect configuration will display detailed error messages

### Security Considerations

1. **Do not hardcode API keys in code**
2. **Use `.env` files to store local development configuration**
3. **Use environment variables or key management services in production environments**
4. **Regularly rotate API keys**

### Troubleshooting

#### Priority Issues

If configuration doesn't work as expected, check if higher priority configurations have overridden the environment variables:

1. Check command line parameters
2. Check `~/.iflow/settings.json` configuration file
3. Check other environment variables

#### Authentication Failure

Ensure:

1. API key format is correct
2. Base URL is accessible
3. Model name is correct

### Migration Guide

#### Migrating from Configuration Files to Environment Variables

If you previously used configuration files, you can migrate settings to environment variables:

```bash
# Add the following to your .bashrc or .zshrc
export IFLOW_API_KEY="apiKey from settings.json"
export IFLOW_BASE_URL="baseUrl from settings.json"
export IFLOW_MODEL_NAME="modelName from settings.json"
```

#### Maintain Backward Compatibility

All existing configuration methods continue to work:

- `settings.json` configuration files
- Existing environment variables (`GEMINI_API_KEY` etc.)
- Command line parameters

## Settings Files

Through `settings.json` files, you can save commonly used configurations. Depending on the use case, files can be placed in the following locations:

- **User Settings File:**
  - **Location:** `~/.iflow/settings.json` (`~` represents your home directory)
  - **Scope:** Personal default configuration, applies to all projects
- **Project Settings File:**
  - **Location:** `.iflow/settings.json` in the project root directory
  - **Scope:** Only applies to the current project, overrides user global settings
- **System Settings File:**
  - **Location:** `/etc/iflow-cli/settings.json` (Linux), `C:\ProgramData\iflow-cli\settings.json` (Windows), or `/Library/Application Support/iFlowCli/settings.json` (macOS). Can also be customized via the `IFLOW_CLI_SYSTEM_SETTINGS_PATH` environment variable
  - **Scope:** Affects all users on the system, usually configured by administrators. Particularly useful in enterprise environments for unified team configuration management

**Environment Variable References:** In `settings.json` files, you can use `$VAR_NAME` or `${VAR_NAME}` syntax to reference environment variables. These variables are automatically resolved when loading settings. For example, if you have an environment variable `MY_API_TOKEN`, you can use it in `settings.json` like this: `"apiKey": "$MY_API_TOKEN"`.

### The `.iflow` Directory in Projects

Besides project settings files, the project's `.iflow` directory can also contain other project-specific files related to iFlow CLI operations, such as:

- [Custom sandbox configuration files](#sandbox) (like `.iflow/sandbox-macos-custom.sb`, `.iflow/sandbox.Dockerfile`).

### Available Settings in `settings.json`:

- **`selectedAuthType`** (string)
  - **Description:** Authentication type, used to specify the authentication method for connecting to the API. `iflow` means using XinLiu authentication, `openai-compatible` supports any model service provider that offers OpenAI protocol
  - **Default:** `iflow`
  - **Example:** `"selectedAuthType": "api_key"`

- **`apiKey`** (string)
  - **Description:** API key for model call authentication
  - **Default:** Required
  - **Example:** `"apiKey": "sk-xxxxxxxxxxxxxxxxxxxxx"`

- **`baseUrl`** (string)
  - **Description:** Base URL address of the API service
  - **Default:** Required
  - **Example:** `"baseUrl": "https://api.xinliu.ai/v1"`

- **`modelName`** (string)
  - **Description:** Name of the AI model to use
  - **Default:** Required
  - **Example:** `"modelName": "Qwen3-Coder"`

- **`contextFileName`** (string or string array):
  - **Description:** Context file name (such as `IFLOW.md`, `AGENTS.md`). Can be a single filename or a list of filenames
  - **Default:** `IFLOW.md`
  - **Example:** `"contextFileName": "AGENTS.md"`

- **`bugCommand`** (object):
  - **Description:** Override the default URL for the `/bug` command.
  - **Default:** `"urlTemplate": "https://github.com/iflow-ai/iflow-cli/issues/new?template=bug_report.yml&title={title}&info={info}"`
  - **Properties:**
    - **`urlTemplate`** (string): URL that can contain `{title}` and `{info}` placeholders.
  - **Example:**
    ```json
    "bugCommand": {
      "urlTemplate": "https://bug.example.com/new?title={title}&info={info}"
    }
    ```

- **`fileFiltering`** (object):
  - **Description:** Controls git-aware file filtering behavior for @ commands and file discovery tools.
  - **Default:** `"respectGitIgnore": true, "enableRecursiveFileSearch": true`
  - **Properties:**
    - **`respectGitIgnore`** (boolean): Whether to follow .gitignore patterns when discovering files. When set to `true`, git-ignored files (like `node_modules/`, `dist/`, `.env`) are automatically excluded from @ commands and file listing operations.
    - **`enableRecursiveFileSearch`** (boolean): Whether to enable recursive searching for filenames under the current tree when completing @ prefixes in prompts.
  - **Example:**
    ```json
    "fileFiltering": {
      "respectGitIgnore": true,
      "enableRecursiveFileSearch": false
    }
    ```

- **`coreTools`** (string array):
  - **Description:** Allows you to specify a list of core tool names that should be provided to the model. This can be used to limit the built-in toolset. See the `/tools` command to learn about the core tool list. You can also specify command-specific restrictions for supported tools like `ShellTool`. For example, `"coreTools": ["ShellTool(ls -l)"]` will only allow executing the `ls -l` command.
  - **Default:** All tools are available to iFlow CLI.
  - **Example:** `"coreTools": ["ReadFileTool", "GlobTool", "ShellTool(ls)"]`.

- **`excludeTools`** (string array):
  - **Description:** Allows you to specify a list of core tool names that should be excluded from the CLI. Tools listed in both `excludeTools` and `coreTools` will be excluded. You can also specify command-specific restrictions for supported tools like `ShellTool`. For example, `"excludeTools": ["ShellTool(rm -rf)"]` will block the `rm -rf` command.
  - **Default:** Does not exclude any tools.
  - **Example:** `"excludeTools": ["ShellTool", "glob"]`.
  - **Security Note:** Command-specific restrictions for `ShellTool` in `excludeTools` are based on simple string matching and can be easily bypassed. This feature **is not a security mechanism** and should not be relied upon to safely execute untrusted code. It is recommended to use `coreTools` to explicitly select which commands can be executed.

- **`allowMCPServers`** (string array):
  - **Description:** Allows you to specify a list of MCP server names that should be provided to the CLI. This can be used to limit the set of MCP servers to connect to. Note that if `--allowed-mcp-server-names` is set, this setting will be ignored.
  - **Default:** All MCP servers are available to iFlow CLI.
  - **Example:** `"allowMCPServers": ["myPythonServer"]`.
  - **Security Note:** This uses simple string matching of MCP server names and can be modified. If you are a system administrator and want to prevent users from bypassing this setting, consider configuring `mcpServers` at the system settings level, so users will not be able to configure any MCP servers of their own. This should not be used as a tight security mechanism.

- **`excludeMCPServers`** (string array):
  - **Description:** Allows you to specify a list of MCP server names that should be excluded from the CLI. Servers listed in both `excludeMCPServers` and `allowMCPServers` will be excluded. Note that if `--allowed-mcp-server-names` is set, this setting will be ignored.
  - **Default:** Does not exclude any MCP servers.
  - **Example:** `"excludeMCPServers": ["myNodeServer"]`.
  - **Security Note:** This uses simple string matching of MCP server names and can be modified. If you are a system administrator and want to prevent users from bypassing this setting, consider configuring `mcpServers` at the system settings level, so users will not be able to configure any MCP servers of their own. This should not be used as a tight security mechanism.

- **`autoAccept`** (boolean):
  - **Description:** Controls whether the CLI automatically accepts and executes tool calls that are considered safe (such as read-only operations) without requiring explicit user confirmation. If set to `true`, the CLI will bypass confirmation prompts for tools considered safe.
  - **Default:** `false`
  - **Example:** `"autoAccept": true`

- **`theme`** (string):
  - **Description:** Sets the visual theme for iFlow CLI.
  - **Default:** `"Default"`
  - **Example:** `"theme": "GitHub"`

- **`vimMode`** (boolean):
  - **Description:** Enable or disable vim mode for input editing. When enabled, the input area supports vim-style navigation and editing commands, with NORMAL and INSERT modes. Vim mode status is displayed in the footer and persists across sessions.
  - **Default:** `false`
  - **Example:** `"vimMode": true`

- **`sandbox`** (boolean or string):
  - **Description:** Controls whether and how to use sandboxing for tool execution. If set to `true`, iFlow CLI uses the pre-built `iflow-cli-sandbox` Docker image. See [Sandbox](#sandbox) for more information.
  - **Default:** `false`
  - **Example:** `"sandbox": "docker"`

- **`mcpServers`** (object):
  - **Description:** Configure connections to one or more Model Context Protocol (MCP) servers for discovering and using custom tools. iFlow CLI attempts to connect to each configured MCP server to discover available tools. If multiple MCP servers expose tools with the same name, the tool names will be prefixed with the server alias you define in the configuration (like `serverAlias__actualToolName`) to avoid conflicts. Note that the system may strip certain schema properties from MCP tool definitions for compatibility.
  - **Default:** Empty
  - **Properties:**
    - **`<SERVER_NAME>`** (object): Server parameters for the named server.
      - `command` (string, required): The command to execute to start the MCP server.
      - `args` (string array, optional): Arguments to pass to the command.
      - `env` (object, optional): Environment variables to set for the server process.
      - `cwd` (string, optional): Working directory to start the server in.
      - `timeout` (number, optional): Timeout for requests to this MCP server (in milliseconds).
      - `trust` (boolean, optional): Trust this server and bypass all tool call confirmations.
      - `includeTools` (string array, optional): List of tool names to include from this MCP server. When specified, only tools listed here will be available from this server (whitelist behavior). If not specified, all tools from the server are enabled by default.
      - `excludeTools` (string array, optional): List of tool names to exclude from this MCP server. Tools listed here will not be available to the model, even if they are exposed by the server. **Note:** `excludeTools` takes precedence over `includeTools` - if a tool is in both lists, it will be excluded.
  - **Example:**
    ```json
    "mcpServers": {
      "myPythonServer": {
        "command": "python",
        "args": ["mcp_server.py", "--port", "8080"],
        "cwd": "./mcp_tools/python",
        "timeout": 5000,
        "includeTools": ["safe_tool", "file_reader"],
      },
      "myNodeServer": {
        "command": "node",
        "args": ["mcp_server.js"],
        "cwd": "./mcp_tools/node",
        "excludeTools": ["dangerous_tool", "file_deleter"]
      },
      "myDockerServer": {
        "command": "docker",
        "args": ["run", "-i", "--rm", "-e", "API_KEY", "ghcr.io/foo/bar"],
        "env": {
          "API_KEY": "$MY_API_TOKEN"
        }
      }
    }
    ```

- **`checkpointing`** (object):
  - **Description:** Configure the checkpointing feature, which allows you to save and restore conversation and file state. See [Checkpointing documentation](../features/checkpointing.md) for more details.
  - **Default:** `{"enabled": false}`
  - **Properties:**
    - **`enabled`** (boolean): When `true`, the `/restore` command is available.

- **`preferredEditor`** (string):
  - **Description:** Specify the preferred editor to use when viewing diffs.
  - **Default:** `vscode`
  - **Example:** `"preferredEditor": "vscode"`

- **`telemetry`** (object)
  - **Description:** Configure logging and metrics collection for iFlow CLI. See [Telemetry](../features/telemetry.md) for more information.
  - **Default:** `{"enabled": false, "target": "local", "otlpEndpoint": "http://localhost:4317", "logPrompts": true}`
  - **Properties:**
    - **`enabled`** (boolean): Whether to enable observability.
    - **`target`** (string): Target for collected observability data. Supported values are `local` and `gcp`.
    - **`otlpEndpoint`** (string): Endpoint for the OTLP exporter.
    - **`logPrompts`** (boolean): Whether to include user prompt content in logs.
  - **Example:**
    ```json
    "telemetry": {
      "enabled": true,
      "target": "local",
      "otlpEndpoint": "http://localhost:16686",
      "logPrompts": false
    }
    ```

- **`hideTips`** (boolean):
  - **Description:** Enable or disable helpful tips in the CLI interface.
  - **Default:** `false`
  - **Example:**

    ```json
    "hideTips": true
    ```

- **`hideBanner`** (boolean):
  - **Description:** Enable or disable the startup banner (ASCII art logo) in the CLI interface.
  - **Default:** `false`
  - **Example:**

    ```json
    "hideBanner": true
    ```

- **`maxSessionTurns`** (number):
  - **Description:** Set the maximum number of turns for a session. If the session exceeds this limit, the CLI will stop processing and start a new chat.
  - **Default:** `-1` (unlimited)
  - **Example:**
    ```json
    "maxSessionTurns": 10
    ```

- **`summarizeToolOutput`** (object):
  - **Description:** Enable or disable summarization of tool output. You can specify the token budget for summarization using the `tokenBudget` setting.
  - Note: Currently only supports the `run_shell_command` tool.
  - **Default:** `{}` (disabled by default)
  - **Example:**
    ```json
    "summarizeToolOutput": {
      "run_shell_command": {
        "tokenBudget": 2000
      }
    }
    ```
- **`disableAutoUpdate`** (boolean):
  - **Description:** Disable automatic updates. Setting to true will disable the auto-update feature
  - **Default:** `false` (auto-update enabled by default)
  - **Example:**
    ```json
    "disableAutoUpdate": true
    ```

- **`disableTelemetry`** (boolean):
  - **Description:** Disable sending telemetry data (currently only sends interface timing data)
  - **Default:** `false` (sending enabled by default)
  - **Example:**
    ```json
    "disableTelemetry": true
    ```

- **`tokensLimit`** (number):
  - **Description:** Used to set the model's context window length
  - **Default:** 128000
  - **Example:**
    ```json
    "tokensLimit": 100000
    ```

- **`compressionTokenThreshold`** (number):
  - **Description:** Used to control the threshold for triggering automatic compression operations
  - **Default:** 0.8
  - **Example:**
    ```json
    "compressionTokenThreshold": 0.8
    ```

- **`useRipgrep`** (boolean):
  - **Description:** Whether to enable Ripgrep
  - **Default:** true
  - **Example:**
    ```json
    "useRipgrep": false
    ```

- **`skipNextSpeakerCheck`** (boolean):
  - **Description:** Whether to skip task completion detection
  - **Default:** true
  - **Example:**
    ```json
    "skipNextSpeakerCheck": true
    ```

- **`shellTimeout`** (number)
  - **Description:** Shell tool execution timeout in milliseconds
  - **Default:** 120000
  - **Example:**
    ```json
    "shellTimeout": 120000
    ```

### `settings.json` Example:

```json
{
  "selectedAuthType": "iflow",
  "apiKey": "sk-xxx",
  "baseUrl": "https://apis.iflow.cn/v1",
  "modelName": "Qwen3-Coder",
  "theme": "GitHub",
  "sandbox": "docker",
  "toolDiscoveryCommand": "bin/get_tools",
  "toolCallCommand": "bin/call_tool",
  "mcpServers": {
    "mainServer": {
      "command": "bin/mcp_server.py"
    },
    "anotherServer": {
      "command": "node",
      "args": ["mcp_server.js", "--verbose"]
    }
  },
  "telemetry": {
    "enabled": true,
    "target": "local",
    "otlpEndpoint": "http://localhost:4317",
    "logPrompts": true
  },
  "usageStatisticsEnabled": true,
  "hideTips": false,
  "hideBanner": false,
  "maxSessionTurns": 10,
  "summarizeToolOutput": {
    "run_shell_command": {
      "tokenBudget": 100
    }
  }
}
```

## Shell History

The CLI saves a history of shell commands you run. To avoid conflicts between different projects, this history is stored in a project-specific directory within the user's home folder.

- **Location:** `~/.iflow/tmp/<project_hash>/shell_history`
  - `<project_hash>` is a unique identifier generated from the project root path.
  - History is stored in a file named `shell_history`.

## Command Line Arguments

Command line arguments passed when running the CLI can override other configurations for the current session.

- **`--model <model_name>`** (**`-m <model_name>`**):
  - Specify the iFlow model to use for the current session
  - Example: `npm start -- --model Qwen3-Coder`
- **`--prompt <your_prompt>`** (**`-p <your_prompt>`**):
  - Pass a prompt directly to run iFlow CLI in non-interactive mode
- **`--prompt-interactive <your_prompt>`** (**`-i <your_prompt>`**):
  - Start an interactive session with the specified prompt
  - The prompt is processed within the interactive session
  - Does not support stdin pipeline input
  - Example: `iflow -i "explain this code"`
- **`--sandbox`** (**`-s`**):
  - Enable sandbox mode for this session.
- **`--sandbox-image`**:
  - Set the sandbox image URI.
- **`--debug`** (**`-d`**):
  - Enable debug mode for this session, providing more detailed output.
- **`--all-files`** (**`-a`**):
  - If set, recursively include all files within the current directory as context for the prompt.
- **`--help`** (or **`-h`**):
  - Display helpful information about command line arguments.
- **`--show-memory-usage`**:
  - Display current memory usage.
- **`--yolo`**:
  - Enable YOLO mode, automatically approving all tool calls.
- **`--telemetry`**:
  - Enable [observability](../features/telemetry.md).
- **`--telemetry-target`**:
  - Set the observability target. See [observability](../features/telemetry.md) for more information.
- **`--telemetry-otlp-endpoint`**:
  - Set the OTLP endpoint for observability. See [observability](../features/telemetry.md) for more information.
- **`--telemetry-log-prompts`**:
  - Enable prompt logging for observability. See [observability](../features/telemetry.md) for more information.
- **`--checkpointing`**:
  - Enable [checkpointing](../features/checkpointing.md).
- **`--extensions <extension_name ...>`** (**`-e <extension_name ...>`**):
  - Specify a list of extensions to use for the session. If not provided, all available extensions are used.
  - Use the special term `iflow -e none` to disable all extensions.
  - Example: `iflow -e my-extension -e my-other-extension`
- **`--list-extensions`** (**`-l`**):
  - List all available extensions and exit.
- **`--proxy`**:
  - Set a proxy for the CLI.
  - Example: `--proxy http://localhost:7890`.
- **`--include-directories <dir1,dir2,...>`** (**`--add-dir <dir1,dir2,...>`**):
  - Include additional directories in the workspace to support multi-directory setups.
  - Can be specified multiple times or as comma-separated values.
  - Up to 5 directories can be added.
  - Example: `--include-directories /path/to/project1,/path/to/project2` or `--add-dir /path/to/project1 --add-dir /path/to/project2`
- **`--version`**:
  - Display the CLI version.

## Context Files (Layered Instruction Context)

While not strictly a configuration of CLI _behavior_, context files (default `IFLOW.md`, but configurable via the `contextFileName` setting) are crucial for configuring the _instruction context_ (also known as "memory") provided to the iFlow model. This powerful feature allows you to provide project-specific instructions, coding style guides, or any relevant background to the AI, making its responses more tailored to your needs. The CLI includes UI elements like an indicator in the footer showing the number of loaded context files, keeping you informed about the active context.

- **Purpose:** These Markdown files contain instructions, guidelines, or context that you want the iFlow model to be aware of during interactions. The system is designed to manage this instruction context hierarchically.

### Context File Content Example (like `IFLOW.md`)

Here's a conceptual example of what a context file might contain in the root of a TypeScript project:

```markdown
# Project: My Awesome TypeScript Library

## General Instructions:

- When generating new TypeScript code, please follow the existing coding style.
- Ensure all new functions and classes have JSDoc comments.
- Prefer functional programming paradigms where appropriate.
- All code should be compatible with TypeScript 5.0 and Node.js 20+.

## Coding Style:

- Use 2 spaces for indentation.
- Interface names should be prefixed with `I` (like `IUserService`).
- Private class members should be prefixed with underscore (`_`).
- Always use strict equality (`===` and `!==`).

## Specific Component: `src/api/client.ts`

- This file handles all outbound API requests.
- When adding new API call functions, ensure they include robust error handling and logging.
- Use the existing `fetchWithRetry` utility for all GET requests.

## About Dependencies:

- Avoid introducing new external dependencies unless absolutely necessary.
- If a new dependency is needed, please explain why.
```

This example demonstrates how to provide general project context, specific coding conventions, and even notes about specific files or components. The more relevant and precise your context files are, the better the AI can assist you. Using project-specific context files to establish conventions and context is highly recommended.

- **Hierarchical Loading and Priority:** The CLI implements a sophisticated layered memory system by loading context files (like `IFLOW.md`) from multiple locations. Content from files lower in this list (more specific) typically overrides or supplements content from files higher up (more general). The exact concatenation order and final context can be inspected using the `/memory show` command. The typical loading order is:
  1.  **Global Context Files:**
      - Location: `~/.iflow/<contextFileName>` (like `~/.iflow/IFLOW.md` in the user's home directory).
      - Scope: Provides default instructions for all your projects.
  2.  **Project Root and Ancestor Context Files:**
      - Location: The CLI searches for the configured context file in the current working directory, then in each parent directory up to the project root (identified by a `.git` folder) or your home directory.
      - Scope: Provides context relevant to the entire project or significant parts of it.
  3.  **Subdirectory Context Files (contextual/local):**
      - Location: The CLI also scans for the configured context file in subdirectories _below_ the current working directory (following common ignore patterns like `node_modules`, `.git`, etc.). The breadth of this search is limited to 200 directories by default but can be configured via the `memoryDiscoveryMaxDirs` field in the `settings.json` file.
      - Scope: Allows for highly specific instructions related to particular components, modules, or subsections of the project.
- **Concatenation and UI Indication:** The contents of all found context files are concatenated (with separators indicating their source and path) and provided as part of the system prompt to the iFlow model. The CLI footer displays a count of loaded context files, giving you a quick visual cue about the active instruction context.
- **Import Content:** You can modularize your context files by importing other Markdown files using the `@path/to/file.md` syntax.
- **Memory Management Commands:**
  - Use `/memory refresh` to force a rescan and reload of context files from all configured locations. This updates the AI's instruction context.
  - Use `/memory show` to display the current loaded combined instruction context, allowing you to verify the hierarchy and content used by the AI.

By understanding and leveraging these configuration hierarchies and the layered nature of context files, you can effectively manage the AI's memory and tailor iFlow CLI's responses to your specific needs and projects.
