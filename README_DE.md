# 🤖 iFlow CLI

[![Erwähnt in Awesome Gemini CLI](https://awesome.re/mentioned-badge.svg)](https://github.com/Piebald-AI/awesome-gemini-cli)

![iFlow CLI Screenshot](./assets/iflow-cli.jpg)

[English](README.md) | [中文](README_CN.md) | [日本語](README_JA.md) | [한국어](README_KO.md) | [Français](README_FR.md) | **Deutsch** | [Español](README_ES.md) | [Русский](README_RU.md)

iFlow CLI ist ein leistungsstarker KI-Assistent, der direkt in Ihrem Terminal läuft. Er analysiert nahtlos Code-Repositories, führt Programmieraufgaben aus, versteht kontextspezifische Anforderungen und steigert die Produktivität durch Automatisierung - von einfachen Dateioperationen bis hin zu komplexen Workflows.

## ✨ Hauptfunktionen

1. **Kostenlose KI-Modelle**: Zugang zu leistungsstarken und kostenlosen KI-Modellen über die [iFlow Open Platform](https://docs.iflow.cn/en/docs), einschließlich Kimi K2, Qwen3 Coder, DeepSeek v3 und mehr
2. **Flexible Integration**: Vollständige Unterstützung für OpenAI-Protokoll-Modellanbieter
3. **Intuitive Benutzeroberfläche**: Optimierte Terminal-Erfahrung mit kontextbewusster Unterstützung
4. **Sofort einsatzbereiter Assistent**: Vorkonfigurierte MCP-Server und spezialisierte Agenten, die zusammenarbeiten, um komplexe Probleme direkt nach der Installation zu lösen

## 📥 Installation

### Systemanforderungen
- Betriebssysteme: macOS 10.15+, Ubuntu 20.04+/Debian 10+, oder Windows 10+ (mit WSL 1, WSL 2 oder Git for Windows)
- Hardware: 4GB+ RAM
- Software: Node.js 18+
- Netzwerk: Internetverbindung für Authentifizierung und KI-Verarbeitung erforderlich
- Shell: Funktioniert am besten in Bash, Zsh oder Fish

### Installationsbefehl
```shell
bash -c "$(curl -fsSL https://cloud.iflow.cn/iflow-cli/install.sh)"
```

Dieser Befehl installiert automatisch alle notwendigen Abhängigkeiten für Ihr Terminal.

**Windows-Nutzer**: 
1. Gehen Sie zu https://nodejs.org/en/download, um das neueste Node.js-Installationsprogramm herunterzuladen
2. Führen Sie das Installationsprogramm aus, um Node.js zu installieren
3. Starten Sie Ihr Terminal neu: CMD oder PowerShell
4. Führen Sie `npm install -g @iflow-ai/iflow-cli` aus, um iFlow CLI zu installieren
5. Führen Sie `iflow` aus, um iFlow CLI zu starten

Wenn Sie sich in Festlandchina befinden, können Sie den folgenden Befehl verwenden, um iFlow CLI zu installieren:
1. Gehen Sie zu https://cloud.iflow.cn/iflow-cli/nvm-setup.exe, um das neueste nvm-Installationsprogramm herunterzuladen
2. Führen Sie das Installationsprogramm aus, um nvm zu installieren
3. **Starten Sie Ihr Terminal neu: CMD oder PowerShell**
4. Führen Sie `nvm node_mirror https://npmmirror.com/mirrors/node/` und `nvm npm_mirror https://npmmirror.com/mirrors/npm/` aus
5. Führen Sie `nvm install 22` aus, um Node.js 22 zu installieren
6. Führen Sie `nvm use 22` aus, um Node.js 22 zu verwenden
7. Führen Sie `npm install -g @iflow-ai/iflow-cli` aus, um iFlow CLI zu installieren
8. Führen Sie `iflow` aus, um iFlow CLI zu starten

## 🔑 Authentifizierung

iFlow bietet zwei Authentifizierungsoptionen:

1. **Empfohlen**: Verwenden Sie iFlows native Authentifizierung
2. **Alternative**: Verbindung über OpenAI-kompatible APIs

![iFlow CLI Login](./assets/login.jpg)

So erhalten Sie Ihren API-Schlüssel:
1. Registrieren Sie sich für ein iFlow-Konto
2. Gehen Sie zu Ihren Profileinstellungen oder klicken Sie auf [diesen direkten Link](https://iflow.cn/?open=setting)
3. Klicken Sie im Pop-up-Dialog auf "Zurücksetzen", um einen neuen API-Schlüssel zu generieren

![iFlow Profile Settings](./assets/profile-settings.jpg)

Nach der Generierung Ihres Schlüssels fügen Sie ihn in die Terminal-Eingabeaufforderung ein, um die Einrichtung abzuschließen.

## 🚀 Erste Schritte

Um iFlow CLI zu starten, navigieren Sie in Ihrem Terminal zu Ihrem Arbeitsbereich und geben Sie ein:

```shell
iflow
```

### Neue Projekte starten

Für neue Projekte beschreiben Sie einfach, was Sie erstellen möchten:

```shell
cd neues-projekt/
iflow
> Erstelle ein webbasiertes Minecraft-Spiel mit HTML
```

### Mit bestehenden Projekten arbeiten

Für bestehende Codebasen beginnen Sie mit dem `/init`-Befehl, um iFlow dabei zu helfen, Ihr Projekt zu verstehen:

```shell
cd projekt1/
iflow
> /init
> Analysiere die Anforderungen gemäß dem PRD-Dokument in der requirement.md-Datei und erstelle ein technisches Dokument, dann implementiere die Lösung.
```

Der `/init`-Befehl scannt Ihre Codebasis, lernt deren Struktur und erstellt eine IFLOW.md-Datei mit umfassender Dokumentation.

Eine vollständige Liste der Slash-Befehle und Nutzungsanweisungen finden Sie [hier](./i18/en/commands.md).

## 💡 Häufige Anwendungsfälle

iFlow CLI geht über das Programmieren hinaus und bewältigt eine Vielzahl von Aufgaben:

### 📊 Information & Planung

```text
> Hilf mir dabei, die bestbewerteten Restaurants in Los Angeles zu finden und eine 3-tägige Food-Tour-Route zu erstellen.
```

```text
> Suche nach den neuesten iPhone-Preisvergleichen und finde die kostengünstigste Kaufoption.
```

### 📁 Dateiverwaltung

```text
> Organisiere die Dateien auf meinem Desktop nach Dateityp in separate Ordner.
```

```text
> Lade alle Bilder von dieser Webseite im Batch herunter und benenne sie nach Datum um.
```

### 📈 Datenanalyse

```text
> Analysiere die Verkaufsdaten in dieser Excel-Tabelle und erstelle ein einfaches Diagramm.
```

```text
> Extrahiere Kundeninformationen aus diesen CSV-Dateien und führe sie in einer einheitlichen Tabelle zusammen.
```

### 👨‍💻 Entwicklungsunterstützung

```text
> Analysiere die Hauptarchitekturkomponenten und Modulabhängigkeiten dieses Systems.
```

```text
> Ich bekomme eine Null-Pointer-Exception nach meiner Anfrage, bitte hilf mir, die Ursache des Problems zu finden.
```

### ⚙️ Workflow-Automatisierung

```text
> Erstelle ein Skript, um meine wichtigen Dateien regelmäßig in den Cloud-Speicher zu sichern.
```

```text
> Schreibe ein Programm, das täglich Aktienkurse herunterlädt und mir E-Mail-Benachrichtigungen sendet.
```

*Hinweis: Erweiterte Automatisierungsaufgaben können MCP-Server nutzen, um Ihre lokalen Systemtools mit Unternehmens-Kollaborationssuiten zu integrieren.*

## 🔧 Zu einem benutzerdefinierten Modell wechseln

iFlow CLI kann sich mit jeder OpenAI-kompatiblen API verbinden. Bearbeiten Sie die Einstellungsdatei in `~/.iflow/settings.json`, um das von Ihnen verwendete Modell zu ändern.

Hier ist eine Beispiel-Einstellungsdatei:
```json
{
    "theme": "Default",
    "selectedAuthType": "iflow",
    "apiKey": "ihr iflow schlüssel",
    "baseUrl": "https://apis.iflow.cn/v1",
    "modelName": "Qwen3-Coder",
    "searchApiKey": "ihr iflow schlüssel"
}
```

## GitHub Actions

Sie können iFlow CLI auch in Ihren GitHub Actions Workflows mit der von der Community betreuten Action verwenden: [iflow-cli-action](https://github.com/vibe-ideas/iflow-cli-action)

## Community-Kommunikation
Wenn Sie bei der Nutzung auf Probleme stoßen, können Sie direkt Issues auf der GitHub-Seite erstellen.

Sie können auch den folgenden WeChat-Gruppen-QR-Code scannen, um der Community-Gruppe für Kommunikation und Diskussion beizutreten.

### WeChat-Gruppe
![WeChat-Gruppe](./assets/iflow-wechat.jpg)
