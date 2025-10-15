---
sidebar_position: 7
hide_title: true
---

# GitHub Actions

[iflow-cli-action](https://github.com/marketplace/actions/iflow-cli-action) 提供了基于 [GitHub Actions](https://docs.github.com/zh/actions/get-started/quickstart) 的自动化工作流集成能力. 使用它, 您可以几分钟内将 iFLOW CLI 的 AI 能力集成到 GitHub 代码库中, 使用 AI 去驱动任意自定义的自动化工作流程.

[在 GitHub Actions 市场上查看](https://github.com/marketplace/actions/iflow-cli-action)

## 快速开始

1. 在 [心流个人资料获取页面](https://iflow.cn/?open=setting) 获取您的 iFLOW CLI API 访问密钥.
2. 将访问密钥以 GitHub 仓库密钥的形式添加到您的代码仓库中  (Settings -> Secrets and variables -> Actions -> New repository secret, Secret 密钥名为 `IFLOW_API_KEY`), 👉🏻[了解如何使用 GitHub 仓库密钥](https://docs.github.com/zh/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets)).
3. 在您的代码仓库中创建 `.github/workflows/issue-triage.yml` 文件, 并添加以下内容:

```yaml
name: '🏷️ iFLOW CLI Automated Issue Triage'

on:
  issues:
    types:
      - 'opened'
      - 'reopened'
  issue_comment:
    types:
      - 'created'
  workflow_dispatch:
    inputs:
      issue_number:
        description: 'issue number to triage'
        required: true
        type: 'number'

concurrency:
  group: '${{ github.workflow }}-${{ github.event.issue.number }}'
  cancel-in-progress: true

defaults:
  run:
    shell: 'bash'

permissions:
  contents: 'read'
  issues: 'write'
  statuses: 'write'

jobs:
  triage-issue:
    if: |-
      github.event_name == 'issues' ||
      github.event_name == 'workflow_dispatch' ||
      (
        github.event_name == 'issue_comment' &&
        contains(github.event.comment.body, '@iflow-cli /triage') &&
        contains(fromJSON('["OWNER", "MEMBER", "COLLABORATOR"]'), github.event.comment.author_association)
      )
    timeout-minutes: 5
    runs-on: 'ubuntu-latest'
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: 'Run iFlow CLI Issue Triage'
        uses: vibe-ideas/iflow-cli-action@main
        id: 'iflow_cli_issue_triage'
        env:
          GITHUB_TOKEN: '${{ secrets.GITHUB_TOKEN }}'
          ISSUE_TITLE: '${{ github.event.issue.title }}'
          ISSUE_BODY: '${{ github.event.issue.body }}'
          ISSUE_NUMBER: '${{ github.event.issue.number }}'
          REPOSITORY: '${{ github.repository }}'
        with:
          api_key: ${{ secrets.IFLOW_API_KEY }}
          timeout: "3600"
          extra_args: "--debug"
          prompt: |
            ## Role

            You are an issue triage assistant. Analyze the current GitHub issue
            and apply the most appropriate existing labels. Use the available
            tools to gather information; do not ask for information to be
            provided.

            ## Steps

            1. Run: `gh label list` to get all available labels.
            2. Review the issue title and body provided in the environment
               variables: "${ISSUE_TITLE}" and "${ISSUE_BODY}".
            3. Classify issues by their kind (bug, enhancement, documentation,
               cleanup, etc) and their priority (p0, p1, p2, p3). Set the
               labels according to the format `kind/*` and `priority/*` patterns.
            4. Apply the selected labels to this issue using:
               `gh issue edit "${ISSUE_NUMBER}" --add-label "label1,label2"`
            5. If the "status/needs-triage" label is present, remove it using:
               `gh issue edit "${ISSUE_NUMBER}" --remove-label "status/needs-triage"`

            ## Guidelines

            - Only use labels that already exist in the repository
            - Do not add comments or modify the issue content
            - Triage only the current issue
            - Assign all applicable labels based on the issue content
            - Reference all shell variables as "${VAR}" (with quotes and braces)

      - name: 'Post Issue Triage Failure Comment'
        if: |-
          ${{ failure() && steps.iflow_cli_issue_triage.outcome == 'failure' }}
        uses: 'actions/github-script@60a0d83039c74a4aee543508d2ffcb1c3799cdea'
        with:
          github-token: '${{ secrets.GITHUB_TOKEN }}'
          script: |-
            github.rest.issues.createComment({
              owner: '${{ github.repository }}'.split('/')[0],
              repo: '${{ github.repository }}'.split('/')[1],
              issue_number: '${{ github.event.issue.number }}',
              body: 'There is a problem with the iFlow CLI issue triaging. Please check the [action logs](${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}) for details.'
            })
```

这是一个利用 iFLOW CLI Action 对 GitHub issues 内容进行识别, 然后进行自动打标签分类的工作流程, 一但您的代码仓库中有新的 issue 创建, 改工作流就会自动执行. 您也可以 issue 中评论回复 `@iflow-cli /triage` 即可触发该工作流.

## 更多示例使用场景

[Examples](https://github.com/iflow-ai/iflow-cli-action/tree/main/examples) 中提供了完整基于 GitHub issues、GitHub Pull Requests 的自动化工作流程编排文件, 您可以直接拷贝到您代码仓库的 `.github/workflows` 目录中直接使用.

## 最佳实践

### IFLOW.md

在您的仓库根目录中创建一个 IFLOW.md 文件来定义代码风格指南、代码评审标准、项目特定规则。此文件将指导 iFLOW CLI 理解您的项目标准。

### 安全考虑

**永远不要将 API 密钥提交到代码仓库中!**

始终使用 GitHub 密钥（例如, `${{ secrets.IFLOW_API_KEY }}`）而不是在工作流程文件中直接硬编码 iFLOW CLI 的 API 密钥。

### GitHub Actions 使用成本

GitHub Actions 对于个人账号和组织账号均有不同的免费额度, 详情请查阅 [GitHub Actions 的计费文档](https://docs.github.com/zh/billing/concepts/product-billing/github-actions).

## 社区使用案例

- [使用 iflow-cli-action 在 GitHub 与 Qwen3-Coder、Kimi K2 一起快速提升你的生产力](https://shan333.cn/2025/08/16/the-next-level-of-developer-productivity-with-iflow-cli-action/)

> 欢迎提交您的使用案例
