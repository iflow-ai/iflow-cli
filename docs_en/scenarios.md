---
title: Use Cases
description: Quickly find solutions based on work scenarios and specific needs
sidebar_position: 10
---

# Use Cases

> **Goal**: Quickly find the best solutions based on actual work scenarios  
> **Target Audience**: Users with specific task requirements who want to get started quickly  
> **Usage**: Select corresponding sections based on work scenarios

## How to Use This Document

### Quick Start (5 minutes)

If you are a new user or need to get started quickly, recommended reading order:

1. **Identify your role** → Check [Classification by Work Role](#classification-by-work-role)
2. **Learn basic operations** → Read the "Quick Start Process" for your role
3. **Configure necessary tools** → Refer to the "Recommended Configuration" section
4. **Start practicing** → Follow the "Learning Path" to gradually deepen your knowledge

### Choose Reading Path Based on Your Needs

| Your Situation | Recommended Reading Path | Estimated Time |
|----------------|-------------------------|----------------|
| **New user, want to get started quickly** | [Role Classification](#classification-by-work-role) → [Learning Path](#learning-path) | 15 minutes |
| **Have specific tasks to complete** | [Task Type Classification](#classification-by-task-type) → [Solutions](#solutions) | 10 minutes |
| **Different project stage requirements** | [Project Stage Classification](#classification-by-project-stage) → [Recommended Configuration](#recommended-configuration) | 8 minutes |
| **Encountered problems and need help** | [Quick Problem Resolution](#quick-problem-resolution) | 5 minutes |
| **Looking for best practice examples** | [Success Stories](#success-stories) | 10 minutes |

## Document Index

### [Classification by Work Role](#classification-by-work-role)
- [Frontend Developer](#frontend-developer) - Component development, UI debugging, responsive design
- [Backend Developer](#backend-developer) - API design, database operations, system integration  
- [Data Analyst](#data-analyst) - Data cleaning, statistical analysis, visualization
- [DevOps Engineer](#devops-engineer) - Automated deployment, monitoring and alerting

### [Classification by Task Type](#classification-by-task-type)
- [Code Analysis and Refactoring](#code-analysis-and-refactoring) - Understanding code structure, finding issues
- [Feature Development](#feature-development) - From requirements to complete feature implementation
- [Problem Debugging](#problem-debugging) - Quickly locate and fix bugs
- [Learning New Technologies](#learning-new-technologies) - Learning programming languages, frameworks, or tools

### [Classification by Project Stage](#classification-by-project-stage)  
- [Project Initiation Stage](#project-initiation-stage) - Technology selection, architecture design
- [Development Stage](#development-stage) - Feature implementation, code review
- [Testing Stage](#testing-stage) - Functional testing, performance testing
- [Deployment Stage](#deployment-stage) - Environment configuration, deployment automation

### [Quick Problem Resolution](#quick-problem-resolution)
- [Don't know where to start](#i-dont-know-where-to-start)
- [Features are insufficient, need more tools](#features-are-insufficient-need-more-tools) 
- [Low efficiency, want better workflow](#low-efficiency-want-better-workflow)

### [Success Stories](#success-stories)
- [Web Development Team Efficiency Improvement](#case-1-web-development-team-efficiency-improvement)
- [Data Analysis Workflow Optimization](#case-2-data-analysis-workflow-optimization)
- [DevOps Automation Upgrade](#case-3-devops-automation-upgrade)

## Classification by Work Role

### Frontend Developer

> **Applicable Scenarios**: Component development, UI debugging, responsive design, performance optimization  
> **Tech Stack**: React, Vue, Angular, CSS, HTML, JavaScript/TypeScript  
> **Estimated Learning Time**: 75 minutes

#### Quick Start Process
```bash
# 1. Project initialization
cd my-react-project
iflow
> /init

# 2. Install frontend-related MCP tools
!iflow mcp add-json 'playwright' '{"command":"npx","args":["-y","@iflow-mcp/playwright-mcp"]}'

# 3. Common task examples
> Create a responsive user card component with dark mode support
> Help me optimize the rendering performance of this React component
> Analyze accessibility issues on the current page
```

#### Recommended Configuration
- **Core Features**: [Interactive Mode Image Processing](./features/interactive#image-interaction-features)
- **Essential Tools**: Playwright MCP (UI testing), Image Tools MCP (image processing)
- **Workflow**: Screenshot analysis → Code generation → Automated testing

#### Learning Path
1. [Quick Start](./quickstart) → [Basic Usage](./examples/basic-usage) (20 minutes)
2. [Interactive Mode](./features/interactive) → [MCP Extensions](./examples/mcp) (30 minutes)
3. [Best Practices](./examples/best-practices) (20 minutes)

---

### Backend Developer

> **Applicable Scenarios**: API design, database operations, performance optimization, system integration  
> **Tech Stack**: Node.js, Python, Java, Go, databases, microservices architecture  
> **Estimated Learning Time**: 75 minutes

#### Quick Start Process
```bash
# 1. API project analysis
cd my-api-project
iflow
> /init
> Analyze the architecture of this API project and generate interface documentation

# 2. Database-related operations
> Design user table structure based on business requirements
> Optimize the performance of this SQL query
> Generate database migration scripts
```

#### Recommended Configuration
- **Core Features**: [Shell Command Integration](./examples/basic-usage#shell-command-execution)
- **Essential Tools**: Database MCP, Git Helper MCP, System Monitor MCP
- **Workflow**: Code analysis → Architecture design → Test verification

#### Learning Path
1. [Quick Start](./quickstart) → [Basic Usage](./examples/basic-usage) (20 minutes)
2. [MCP Extensions](./examples/mcp) → [Sub-agent Configuration](./examples/subagent) (40 minutes)
3. [Advanced Configuration](./configuration/settings) (15 minutes)

---

### Data Analyst

> **Applicable Scenarios**: Data cleaning, statistical analysis, visualization, report generation  
> **Tech Stack**: Python, R, SQL, Jupyter, Excel, Tableau, Power BI  
> **Estimated Learning Time**: 60 minutes

#### Quick Start Process
```bash
# 1. Data file analysis
iflow
> @data/sales_2024.csv Analyze this sales data and identify main trends
> Generate Python script for monthly sales reports
> Create interactive data visualization charts
```

#### Recommended Configuration
- **Core Features**: [File Reference Processing](./features/interactive#file-reference-features)
- **Essential Tools**: Excel Processor MCP, PDF Tools MCP, Image Tools MCP
- **Workflow**: Data import → Analysis processing → Visualization → Report generation

#### Learning Path
1. [Quick Start](./quickstart) → [Interactive Mode](./features/interactive) (25 minutes)
2. [MCP Extensions](./examples/mcp) (20 minutes)
3. [Best Practices](./examples/best-practices) (15 minutes)

---

### DevOps Engineer

> **Applicable Scenarios**: Automated deployment, monitoring and alerting, infrastructure management  
> **Tech Stack**: Docker, Kubernetes, CI/CD, monitoring tools, cloud platforms  
> **Estimated Learning Time**: 70 minutes

#### Quick Start Process
```bash
# 1. Deployment script optimization
iflow
> Analyze existing Docker configuration and provide optimization suggestions
> Create CI/CD pipeline configuration
> Design monitoring and alerting strategies
```

#### Recommended Configuration
- **Core Features**: [Shell Command Execution](./examples/basic-usage#shell-command-execution)
- **Essential Tools**: System Monitor MCP, Network Tools MCP, Git Helper MCP
- **Workflow**: Environment analysis → Script generation → Automated deployment → Monitoring configuration

#### Learning Path
1. [Quick Start](./quickstart) → [Basic Usage](./examples/basic-usage) (20 minutes)
2. [MCP Extensions](./examples/mcp) → [Observability Features](./features/telemetry) (30 minutes)
3. [Best Practices](./examples/best-practices) (20 minutes)

## Classification by Task Type

### Code Analysis and Refactoring

#### Scenario Description
Need to understand existing code structure, identify issues, and perform refactoring optimization

#### Solutions
```bash
# Comprehensive project analysis
iflow
> /init
> Analyze technical debt and potential issues in this project
> Suggest refactoring strategies and priorities

# Specific code analysis
> @src/components/UserProfile.tsx What can be optimized in this component?
> Check the entire project for security vulnerabilities
```

#### Related Documentation
- [Project Initialization](./examples/basic-usage#initialization-commands)
- [File References](./features/interactive#file-reference-features)
- [Best Practices](./examples/best-practices)

---

### Feature Development

#### Scenario Description
From requirements to complete implementation of a new feature

#### Solutions
```bash
# Requirements analysis
iflow
> I need to implement a user authentication system, including registration, login, and password reset features

# Step-by-step implementation
> Design database table structure
> Generate backend API interfaces
> Create frontend components
> Write test cases
```

#### Related Documentation
- [MCP Extensions](./examples/mcp) - Connect databases and testing tools
- [Sub-agent Configuration](./examples/subagent) - Specialized development assistants
- [Checkpointing Features](./features/checkpointing) - Save development progress

---

### Problem Debugging

#### Scenario Description
Code has bugs, need to quickly locate and fix issues

#### Solutions
```bash
# Error information analysis
iflow
> !npm test  # Run tests to see errors
> What does this error message mean, and how to fix it?

# Log analysis
> @logs/error.log Analyze this error log and find the root cause
> Provide solutions and preventive measures
```

#### Related Documentation
- [Shell Command Execution](./examples/basic-usage#shell-command-execution)
- [Best Practices](./examples/best-practices#error-handling-best-practices)

---

### Learning New Technologies

#### Scenario Description
Learning new programming languages, frameworks, or tools

#### Solutions
```bash
# Technology learning
iflow
> I want to learn React Hooks, please give me a complete learning plan
> Explain what Docker is and provide practical examples
> Compare the pros and cons of Vue and React
```

#### Related Documentation
- [Interactive Mode](./features/interactive) - Multiple learning approaches
- [MCP Extensions](./examples/mcp) - Connect learning resources
- [Sub-agent Configuration](./examples/subagent) - Professional tutor assistants

## Classification by Project Stage

### Project Initiation Stage

**Main Tasks**: Technology selection, architecture design, environment setup

```bash
# Technology stack analysis
iflow
> I want to develop an e-commerce website, help me analyze technology stack choices
> Compare the pros and cons of different frontend frameworks
> Design overall system architecture

# Project scaffolding
> Create a React + TypeScript + Vite project template
> Configure ESLint and Prettier
> Set up CI/CD pipeline
```

**Recommended Configuration**: Basic features + MCP extensions

---

### Development Stage

**Main Tasks**: Feature implementation, code review, issue fixing

```bash
# Feature development
iflow
> Implement user login functionality
> Create product list component
> Integrate payment interface

# Code optimization
> Review the performance of this function
> Refactor duplicate code
> Add unit tests
```

**Recommended Configuration**: Complete features + specialized agents

---

### Testing Stage

**Main Tasks**: Functional testing, performance testing, security testing

```bash
# Test automation
iflow
> Generate API interface test cases
> Create E2E test scripts
> Analyze performance bottlenecks

# Security checks
> Check for security vulnerabilities in code
> Validate user input handling
> Analyze dependency package security
```

**Recommended Configuration**: MCP testing tools + security agents

---

### Deployment Stage

**Main Tasks**: Environment configuration, deployment automation, monitoring and alerting

```bash
# Deployment configuration
iflow
> Generate Docker configuration files
> Create Kubernetes deployment scripts
> Configure monitoring and alerting rules

# Operations scripts
> Create database backup scripts
> Set up log rotation configuration
> Write health check interfaces
```

**Recommended Configuration**: DevOps tools + system monitoring

## Quick Problem Resolution

### "I don't know where to start"

> **Problem Symptoms**: Installed iFlow CLI but don't know how to use it or where to start learning  
> **Resolution Time**: 10 minutes

**Immediate Actions**:
1. **Quick Experience**: Run `iflow` then enter `> Hello, help me analyze the current directory`
2. **Identify Your Role**: Find your role in the [Classification by Work Role](#classification-by-work-role) above
3. **Follow Guidelines**: Start practicing according to the "Quick Start Process" for your role

**Further Learning**: [5-minute Quick Start](./quickstart) → [Basic Usage](./examples/basic-usage)

### "Features are insufficient, need more tools"

> **Problem Symptoms**: Basic features cannot meet work requirements, need to connect databases, process files, etc.  
> **Resolution Time**: 15 minutes

**Immediate Actions**:
1. **Understand MCP System**: Read [MCP Extension System](./examples/mcp) to learn about available tools
2. **Install Necessary Tools**: Install recommended MCP tools based on your role
3. **Configure Professional Assistants**: Set up [Specialized Sub-agents](./examples/subagent) to enhance professional capabilities

**Common Tool Recommendations**:
- Frontend: Playwright MCP (UI testing), Image Tools MCP (image processing)
- Backend: Database MCP, Git Helper MCP, System Monitor MCP  
- Data: Excel Processor MCP, PDF Tools MCP
- Operations: System Monitor MCP, Network Tools MCP

### "Low efficiency, want better workflow"

> **Problem Symptoms**: Can use it but efficiency is low, many repetitive operations, no standardized process  
> **Resolution Time**: 20 minutes

**Immediate Actions**:
1. **Learn Best Practices**: Read [Best Practices Guide](./examples/best-practices)
2. **Optimize Configuration**: Refer to [Advanced Settings](./configuration/settings) to adjust performance
3. **Establish Standards**: Create iFlow CLI usage standards for your team

**Efficiency Enhancement Tips**:
- Use `/init` to establish project context and reduce repetitive explanations
- Configure commonly used MCP tools to avoid repeated installations
- Establish code templates and shortcuts for common commands

### "Encountered errors or technical issues"

> **Problem Symptoms**: Command execution failures, connection exceptions, features not working  
> **Resolution Time**: 5-10 minutes

**Immediates**:
1. **Check Basic Environment**: Confirm network connection and API key are correct
2. **Review Error Information**: Copy complete error information for iFlow CLI analysis
3. **Restart and Retry**: Use `/clear` to clear context and retry

**Get Help**:
- [Glossary](./glossary) - Look up technical terms
- [GitHub Issues](https://github.com/iflow-ai/iflow-cli/issues) - Report problems
- [Community Discussions](https://github.com/iflow-ai/iflow-cli/discussions) - Experience sharing

**Common Problem Checklist**:
- Is the API key correctly set?
- Can the network access normally?
- Are you using the latest version?

## Success Stories

### Case 1: Web Development Team Efficiency Improvement

**Background**: 5-person React development team with time-consuming code reviews and many repetitive tasks

**Solution**:
- Unified configuration of iFlow CLI + Code Review agents
- Established code templates and best practices documentation
- Automated testing and deployment processes

**Results**: Code review time reduced by 60%, bug rate decreased by 40%

### Case 2: Data Analysis Workflow Optimization

**Background**: Data analysts need to process various data formats, and report generation is cumbersome

**Solution**:
- Configured Excel/PDF processing MCP tools
- Created report generation templates
- Established standardized data processing workflows

**Results**: Report generation time reduced by 70%, analysis accuracy improved

### Case 3: DevOps Automation Upgrade

**Background**: Operations team has many manual operations, deployments prone to errors

**Solution**:
- Deployed System Monitor and Network Tools
- Created standardized deployment scripts
- Established monitoring and alerting system

**Results**: Deployment success rate improved to 99%, incident response time reduced by 50%

---

## Next Learning Suggestions

### Choose Based on Your Current Status

**Just Getting Started**:
1. Complete [Quick Start](./quickstart) basic setup
2. Choose your role and follow the corresponding "Quick Start Process"
3. Try a simple real project

**Want to Improve Efficiency**:
1. Learn [Best Practices](./examples/best-practices)
2. Configure [MCP Extension System](./examples/mcp)
3. Set up [Specialized Sub-agents](./examples/subagent)

**Team Usage**:
1. Establish team usage standards
2. Create shared configurations and templates
3. Share successful experiences and best practices

**Advanced Usage**:
1. Explore [Advanced Configuration](./configuration/settings)
2. Participate in [Community Discussions](https://github.com/iflow-ai/iflow-cli/discussions)
3. Contribute your usage experience and improvement suggestions

### Additional Resources

- **Complete Documentation**: [Documentation Index](./examples/index.md) - View detailed descriptions of all features
- **Best Practices**: [Practice Guide](./examples/best-practices) - Learn efficient usage techniques  
- **Configuration Guide**: [Settings Instructions](./configuration/settings) - Personalized customization
- **Problem Help**: [Glossary](./glossary) - Look up technical terms
- **Community Exchange**: [GitHub Discussions](https://github.com/iflow-ai/iflow-cli/discussions) - Experience sharing
- **Issue Feedback**: [GitHub Issues](https://github.com/iflow-ai/iflow-cli/issues) - Report problems

---

> **Tip**: This document is continuously updated. We recommend bookmarking it for easy reference. If you have good use cases or suggestions, feel free to share them with the community through GitHub!