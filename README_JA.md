# 🤖 iFlow CLI

[![Awesome Gemini CLI で紹介](https://awesome.re/mentioned-badge.svg)](https://github.com/Piebald-AI/awesome-gemini-cli)

![iFlow CLI Screenshot](./assets/iflow-cli.jpg)

[English](README.md) | [中文](README_CN.md) | **日本語** | [한국어](README_KO.md) | [Français](README_FR.md) | [Deutsch](README_DE.md) | [Español](README_ES.md) | [Русский](README_RU.md)

iFlow CLIは、ターミナル上で直接動作する強力なAIアシスタントです。コードリポジトリの分析、コーディングタスクの実行、コンテキストに応じたニーズの理解を行い、シンプルなファイル操作から複雑なワークフローまでを自動化することで生産性を大幅に向上させます。

[その他のチュートリアル](https://platform.iflow.cn/)

## ✨ 主な機能

1. **無料のAIモデル**: [iFlowオープンプラットフォーム](https://platform.iflow.cn/docs/api-mode)を通じて、Kimi K2、Qwen3 Coder、DeepSeek v3などの強力で無料のAIモデルにアクセス可能
2. **柔軟な統合**: お気に入りの開発ツールを維持しながら、既存システムに統合して自動化を実現
3. **自然言語インタラクション**: 複雑なコマンドとはおさらば、日常会話でAIを駆動し、コード開発から日常のアシスタントまで対応
4. **オープンプラットフォーム**: [iFlowオープンマーケット](https://platform.iflow.cn/)からSubAgentとMCPをワンクリックでインストール、インテリジェントエージェントを素早く拡張し、あなただけのAIチームを構築

## 機能対比
| 機能 | iFlow Cli | Claude Code | Gemini Cli |
|------|-----------|-------------|------------|
| Todo計画 | ✅ | ✅ | ❌ |
| SubAgent | ✅ | ✅ | ❌ |
| カスタムコマンド | ✅ | ✅ | ✅ |
| プランモード | ✅ | ✅ | ❌ |
| タスクツール | ✅ | ✅ | ❌ |
| VS Code プラグイン | ✅ | ✅ | ✅ |
| JetBrains プラグイン | ✅ | ✅ | ❌ |
| 会話復元 | ✅ | ✅ | ❌ |
| 内蔵オープンマーケット | ✅ | ❌ | ❌ |
| メモリ自動圧縮 | ✅ | ✅ | ✅ |
| マルチモーダル機能 | ✅ | ⚠️（中国国内モデル非対応） | ⚠️（中国国内モデル非対応） |
| 検索 | ✅ | ❌ | ⚠️（VPN必要） |
| 無料 | ✅ | ❌ | ⚠️（使用制限あり） |
| Hook | ✅ | ✅ | ❌ |
| 出力スタイル | ✅ | ✅ | ❌ |
| 思考 | ✅ | ✅ | ❌ |
| ワークフロー | ✅ | ❌ | ❌ |
| SDK | ✅ | ✅ | ❌ |
| ACP | ✅ | ✅ | ✅ |

## ⭐ 重要機能
* 4つの実行モードをサポート：yolo（モデルに最大権限、すべての操作を実行可能）、accepting edits（モデルにファイル変更権限のみ）、plan mode（計画してから実行）、default（モデルに権限なし）
* subAgent機能のアップグレード：CLIを汎用アシスタントから専門チームに進化させ、より専門的で正確なアドバイスを提供。/agentでより多くの事前設定されたエージェントを確認
* taskツールのアップグレード：コンテキスト長を効果的に圧縮し、CLIがより深くタスクを完了できるように。コンテキストが70%に達すると自動圧縮
* iFlowオープンマーケットとの統合：便利なMCPツール、Subagent、カスタム指示、ワークフローを迅速にインストール
* 無料マルチモーダルモデル使用：CLIで画像も貼り付け可能（Ctrl+Vで画像貼り付け）
* 会話履歴保存・ロールバック機能（iflow --resumeと/chatコマンド）
* より便利なターミナルコマンドをサポート（iflow -hでより多くのコマンドを確認）
* VSCodeプラグインサポート
* 自動アップグレード：iFlow CLIが現在のバージョンが最新かを自動検出


## 📥 インストール

### システム要件
- オペレーティングシステム: macOS 10.15+、Ubuntu 20.04+/Debian 10+、またはWindows 10+（WSL 1、WSL 2、またはGit for Windows）
- ハードウェア: 4GB以上のRAM
- ソフトウェア: Node.js 22+
- ネットワーク: 認証とAI処理のためにインターネット接続が必要
- シェル: Bash、Zsh、またはFishで最適に動作

### インストールコマンド
**MAC/Linux/Ubuntuユーザー**:
* ワンクリックインストールコマンド（推奨）
```shell
bash -c "$(curl -fsSL https://cloud.iflow.cn/iflow-cli/install.sh)"
```
* Node.jsを使用したインストール
```shell
npm i -g @iflow-ai/iflow-cli
```

このコマンドにより、ターミナルに必要な依存関係がすべて自動的にインストールされます。

**Windowsユーザーの方へ**:
1. https://nodejs.org/ja/download にアクセスして最新のNode.jsインストーラーをダウンロードしてください
2. インストーラーを実行してNode.jsをインストールしてください
3. ターミナルを再起動してください：CMDまたはPowerShell
4. `npm install -g @iflow-ai/iflow-cli` を実行してiFlow CLIをインストールしてください
5. `iflow` を実行してiFlow CLIを開始してください

中国本土の場合は、以下のコマンドでiFlow CLIをインストールできます：
1. https://cloud.iflow.cn/iflow-cli/nvm-setup.exe にアクセスして最新のnvmインストーラーをダウンロードしてください
2. インストーラーを実行してnvmをインストールしてください
3. **ターミナルを再起動してください：CMDまたはPowerShell**
4. `nvm node_mirror https://npmmirror.com/mirrors/node/` と `nvm npm_mirror https://npmmirror.com/mirrors/npm/` を実行してください
5. `nvm install 22` を実行してNode.js 22をインストールしてください
6. `nvm use 22` を実行してNode.js 22を使用してください
7. `npm install -g @iflow-ai/iflow-cli` を実行してiFlow CLIをインストールしてください
8. `iflow` を実行してiFlow CLIを開始してください

## 🗑️ アンインストール
```shell
npm uninstall -g @iflow-ai/iflow-cli
```

## 🔑 認証

iFlowでは2つの認証オプションを提供しています：

1. **推奨**: iFlowのネイティブ認証を使用
2. **代替手段**: OpenAI互換APIを通じて接続

![iFlow CLI Login](./assets/login.jpg)

オプション1を選択して直接ログインすると、WebページでiFlowアカウント認証が開きます。認証完了後、無料でご利用いただけます。

![iFlow CLI Web Login](./assets/web-login.jpg)

サーバーなどWebページを開けない環境をご利用の場合は、オプション2でログインしてください。

APIキーを取得するには：
1. iFlowアカウントに登録
2. プロフィール設定に移動するか、[こちらの直接リンク](https://iflow.cn/?open=setting)をクリック
3. ポップアップダイアログで「リセット」をクリックして新しいAPIキーを生成

![iFlow Profile Settings](./assets/profile-settings.jpg)

キーを生成後、ターミナルのプロンプトに貼り付けてセットアップを完了してください。

## 🚀 使い始める

iFlow CLIを起動するには、ターミナルでワークスペースに移動し、以下を入力します：

```shell
iflow
```

### 新しいプロジェクトの開始

新しいプロジェクトの場合は、作成したいものを簡潔に説明してください：

```shell
cd new-project/
iflow
> HTMLを使ってWebベースのMinecraftゲームを作成して
```

### 既存プロジェクトでの作業

既存のコードベースの場合は、`/init`コマンドから始めて、iFlowにプロジェクトを理解させましょう：

```shell
cd project1/
iflow
> /init
> requirement.mdファイルのPRD文書に従って要件を分析し、技術文書を出力してから、ソリューションを実装してください。
```

`/init`コマンドはコードベースをスキャンし、その構造を学習して、包括的なドキュメントを含むIFLOW.mdファイルを作成します。

スラッシュコマンドの完全なリストと使用方法については、[こちら](./i18/en/commands.md)をご覧ください。

## 💡 一般的な使用例

iFlow CLIはコーディングを超えて、幅広いタスクに対応します：

### 📊 情報収集・計画立案

```text
> ロサンゼルスで最も評価の高いレストランを見つけて、3日間のグルメツアーの行程表を作成してください。
```

```text
> 最新のiPhone価格比較を検索して、最もコストパフォーマンスの良い購入オプションを見つけてください。
```

### 📁 ファイル管理

```text
> デスクトップのファイルをファイルタイプ別に整理して、別々のフォルダに分けてください。
```

```text
> このWebページからすべての画像を一括ダウンロードして、日付順にリネームしてください。
```

### 📈 データ分析

```text
> このExcelスプレッドシートの売上データを分析して、シンプルなグラフを生成してください。
```

```text
> これらのCSVファイルから顧客情報を抽出して、統一されたテーブルにマージしてください。
```

### 👨‍💻 開発サポート

```text
> このシステムの主要なアーキテクチャコンポーネントとモジュール依存関係を分析してください。
```

```text
> リクエスト後にnull pointer exceptionが発生しています。問題の原因を見つけるのを手伝ってください。
```

### ⚙️ ワークフロー自動化

```text
> 重要なファイルを定期的にクラウドストレージにバックアップするスクリプトを作成してください。
```

```text
> 毎日株価をダウンロードして、メール通知を送信するプログラムを書いてください。
```

*注意: 高度な自動化タスクでは、MCPサーバーを活用してローカルシステムツールとエンタープライズコラボレーションスイートを統合できます。*

## 🔧 カスタムモデルへの切り替え

iFlow CLIは任意のOpenAI互換APIに接続できます。使用するモデルを変更するには、`~/.iflow/settings.json`の設定ファイルを編集してください。

設定ファイルのサンプル：
```json
{
    "theme": "Default",
    "selectedAuthType": "iflow",
    "apiKey": "あなたのiflowキー",
    "baseUrl": "https://apis.iflow.cn/v1",
    "modelName": "Qwen3-Coder",
    "searchApiKey": "あなたのiflowキー"
}
```

## 🔄 GitHub Actions

GitHub ActionsのワークフローでもiFlow CLIをコミュニティがメンテナンスするアクションで使用できます: [iflow-cli-action](https://github.com/vibe-ideas/iflow-cli-action)

## 👥 コミュニティコミュニケーション
使用中に問題が発生した場合は、GitHubページで直接Issuesを作成してください。

また、以下のWeChatグループQRコードをスキャンして、コミュニケーションや議論のためのコミュニティグループに参加することもできます。

### WeChatグループ
![WeChatグループ](./assets/iflow-wechat.jpg)
