---
title: MCP
description: Extend iFlow CLI capabilities using Model Context Protocol
sidebar_position: 4
---

# MCP

> **Feature Overview**: Extend iFlow CLI capabilities through Model Context Protocol (MCP)  
> **Learning Time**: 15-20 minutes  
> **Prerequisites**: Complete basic operations, understand CLI basic usage

## What is MCP

**MCP** (Model Context Protocol) is the "USB interface" of the AI field, establishing standardized connections between large models and external tools.

### Core Features
- **Standardized Protocol**: Unified communication standard, replacing fragmented integrations
- **Secure Connection**: Controllable bidirectional data exchange
- **Feature Extension**: Add professional tool capabilities to AI assistants
- **Rich Ecosystem**: Community provides hundreds of MCP servers

## Installing MCP Tools

### Method 1: iFlow MCP Marketplace (Recommended)

Visit the [iFlow MCP Marketplace](https://platform.iflow.cn/mcp), search and copy installation commands, then execute in terminal:

```bash
# Basic syntax
iflow mcp add-json 'server-name' '{JSON configuration}'

# Example: Install Playwright automation tool
iflow mcp add-json 'playwright' '{"command":"npx","args":["-y","@iflow-mcp/playwright-mcp@0.0.32"]}'

# When executing in iFlow CLI (add ! prefix), manually refresh mcp list
!iflow mcp add-json 'playwright' '{"command":"npx","args":["-y","@iflow-mcp/playwright-mcp@0.0.32"]}'
/mcp refresh
```
All above commands install at project level. To ensure visibility across all projects, copy the corresponding global installation command from the marketplace:
```bash
iflow mcp add-json --scope user 'server-name' '{JSON configuration}'
```


### Method 2: Using `/mcp online` Installation

Execute `/mcp online` command in iFlow CLI to browse the MCP marketplace online and select appropriate MCP for installation.

After selecting the corresponding MCP Server, you can choose to install at project scope or user scope (visible to all projects).

### Method 3: Command Line Installation (Advanced Users)

View all MCP commands:
```bash
iflow mcp --help
```
#### Using `iflow mcp add-json` Command Installation

Suitable for scenarios with existing configuration files:

```bash
# Basic syntax
iflow mcp add-json <name> '<json-config>'

# Example: Weather API server
iflow mcp add-json weather-api '{
  "type": "stdio",
  "command": "/path/to/weather-cli",
  "args": ["--api-key", "abc123"],
  "env": {"CACHE_DIR": "/tmp"}
}'

# Verify installation
iflow mcp get weather-api
```
**Configuration Tips**:
- Ensure correct JSON format, pay attention to escape characters
- Use `--scope user` to add to global configuration
- Avoid server name conflicts (system automatically adds suffixes)

#### Using `iflow mcp add` to Add Standard stdio Servers

Suitable for locally running tools:

```bash
# Basic syntax
iflow mcp add <name> <command> [args...]

# Example: Local file processing tool
iflow mcp add file-manager python3 /path/to/file_manager.py
```

#### Using `iflow mcp add --transport sse` to Add SSE Servers

Suitable for web services requiring real-time communication:

```bash
# Basic syntax
iflow mcp add --transport sse <name> <url>

# Example: Connect to remote API service
iflow mcp add --transport sse analytics-api https://api.example.com/mcp

# Connection with authentication
iflow mcp add --transport sse secure-api https://api.example.com/mcp --auth-token YOUR_TOKEN
```

#### Using `iflow mcp add --transport http` to Add Remote HTTP Servers

```bash
# Basic syntax
iflow mcp add --transport http <name> <url>

# Example: Connect to notion
iflow mcp -transport http notion https://mcp.notion.com/mcp

# Connection with authentication
iflow mcp add --transport http secure-api https://api.example.com/mcp \
  --header "Authorization: Bearer your-token"
```

### Method 4: Install from Community

**GitHub MCP Server Repository**
- Browse: [MCP Server Collection](https://github.com/modelcontextprotocol/servers)
- Build your own: Use [MCP SDK](https://modelcontextprotocol.io/quickstart/server)

**Third-party Marketplaces**

After obtaining serverConfig configuration on platforms, use `iflow mcp add-json` command to install, ensuring the JSON configuration is a valid json string format.

💡 Tip: Using third-party MCP servers is at your own risk - iFlow CLI has not verified the correctness or security of all these servers. Ensure you trust the MCP servers you're installing. Be especially careful when using MCP servers that may retrieve untrusted content, as these may expose you to prompt injection risks.

### Method 5: Modify Configuration Files
For configuration file details, refer to: [CLI Configuration File Documentation](../configuration/settings.md)

Global/user scope available MCP servers are configured in the iFlow settings file at `~/.iflow/settings.json`. The configuration defines MCP servers to connect to and how to invoke them.

Project scope available MCP server configuration is at `.iflow/settings.json` in the project folder.


#### **`mcpServers`** (Object):
- **Description:** Configure connections to one or more Model Context Protocol (MCP) servers for discovering and using custom tools. iFlow CLI attempts to connect to each configured MCP server to discover available tools. If multiple MCP servers expose tools with the same name, tool names will be prefixed with the server alias you defined in configuration (like `serverAlias__actualToolName`) to avoid conflicts. Note that the system may strip certain schema properties from MCP tool definitions to maintain compatibility.
- **Default:** Empty
- **Properties:**
- **`<SERVER_NAME>`** (Object): Server parameters for the named server.
- `command` (String, Required): Command to execute to start the MCP server.
- `args` (String Array, Optional): Arguments to pass to the command.
- `env` (Object, Optional): Environment variables to set for the server process.
- `cwd` (String, Optional): Working directory to start the server from.
- `timeout` (Number, Optional): Timeout for requests to this MCP server (milliseconds).
- `trust` (Boolean, Optional): Trust this server and bypass all tool call confirmations.
- `includeTools` (String Array, Optional): List of tool names to include from this MCP server. When specified, only tools listed here will be available from this server (whitelist behavior). If not specified, all tools from the server are enabled by default.
- `excludeTools` (String Array, Optional): List of tool names to exclude from this MCP server. Tools listed here will not be available to the model, even if they are exposed by the server. **Note:** `excludeTools` takes precedence over `includeTools` - if a tool is in both lists, it will be excluded.
#### **Example:**
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


## MCP Server Management

### View Installed Servers
```bash
# List all MCP servers
iflow mcp list

# View specific server details
iflow mcp get <server-name>
```

### Remove
```bash
# Remove MCP server
iflow mcp remove <server-name>
```
### Manage in iFlow CLI
```bash
/mcp list
```

## Platform Compatibility

### Supported Platforms
- ✅ **macOS**: Full support
- ✅ **Windows (WSL)**: Support through WSL
- ✅ **Linux**: Native support
- ⚠️ **Windows Native**: Limited functionality

### Configuration Locations
- **Global Configuration**: `~/.iflow/mcp/config.json`
- **Project Configuration**: `{project}/.iflow/mcp.json`
- **Claude Desktop Integration**: Automatically reads Claude Desktop configuration

## Troubleshooting

### Server Startup Issues
- Check if command and arguments are correct
- Verify packages are installed (for npm packages)
- Check timeout settings
- View error messages in iFlow CLI

### Connection Issues
- Ensure server supports MCP protocol
- Check network connection (for remote servers)
- Verify environment variable settings are correct

### Performance Issues
- Adjust timeout values
- Check server resource usage
- Consider reducing concurrent MCP server count

## Best Practices

1. **Start Simple**: Use pre-configured servers before adding custom servers
2. **Test Thoroughly**: First test new MCP servers in safe environments
3. **Monitor Performance**: Pay attention to response times and resource usage
4. **Stay Updated**: Regularly update MCP server packages for security and feature improvements
5. **Document Changes**: Record custom configurations for team members

## Usage Examples

After configuring MCP servers, you can leverage their capabilities in iFlow conversations:

```
/mcp list
# Display available MCP servers

# Use enhanced reasoning (sequential-thinking server auto-activates)
How can I optimize this complex database query?

# Leverage context information (context7 server auto-activates)
What are the best practices for implementing authentication in Node.js?
```

MCP servers work transparently in the background, enhancing iFlow's capabilities without requiring explicit invocation in most cases.

### Security Considerations

**When using third-party MCP servers**:
- ⚠️ Verify server source and trustworthiness
- ⚠️ Review server permission requirements
- ⚠️ Be aware of prompt injection attack risks
- ⚠️ Regularly update server versions

**Recommended Practices**:
- ✅ Prioritize servers from official and well-known developers
- ✅ Validate functionality in test environments first
- ✅ Regularly audit installed servers
- ✅ Keep server versions updated

## Next Steps

After completing MCP configuration, we recommend continuing to learn:

1. **[Sub Agent Configuration](../examples/subagent.md)** - Configure specialized AI assistants
2. **[Best Practices](../examples/best-practices)** - Workflow optimization tips
3. **[Advanced Configuration](../configuration/settings)** - Deep customization settings

---

**Get Help**: 📖 [Official MCP Documentation](https://modelcontextprotocol.io/) | 🐛 [Issue Feedback](https://github.com/iflow-ai/iflow-cli/issues)