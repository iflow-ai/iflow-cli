---
sidebar_position: 20
hide_title: true
---

# Observability

> **Feature Overview**: Observability is iFlow CLI's monitoring and analysis system, providing performance monitoring, usage analysis, and debugging support.
> 
> **Learning Time**: 10-15 minutes
> 
> **Prerequisites**: Understanding basic JSON configuration, familiarity with system monitoring concepts

## What is Observability

Observability is a monitoring and analysis system provided by iFlow CLI that enables you to gain deep insights into CLI performance, operational status, and usage patterns. By enabling observability features, you can obtain tracing data, performance metrics, and structured logs to better monitor operations, debug issues, and optimize user experience.

## Core Features

| Feature | Description | Advantage |
|---------|-------------|-----------|
| Standardized Protocol | Built on OpenTelemetry standards | Compatible with various monitoring backends |
| Multiple Data Types | Supports traces, metrics, and logs | Comprehensive observability |
| Flexible Configuration | Supports local and cloud output methods | Adapts to different deployment environments |
| Privacy Protection | Configurable sensitive information recording | Protects user privacy |
| Performance Optimization | Asynchronous processing, doesn't affect CLI performance | Transparent monitoring |

## How It Works

### Observability Data Flow

```
CLI Operations → Data Collection → Data Processing → Data Output → Monitoring Analysis
    ↓
[User Behavior] → [Trace Recording] → [Metric Aggregation] → [Local/Cloud] → [Performance Insights]
```

### Technical Architecture

- **Data Collection**: Automatically collects performance data based on OpenTelemetry SDK
- **Data Processing**: Structured processing with filtering and aggregation support
- **Data Output**: Supports multiple outputs including local files, OTLP endpoints, cloud services
- **Privacy Protection**: Configurable data masking and filtering mechanisms

## Detailed Feature Description

### Configuration Management

Observability features support multiple flexible configuration methods, primarily managed through configuration files and environment variables, with CLI flags able to override specific session settings.

#### Configuration Priority

| Priority | Configuration Method | Description |
|----------|---------------------|-------------|
| Highest | CLI flags | Temporarily override current session |
| High | Environment variables | Global environment configuration |
| Medium | Project configuration | `.iflow/settings.json` |
| Low | User configuration | `~/.iflow/settings.json` |
| Lowest | Default values | System default settings |

#### CLI Flag Parameters

| Parameter | Function | Example |
|-----------|----------|---------|
| `--telemetry` / `--no-telemetry` | Enable/disable observability | `iflow --telemetry` |
| `--telemetry-target <local\|gcp>` | Set output target | `iflow --telemetry-target local` |
| `--telemetry-otlp-endpoint <URL>` | Set OTLP endpoint | `iflow --telemetry-otlp-endpoint http://localhost:4317` |
| `--telemetry-outfile <path>` | Export to file | `iflow --telemetry-outfile ./metrics.json` |
| `--telemetry-log-prompts` | Record prompts | `iflow --telemetry-log-prompts` |

#### Environment Variables

| Variable Name | Purpose | Example |
|---------------|---------|---------|
| `OTEL_EXPORTER_OTLP_ENDPOINT` | Set OTLP export endpoint | `http://localhost:4317` |

#### Default Settings

| Configuration Item | Default Value | Description |
|--------------------|---------------|-------------|
| `telemetry.enabled` | `false` | Observability disabled by default |
| `telemetry.target` | `local` | Local output |
| `telemetry.otlpEndpoint` | `http://localhost:4317` | Local OTLP endpoint |
| `telemetry.logPrompts` | `true` | Record prompts |

### Configuration Examples

#### Local Development Environment

Enable local observability in `.iflow/settings.json`:

```json
{
  "telemetry": {
    "enabled": true,
    "target": "gcp"
  },
  "sandbox": false
}
```

### Export to File

You can export all observability data to local files for detailed analysis and inspection.

Simply use the `--telemetry-outfile` flag and specify the output file path to enable file export functionality. Note that this feature needs to be used with `--telemetry-target=local`.

```bash
iflow --telemetry --telemetry-target=local --telemetry-outfile=/path/to/telemetry.log "your prompt"
```

## Running OTEL Collector

The OTEL collector is a powerful service responsible for receiving, processing, and exporting observability data.
The CLI sends data through the efficient OTLP/gRPC protocol.

Want to learn more about standard OTEL exporter configurations? Check the [official documentation][otel-config-docs] for detailed information.

[otel-config-docs]: https://opentelemetry.io/docs/languages/sdk-configuration/otlp-exporter/

### Local Deployment

Using the `npm run telemetry -- --target=local` command can easily automate the setup of local observability pipelines, including automatically configuring necessary settings in the `.iflow/settings.json` file. The script will help you install `otelcol-contrib` (OpenTelemetry Collector) and `jaeger` (Jaeger UI for visualizing traces).

**Usage Steps:**

1. **Run Command**:
    Execute the following command in the repository root:

    ```bash
    npm run telemetry -- --target=local
    ```

    The script will automatically complete the following work for you:
    - Download Jaeger and OTEL components as needed
    - Start local Jaeger instance
    - Start configured OTEL collector to receive iFlow CLI data
    - Automatically enable observability in your workspace settings
    - Automatically disable observability when exiting

2. **View Traces**:
    Open your browser and visit **http://localhost:16686** to use Jaeger UI. Here you can view detailed trace information for iFlow CLI operations in depth.

3. **Check Logs and Metrics**:
    The script will save OTEL collector output (including logs and metrics) to `~/.iflow/tmp/<projectHash>/otel/collector.log`. The script provides convenient viewing links and local commands to track your observability data.

4. **Stop Services**:
    Press `Ctrl+C` in the terminal running the script to stop the OTEL collector and Jaeger services.

## Logs and Metrics Reference

The following sections detail the structure of logs and metrics generated by iFlow CLI to help you better understand and analyze the data.

- All logs and metrics include `sessionId` as a common identifying attribute.

### Logs

Logs record timestamped information for specific events. iFlow CLI records the following important events:

- `iflow_cli.config`: This event occurs once at startup and contains CLI configuration.
  - **Attributes**:
    - `model` (string)
    - `embedding_model` (string)
    - `sandbox_enabled` (boolean)
    - `core_tools_enabled` (string)
    - `approval_mode` (string)
    - `api_key_enabled` (boolean)
    - `vertex_ai_enabled` (boolean)
    - `code_assist_enabled` (boolean)
    - `log_prompts_enabled` (boolean)
    - `file_filtering_respect_git_ignore` (boolean)
    - `debug_mode` (boolean)
    - `mcp_servers` (string)

- `iflow_cli.user_prompt`: This event occurs when user submits a prompt.
  - **Attributes**:
    - `prompt_length`
    - `prompt` (excluded if `log_prompts_enabled` configuration is `false`)
    - `auth_type`

- `iflow_cli.tool_call`: This event occurs for each function call.
  - **Attributes**:
    - `function_name`
    - `function_args`
    - `duration_ms`
    - `success` (boolean)
    - `decision` (string: "accept", "reject", or "modify", if applicable)
    - `error` (if applicable)
    - `error_type` (if applicable)

- `iflow_cli.api_request`: This event occurs when making requests to iFlow API.
  - **Attributes**:
    - `model`
    - `request_text` (if applicable)

- `iflow_cli.api_error`: This event occurs when API requests fail.
  - **Attributes**:
    - `model`
    - `error`
    - `error_type`
    - `status_code`
    - `duration_ms`
    - `auth_type`

- `iflow_cli.api_response`: This event occurs when receiving responses from iFlow API.
  - **Attributes**:
    - `model`
    - `status_code`
    - `duration_ms`
    - `error` (optional)
    - `input_token_count`
    - `output_token_count`
    - `cached_content_token_count`
    - `thoughts_token_count`
    - `tool_token_count`
    - `response_text` (if applicable)
    - `auth_type`

- `iflow_cli.flash_fallback`: This event occurs when iFlow CLI switches to flash as fallback.
  - **Attributes**:
    - `auth_type`

- `iflow_cli.slash_command`: This event occurs when user executes slash commands.
  - **Attributes**:
    - `command` (string)
    - `subcommand` (string, if applicable)

### Metrics

Metrics provide numerical measurements of behavior over time. iFlow CLI collects the following key metrics:

- `iflow_cli.session.count` (counter, integer): Increments once each time CLI starts.

- `iflow_cli.tool.call.count` (counter, integer): Counts tool calls.
  - **Attributes**:
    - `function_name`
    - `success` (boolean)
    - `decision` (string: "accept", "reject", or "modify", if applicable)

- `iflow_cli.tool.call.latency` (histogram, milliseconds): Measures tool call latency.
  - **Attributes**:
    - `function_name`
    - `decision` (string: "accept", "reject", or "modify", if applicable)

- `iflow_cli.api.request.count` (counter, integer): Counts all API requests.
  - **Attributes**:
    - `model`
    - `status_code`
    - `error_type` (if applicable)

- `iflow_cli.api.request.latency` (histogram, milliseconds): Measures API request latency.
  - **Attributes**:
    - `model`

- `iflow_cli.token.usage` (counter, integer): Counts token usage.
  - **Attributes**:
    - `model`
    - `type` (string: "input", "output", "thought", "cache", or "tool")

- `iflow_cli.file.operation.count` (counter, integer): Counts file operations.
  - **Attributes**:
    - `operation` (string: "create", "read", "update"): Type of file operation.
    - `lines` (integer, if applicable): Number of lines in file.
    - `mimetype` (string, if applicable): File MIME type.
    - `extension` (string, if applicable): File extension.

### Cloud Deployment Environment

For cloud deployment, refer to the following platform observability integration guides:

#### Google Cloud Platform (GCP)

**Configuration Example**
```json
{
  "telemetry": {
    "enabled": true,
    "target": "gcp",
    "gcpProjectId": "your-project-id",
    "gcpServiceAccount": "path/to/service-account.json"
  }
}
```

**Environment Variable Setup**
```bash
export GOOGLE_APPLICATION_CREDENTIALS="path/to/service-account.json"
export GOOGLE_CLOUD_PROJECT="your-project-id"
```

#### Other Cloud Platforms

**AWS Integration**
- Supports sending trace data to AWS X-Ray via OTLP protocol
- Configurable CloudWatch metrics collection

**Azure Integration**
- Supports Application Insights integration
- Provides Azure Monitor compatible data formats

## Usage Examples

### Basic Configuration Enablement

#### Enable Observability at CLI Startup

```bash
# Enable observability and set local output
iflow --telemetry --telemetry-target local

# Enable observability and set OTLP endpoint
iflow --telemetry --telemetry-otlp-endpoint http://localhost:4317

# Enable observability and log prompt content
iflow --telemetry --telemetry-log-prompts
```

#### Project-level Configuration

Create `.iflow/settings.json` in project root:

```json
{
  "telemetry": {
    "enabled": true,
    "target": "local",
    "otlpEndpoint": "http://localhost:4317",
    "logPrompts": true,
    "outputFile": "./logs/telemetry.json"
  }
}
```

#### Global User Configuration

Configure in `~/.iflow/settings.json`:

```json
{
  "telemetry": {
    "enabled": false,
    "target": "local",
    "defaultEndpoint": "http://localhost:4317"
  }
}
```

### Advanced Use Cases

#### Performance Monitoring

```bash
# Enable detailed performance monitoring
iflow --telemetry --telemetry-target local --telemetry-outfile performance.log

# Execute task and monitor performance
"Please analyze this large project"

# View performance data
cat performance.log | jq '.metrics[] | select(.name == "iflow_cli.api.request.latency")'
```

#### Team Collaboration Monitoring

```bash
# Team shared OTLP collector
iflow --telemetry --telemetry-otlp-endpoint http://team-collector:4317

# Set team identifier
export OTEL_RESOURCE_ATTRIBUTES="team=frontend,project=webapp"
```

#### Debug Mode Data Collection

```bash
# Enable complete debug observability
iflow --telemetry --telemetry-log-prompts --telemetry-outfile debug.log

# Execute problematic operation
"Execute potentially problematic operation"

# Analyze debug data
grep "error" debug.log | jq .
```

## Troubleshooting

### Common Issues and Solutions

| Issue | Possible Cause | Solution |
|-------|---------------|----------|
| Observability data not recorded | Observability feature not enabled | Use `--telemetry` flag or enable via configuration file |
| OTLP connection failed | Endpoint not accessible or configuration error | Check endpoint URL and network connection |
| File export failed | Insufficient disk space or permission issues | Check disk space and file write permissions |
| Incomplete data | Filtering configuration too strict | Check data filtering and masking settings |
| Noticeable performance impact | Observability data volume too large | Adjust sampling rate or reduce recording details |

### Diagnostic Steps

#### 1. Basic Configuration Check

```bash
# Check current configuration status
/about

# View observability-related settings
cat .iflow/settings.json | jq '.telemetry'

# Verify if CLI flags take effect
iflow --help | grep telemetry
```

#### 2. Connectivity Test

```bash
# Test OTLP endpoint connection
curl -X POST http://localhost:4317/v1/traces -H "Content-Type: application/json" -d '{}'

# Check local collector status
ps aux | grep otelcol

# Verify network port is open
netstat -ln | grep 4317
```

#### 3. Data Validation

```bash
# Check output file content
tail -f /path/to/telemetry.log

# Verify data format
cat telemetry.log | jq '.traces[0]'

# Count data volume
wc -l telemetry.log
```

#### 4. Performance Analysis

```bash
# Monitor CLI performance
time iflow --telemetry "Simple test command"

# Check observability overhead
iflow --telemetry --telemetry-outfile perf.log "test" && ls -la perf.log

# Compare performance with/without observability
time iflow "same command" # without observability
time iflow --telemetry "same command" # with observability
```

### Data Privacy Protection

#### Sensitive Information Filtering

- **Prompt Protection**: Use `--no-telemetry-log-prompts` to disable prompt recording
- **Parameter Filtering**: Automatically filters tool parameters containing passwords, keys
- **Path Masking**: User path information is hashed
- **Content Cleaning**: Automatically identifies and cleans sensitive content

#### Data Storage Security

- **Local Storage**: Data stored only in local file system by default
- **Transmission Encryption**: OTLP protocol supports TLS encrypted transmission
- **Access Control**: Configuration files and log files permission control
- **Data Retention**: Configurable automatic data cleanup policies

### Platform Compatibility

| Platform | Support Level | Special Notes |
|----------|---------------|---------------|
| Windows | Full support | Path separators automatically handled, supports PowerShell |
| macOS | Full support | Supports system-level OpenTelemetry integration |
| Linux | Full support | Native OpenTelemetry support, complete container compatibility |

### Containerized Deployment Considerations

- **Docker Environment**: Requires proper network and volume mount configuration
- **Kubernetes Integration**: Supports data collection through Service Mesh
- **Permission Management**: Requires appropriate file system permissions within containers