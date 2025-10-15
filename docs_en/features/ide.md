---
sidebar_position: 5
hide_title: true
---

# Add to your IDE
Learn how to add iFlow to your favorite IDE

iFlow seamlessly integrates with popular Integrated Development Environments (IDEs) to enhance your coding workflow. This integration allows you to directly leverage iFlow's capabilities within your preferred development environment.

## Supported IDEs
iFlow currently supports two major IDE families:

- **Visual Studio Code**
  - [Download iFlow VSCode Plugin](https://marketplace.visualstudio.com/items?itemName=iflow-cli.iflow-cli-vscode-ide-companion)
  - [Download iFlow VSCode-like editor plugins](https://open-vsx.org/extension/iflow-cli/iflow-cli-vscode-ide-companion)
  - Requires VSCode 1.101.0 or higher
- **JetBrains IDEs**
  - [Download iFlow JetBrains Plugin](https://cloud.iflow.cn/iflow-cli/iflow-idea-0.0.2.zip)
  - Only supports version 2024.1 and later

- **Zed**
  - Requires Zed version 0.201.0 or higher

# Features
- **Quick Launch:** Click the iFlow button in the UI  
  
  <img src="https://img.alicdn.com/imgextra/i2/O1CN01BimMnx1rjXaZ397V3_!!6000000005667-2-tps-1038-632.png"/>

- **Context Selection:** Selected text in the editor will automatically be added to iFlow's context

  <img src="https://img.alicdn.com/imgextra/i3/O1CN01awbx1X1UaciN8jiqC_!!6000000002534-2-tps-2086-748.png"/>

- **File Awareness:** iFlow can see which files you have open in the editor

  <img src="https://img.alicdn.com/imgextra/i1/O1CN01CnqGw01pzuVt2hTdI_!!6000000005432-2-tps-2084-742.png"/>


- **Connection Awareness:** When you start iFlow in VSCode's terminal, iFlow will automatically detect and connect. When the connection is successful, iFlow will display the connection status "IDE connected" in your terminal. You can also use the iFlow command "/ide" to manually establish a connection

  <img src="https://img.alicdn.com/imgextra/i4/O1CN01qVatHO1tHGMhwmN5x_!!6000000005876-2-tps-1867-211.png"/>

    <img src="https://img.alicdn.com/imgextra/i4/O1CN01466HGN1zPP6KYrGbW_!!6000000006706-2-tps-1803-582.png"/>
- **Close Connection:** If you need to close the connection, use the iFlow command "/ide" and select "Disconnect from IDE"

# Installation
## VS Code
1. Open VSCode (please note that the version must be at least 1.101.0)
2. Open the extension marketplace and search for "iflow"
![](https://img.alicdn.com/imgextra/i1/O1CN018iVhu61NQovjykS9w_!!6000000001565-2-tps-762-304.png)
3. Click to install iFlow CLI
    
> :bulb: **Tip:** When you start iFlow in VSCode's terminal, it will automatically detect and install the extension. Note: This feature requires you to install iflow-cli-vscode-ide-companion-0.1.7 or higher. If your installed version is iflow-cli-vscode-ide-companion-0.1.6 or lower, you need to install manually.

## JetBrains IDE
1. Open JetBrains IDE (note that only version 2024.1 and later are supported)
2. Open plugin marketplace
3. Install iFlow

- Click the settings icon at the top right of JetBrains IDE to open the plugin marketplace

- Search for iflow
  <img src="https://img.alicdn.com/imgextra/i4/O1CN01IkFru21kLzvI66OBO_!!6000000004668-2-tps-1824-1400.png"/>

- You can also select Install from Disk

<img src="https://img.alicdn.com/imgextra/i2/O1CN01SnJDgE1iMnNVVMTTy_!!6000000004399-2-tps-806-778.png"/>

  <img src="https://img.alicdn.com/imgextra/i2/O1CN01Qy3p2o1hcXNKAoIZ5_!!6000000004298-2-tps-1410-662.png" />

- Select the iflow-idea-latest-version.zip installation package, the installation package has corresponding download links in the documentation above

  <img src="https://img.alicdn.com/imgextra/i3/O1CN01Xe4tWg1e59ezJfMgZ_!!6000000003819-2-tps-2268-1156.png" />

- Restart IDE

  <img src="https://img.alicdn.com/imgextra/i3/O1CN01P7G7MR25EJCZi8BYT_!!6000000007494-2-tps-1324-742.png" />

## Zed Editor
1. Open Zed (version must be at least 0.201.0)
2. Click on your profile avatar and select Settings
<img src="https://intranetproxy.alipay.com/skylark/lark/0/2025/png/21956389/1757998662129-7ee9c926-1920-4afc-b75a-15282f3440b0.png?x-oss-process=image%2Fformat%2Cwebp" />
3. Configure iFlow
```bash
"agent_servers": {
    "iFlow CLI": {
      "command": "iflow",
      "args": ["--experimental-acp"]
    }
  }
```
<img src="https://intranetproxy.alipay.com/skylark/lark/0/2025/png/21956389/1757998738785-b37c17cf-6922-476e-8ad7-157ce1da6121.png?x-oss-process=image%2Fformat%2Cwebp" />
4. Click the agent panel in the bottom right corner
<img src="https://intranetproxy.alipay.com/skylark/lark/0/2025/png/21956389/1757998696212-5380ea30-6419-479d-a5cf-3a528407fad8.png?x-oss-process=image%2Fformat%2Cwebp" />
5. Create an iFlow CLI conversation
<img src="https://intranetproxy.alipay.com/skylark/lark/0/2025/png/21956389/1757998709856-83e955e5-a793-449c-9f8b-b172e41e937e.png?x-oss-process=image%2Fformat%2Cwebp" />
6. You can now start chatting in the input box
