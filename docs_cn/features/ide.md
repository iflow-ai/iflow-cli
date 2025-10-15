---
sidebar_position: 5
hide_title: true
---

# 添加到您的 IDE
了解如何将 iFlow 添加到您喜爱的 IDE

iFlow 无缝集成于流行的集成开发环境（IDE），以增强您的编码工作流程。此集成允许您在您首选的开发环境中直接利用 iFlow 的功能。

## 支持的 IDE
iFlow 目前支持两个主要的 IDE 系列：

- **Visual Studio Code**
  - [下载 iFlow VSCode 插件](https://marketplace.visualstudio.com/items?itemName=iflow-cli.iflow-cli-vscode-ide-companion)
  - [下载类 VSCode 编辑器插件](https://open-vsx.org/extension/iflow-cli/iflow-cli-vscode-ide-companion)
  - 需要 VSCode 1.101.0 或更高版本
- **JetBrains IDEs**
  - [下载 iFlow JetBrains 插件](https://cloud.iflow.cn/iflow-cli/iflow-idea-0.0.2.zip)
  - 仅支持 2024.1 及以后版本

- **Zed**
  - 需要zed 0.201.0版本以上
# 功能
- **快速启动：** 点击 UI 中的 iFlow 按钮  
  
  <img src="https://img.alicdn.com/imgextra/i2/O1CN01BimMnx1rjXaZ397V3_!!6000000005667-2-tps-1038-632.png"/>

- **选择上下文：** 编辑器中选定的文本将自动添加到 iFlow 的上下文中

  <img src="https://img.alicdn.com/imgextra/i3/O1CN01awbx1X1UaciN8jiqC_!!6000000002534-2-tps-2086-748.png"/>

- **文件感知：** iFlow 可以看到您在编辑器中打开了哪些文件

  <img src="https://img.alicdn.com/imgextra/i1/O1CN01CnqGw01pzuVt2hTdI_!!6000000005432-2-tps-2084-742.png"/>


- **连接感知：** 当您在 VSCode 的终端中启动 iFlow 时，iFlow 会自动检测并连接。当连接成功后，iFlow 会在您的终端中显示连接状态"IDE connected"。您也可使用 iFlow 提供的命令"/ide"来手动建立连接

  <img src="https://img.alicdn.com/imgextra/i4/O1CN01qVatHO1tHGMhwmN5x_!!6000000005876-2-tps-1867-211.png"/>

    <img src="https://img.alicdn.com/imgextra/i4/O1CN01466HGN1zPP6KYrGbW_!!6000000006706-2-tps-1803-582.png"/>
- **关闭连接：** 若您需要关闭连接，请使用 iFlow 提供的命令"/ide"，并选择"Disconnect from IDE"

# 安装
## VS Code
1. 打开 VSCode 请注意版本号至少是 1.101.0
2. 打开插件市场，搜索 iflow
![](https://img.alicdn.com/imgextra/i1/O1CN018iVhu61NQovjykS9w_!!6000000001565-2-tps-762-304.png)
3. 点击安装 iFlow CLI 即可
    
> :bulb: **提示：** 当您在 VSCode 的终端中启动 iFlow 时，它会自动检测并安装扩展，注意：此功能需要您安装 iflow-cli-vscode-ide-companion-0.1.7及以上版本，若您安装的版本为iflow-cli-vscode-ide-companion-0.1.6级以下，则需要您手动安装。

## JetBrains IDE
1. 打开 JetBrains IDE, 注意仅支持2024.1及以后版本
2. 打开插件市场
3. 安装iFlow

- 点击 JetBrains IDE 顶部右侧的设置图标，打开插件市场

- 搜索iflow
  <img src="https://img.alicdn.com/imgextra/i4/O1CN01IkFru21kLzvI66OBO_!!6000000004668-2-tps-1824-1400.png"/>

- 也可以选择从磁盘安装

<img src="https://img.alicdn.com/imgextra/i2/O1CN01SnJDgE1iMnNVVMTTy_!!6000000004399-2-tps-806-778.png"/>
  <img src="https://img.alicdn.com/imgextra/i2/O1CN01Qy3p2o1hcXNKAoIZ5_!!6000000004298-2-tps-1410-662.png" />

- 选择 iflow-idea-最新版本号.zip 安装包，安装包在文档上方有对应的下载链接

  <img src="https://img.alicdn.com/imgextra/i3/O1CN01Xe4tWg1e59ezJfMgZ_!!6000000003819-2-tps-2268-1156.png" />

- 重启ide

  <img src="https://img.alicdn.com/imgextra/i3/O1CN01P7G7MR25EJCZi8BYT_!!6000000007494-2-tps-1324-742.png" />

## Zed 编辑器
1. 打开zed，版本号至少是0.201.0
2. 点击个人头像，选择Settings
<img src="https://intranetproxy.alipay.com/skylark/lark/0/2025/png/21956389/1757998662129-7ee9c926-1920-4afc-b75a-15282f3440b0.png?x-oss-process=image%2Fformat%2Cwebp" />
3. 配置iflow
```bash
"agent_servers": {
    "iFlow CLI": {
      "command": "iflow",
      "args": ["--experimental-acp"]
    }
  }
```
<img src="https://intranetproxy.alipay.com/skylark/lark/0/2025/png/21956389/1757998738785-b37c17cf-6922-476e-8ad7-157ce1da6121.png?x-oss-process=image%2Fformat%2Cwebp" />
4. 右下角点击agent panel
<img src="https://intranetproxy.alipay.com/skylark/lark/0/2025/png/21956389/1757998696212-5380ea30-6419-479d-a5cf-3a528407fad8.png?x-oss-process=image%2Fformat%2Cwebp" />
5. 创建iFlow CLI对话
<img src="https://intranetproxy.alipay.com/skylark/lark/0/2025/png/21956389/1757998709856-83e955e5-a793-449c-9f8b-b172e41e937e.png?x-oss-process=image%2Fformat%2Cwebp" />
6. 接下来就可以在输入框对话了

