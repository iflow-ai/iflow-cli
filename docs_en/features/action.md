---
sidebar_position: 7
hide_title: true
---

# GitHub Actions

[iflow-cli-action](https://github.com/marketplace/actions/iflow-cli-action) provides automated workflow integration capabilities based on [GitHub Actions](https://docs.github.com/en/actions/get-started/quickstart). With it, you can integrate iFLOW CLI's AI capabilities into GitHub repositories within minutes, using AI to drive any custom automation workflows.

[View on GitHub Actions Marketplace](https://github.com/marketplace/actions/iflow-cli-action)

## Quick Start

1. Get your iFLOW CLI API access key from the [iFlow profile settings page](https://iflow.cn/?open=setting).
2. Add the access key as a GitHub repository secret (Settings -> Secrets and variables -> Actions -> New repository secret, with the secret name `IFLOW_API_KEY`), 👉🏻[Learn how to use GitHub repository secrets](https://docs.github.com/en/actions/how-tos/write-workflows/choose-what-workflows-do/use-secrets)).
3. Create a `.github/workflows/issue-triage.yml` file in your code repository and add the following content:

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

This is a workflow that uses iFLOW CLI Action to identify GitHub issues content and automatically perform tagging classification. Once a new issue is created in your code repository, this workflow will automatically execute. You can also trigger this workflow by commenting `@iflow-cli /triage` in an issue.

## More Example Use Cases

[Examples](https://github.com/iflow-ai/iflow-cli-action/tree/main/examples) provides complete automated workflow orchestration files based on GitHub issues and GitHub Pull Requests, which you can directly copy to your code repository's `.github/workflows` directory for immediate use.

## Best Practices

### IFLOW.md

Create an IFLOW.md file in your repository root to define code style guidelines, code review standards, and project-specific rules. This file will guide iFLOW CLI to understand your project standards.

### Security Considerations

**Never commit API keys to your code repository!**

Always use GitHub secrets (e.g., `${{ secrets.IFLOW_API_KEY }}`) instead of hardcoding iFLOW CLI's API keys directly in workflow files.

### GitHub Actions Usage Costs

GitHub Actions has different free quotas for personal and organization accounts. For details, please refer to the [GitHub Actions billing documentation](https://docs.github.com/en/billing/concepts/product-billing/github-actions).

## Community Use Cases

- [Rapidly boost your productivity with iflow-cli-action on GitHub alongside Qwen3-Coder and Kimi K2](https://shan333.cn/2025/08/16/the-next-level-of-developer-productivity-with-iflow-cli-action/)

> Welcome to submit your use cases
