---
title: Workflow
description: Build complete workflows that include agents, commands, and MCP tools
sidebar_position: 8
---
# Workflow
> **Feature Overview**: Workflow is the workflow management system in iFlow CLI that integrates agents, commands, IFLOW.md, and MCP tools to create complete automated workflows.
>
> **Learning Time**: 15-20 minutes
>
> **Prerequisites**: iFlow CLI installed, authentication completed, basic understanding of agents, commands, and MCP usage
## What is Workflow
Workflows combine different AI capabilities (agents, commands, MCP tools) into complete workflow processes. Through workflows, you can create complex automated task chains, achieving full-process automation from code analysis, development, testing to deployment.

The XinLiu Open Platform has pre-built many excellent workflows, such as Xiaohongshu posting, in-depth research, PPT creation, flowchart drawing, etc. You can download and install them locally from the XinLiu Open Market, then adjust the workflows based on your unique personal needs.

For developers, the XinLiu Open Platform has pre-built developer workflows such as github spec, bmad, NioPD, ai-dev-task, etc. We welcome everyone to use them.

## Directory Structure
When you install a workflow, the project directory will be organized according to the following structure:

```
Project Root Directory/
├── .iflow/                   # iFlow CLI configuration and resource directory
│   ├── agents/               # Agent configuration folder
│   │   ├── agent1.md         # Specific agent configuration file
│   │   └── agent2.md         # More agent configurations
│   ├── commands/             # Custom command folder
│   │   ├── command1.md       # Specific command implementation
│   │   └── command2.md       # More command implementations
│   ├── IFLOW.md              # Detailed workflow documentation and configuration
│   └── settings.json         # MCP related configuration
├── [Project Folder]/         # Your project files and code
└── IFLOW.md                  # Workflow configuration and description file
```

**Directory Description:**
- `.iflow/` - Stores all iFlow CLI related configuration files and resources
- `agents/` - Contains agent configurations used in the workflow, one md file per agent
- `commands/` - Stores custom command implementations, one md file per command
- `IFLOW.md` - Core workflow configuration file that defines workflow processes, parameters, and usage instructions
- `settings.json` - Configuration for MCP tools that the workflow depends on and other iFlow CLI configurations
- `Project Folder` - File directory structure that the workflow output content depends on

## How It Works
### Workflow Architecture
```
Input Data → Workflow Engine → Step Orchestration → Result Output
    ↓           ↓           ↓          ↓
[User Request] → [Process Parsing] → [Component Invocation] → [Result Aggregation]
             ↓           ↓
         [Agent Execution] → [Command Execution] → [MCP Tool Invocation]
```

## Installation
1. Browse the [XinLiu Open Market](https://platform.iflow.cn/agents?type=workflows)
2. Browse and select the workflow you want to install
3. Click install to get the installation command
4. Execute the copied command in the terminal
> 💡 Workflows are installed at the project level by default and cannot be used in other working directories

## Usage
First, you can refer to the corresponding workflow description for usage. Generally, there are two ways to use it:
1. Directly use natural language to describe your needs, and iFlow CLI will automatically call the components in the workflow to fulfill your requirements
2. Use the built-in slash commands of the workflow to trigger the workflow process

## Examples
### AI PPT Generation
1. Navigate to a working folder and execute the installation command
```shell
iflow workflow add "ppt-generator-v3-OzctqA"
```

2. Start iFlow CLI in the current working folder
```shell
iflow
```

3. Execute the slash command to create PPT
```shell
/ppt-generator
```
It will first understand the current working directory, learn about its contents, then continuously interact with you to create a beautiful PPT

### Flowchart Drawing
1. Navigate to a working folder and execute the installation command
```shell
iflow workflow add "excalidraw-OzctqA"
```

2. Start iFlow CLI in the current working folder
```shell
iflow
```
3. Execute the slash command to draw flowchart
```shell
/excalidraw your drawing topic
```
4. Open the generated image file in [Excalidraw](https://excalidraw.com/)
5. With simple adjustments, you can create a beautiful flowchart

## Upload Your Own Workflow

When you develop an excellent workflow and want to share it with other users, you need to first package and upload the workflow to the XinLiu Open Platform.

### Package Workflow

1. **Navigate to workflow root directory**
   ```bash
   cd /path/to/your/workflow/directory
   ```

2. **Package all workflow files**
   ```bash
   zip -r your-workflow-name.zip . -x your-workflow-name.zip
   ```
   
   This command will:
   - Compress all files and folders in the current directory (including `.iflow` folder, project files, `IFLOW.md`, etc.)
   - Include hidden files (such as `.iflow` directory)
   - Exclude the generated zip file itself to avoid recursive inclusion
   - Maintain original directory structure when extracted, without creating additional directory levels

3. **Verify package contents**
   ```bash
   unzip -l your-workflow-name.zip
   ```

### Upload to XinLiu Open Platform

1. Visit [XinLiu Open Platform](https://platform.iflow.cn/agents?type=workflows)
2. Log in to your account
3. Click the "Upload Workflow" button
4. Upload your packaged `.zip` file
5. Fill in workflow information:
   - Workflow name and description
   - Usage instructions and examples
   - Tags and categories
   - Version information
6. Submit for review, and it will be displayed in the market after approval

### Packaging Considerations

- Ensure the `IFLOW.md` file contains complete workflow instructions
- All configuration files in the `.iflow/` directory should be included
- Remove any sensitive information (such as API keys, personal data, etc.)
- Test that the packaged workflow can be properly installed and run
- Add appropriate documentation and usage examples

### Best Practices for Workflow Sharing

1. **Complete Documentation**: Provide detailed usage instructions and configuration guides
2. **Rich Examples**: Include typical use cases and output examples
3. **Clear Configuration**: Clearly explain required environment configuration and dependencies
4. **Thorough Testing**: Test workflow stability in different environments
5. **Continuous Maintenance**: Timely updates and fixes for workflow issues