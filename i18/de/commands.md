# iFlow CLI Befehlsverwendungsanleitung

iFlow CLI bietet drei Arten von Befehlen, um verschiedene Anforderungen zu erfüllen:
- **Slash-Befehle (`/`)**: Steuern CLI-Funktionen und -einstellungen
- **At-Befehle (`@`)**: Referenzieren Datei- oder Verzeichnisinhalte
- **Shell-Befehle (`!`)**: Führen Systembefehle aus

## Slash-Befehle (`/`) - CLI-Steuerungsbefehle

Slash-Befehle werden verwendet, um verschiedene Funktionen von iFlow CLI zu verwalten und zu steuern.

### Projektinitialisierung und Speicherverwaltung

**`/init`** - Projektinitialisierung
- **Zweck**: Ermöglicht der KI, Ihre Projektstruktur und Ihren Code beim ersten Gebrauch zu verstehen
- **Ergebnis**: Erzeugt die Datei IFLOW.md zur Speicherung von Projektinformationen
- **Beschreibung**: IFLOW.md dient als "Speicherdatei" des Projekts und enthält Projektstruktur, Codierungsstandards, Nutzungsbeschränkungen und andere Informationen, die automatisch bei jeder Konversation geladen werden

**`/memory`** - Speicherverwaltung
- **Zweck**: Verwalten des Projektspeicherinhalts durch die KI
- **Unterbefehle**:
  - `add <text>` - Neuen Speicherinhalt hinzufügen
  - `show` - Aktuellen Speicherinhalt anzeigen
  - `refresh` - IFLOW.md-Datei neu laden

### Werkzeuge und Hilfe

**`/tools`** - Verfügbare Werkzeuge anzeigen
- **Standard**: Werkzeugliste anzeigen
- **`desc`** - Detaillierte Werkzeugbeschreibungen anzeigen

**`/help`** oder **`/?`** - Hilfeinformationen anzeigen

**`/about`** - Versionsinformationen anzeigen

### Sitzungsverwaltung

**`/clear`** - Bildschirm und Konversationsverlauf löschen

**`/compress`** - Konversationsverlauf komprimieren
- **Zweck**: Lange Konversationen in Zusammenfassungen komprimieren, um Ressourcen für nachfolgende Konversationen zu sparen

**`/chat`** - Konversationszustandsverwaltung
- **Unterbefehle**:
  - `save <label>` - Aktuellen Konversationszustand speichern
  - `resume <label>` - Angegebenen Konversationszustand fortsetzen
  - `list` - Gespeicherte Konversationszustände anzeigen

**`/stats`** - Sitzungsstatistiken anzeigen (Token-Nutzung, Cache-Einsparungen, Sitzungsdauer usw.)

### Hilfsfunktionen

**`/copy`** - Letzte Ausgabe in die Zwischenablage kopieren

**`/editor`** - Code-Editor auswählen

**`/theme`** - Oberflächenthema ändern

**`/auth`** - Authentifizierungsmethode ändern

### Erweiterungen

**`/mcp`** - Modell-Kontextprotokoll-Serververwaltung
- **Unterbefehle**:
  - `desc` - Detaillierte Beschreibung anzeigen
  - `nodesc` - Werkzeugbeschreibungen ausblenden
  - `schema` - Vollständige Konfigurationsparameter anzeigen
- **Tastenkürzel**: Strg+T zum Umschalten der Werkzeugbeschreibungsanzeige

**`/extensions`** - Liste aktiver Erweiterungen anzeigen

### Problemberichte

**`/bug`** - Problemfeedback einreichen
- **Verwendung**: `/bug Problembeschreibung` erstellt ein GitHub-Issue

### Beenden

**`/quit`** oder **`/exit`** - CLI beenden

## At-Befehle (`@`) - Dateireferenzbefehle

At-Befehle ermöglichen es Ihnen, direkt Datei- oder Verzeichnisinhalte in Konversationen zu referenzieren.

**`@<Datei- oder Verzeichnispfad>`**
- **Zweck**: Inhalte aus angegebenen Dateien oder Verzeichnissen in die aktuelle Konversation einbeziehen
- **Anwendungsfälle**:
  - Fragen zu bestimmten Code-Dateien stellen
  - Dokumenteninhalte analysieren
  - Stapelverarbeitung von Dateien in Verzeichnissen

**Verwendungsbeispiele**:
```
@src/main.py Was ist mit dieser Datei los?
@docs/ Alle Dokumente in diesem Verzeichnis zusammenfassen
Erkläre diese Konfigurationsdatei @config.json
```

**Verarbeitungsregeln**:
- Einzelne Datei: Direktes Lesen des Dateiinhalts
- Verzeichnis: Lesen von Inhalten aus allen Dateien im Verzeichnis und Unterverzeichnissen

## Shell-Befehle (`!`) - Systembefehlsausführung

Shell-Befehle ermöglichen es Ihnen, Systembefehle direkt innerhalb von iFlow CLI auszuführen.

**`!<Systembefehl>`** - Einzelnen Befehl ausführen
- **Zweck**: Systembefehl ausführen, Ergebnisse anzeigen und dann zur CLI zurückkehren
- **Beispiele**:
  ```
  !ls -la          # Dateiliste anzeigen
  !git status      # Git-Status prüfen
  !npm install     # Abhängigkeiten installieren
  ```

**`!`** - Shell-Modus umschalten
- **Zweck**: Shell-Modus betreten/verlassen
- **Shell-Modus-Funktionen**:
  - Änderung der Oberflächenanzeige (anderes Farbthema)
  - Direkte Eingabe von Systembefehlen ohne `!`-Präfix
  - Erneutes Eingeben von `!` zum Verlassen des Shell-Modus

**Wichtige Hinweise**:
- Shell-Befehle haben dieselben Berechtigungen wie bei direkter Ausführung im Terminal
- Vorsicht bei Befehlen, die das System beeinträchtigen könnten

---

Durch die richtige Verwendung dieser drei Befehlstypen können Sie iFlow CLI effizient für Projektentwicklung und -verwaltung nutzen. Neue Benutzer wird empfohlen, mit `/init` zu beginnen, um das Projekt zu initialisieren, und dann nach Bedarf andere Befehle zu verwenden.