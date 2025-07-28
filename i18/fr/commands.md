# Guide d'utilisation des commandes iFlow CLI

iFlow CLI fournit trois types de commandes pour répondre aux différentes exigences d'utilisation :
- **Commandes Slash (`/`)** : Contrôlent les fonctionnalités et paramètres de la CLI
- **Commandes At (`@`)** : Référencent le contenu d'un fichier ou d'un répertoire
- **Commandes Shell (`!`)** : Exécutent des commandes système

## Commandes Slash (`/`) - Commandes de contrôle CLI

Les commandes slash sont utilisées pour gérer et contrôler les diverses fonctions de iFlow CLI.

### Initialisation du projet et gestion de la mémoire

**`/init`** - Initialisation du projet
- **Objectif** : Permet à l'IA de comprendre la structure et le code de votre projet lors de la première utilisation
- **Résultat** : Génère le fichier IFLOW.md pour stocker les informations du projet
- **Description** : IFLOW.md sert de "fichier mémoire" du projet, contenant la structure du projet, les normes de codage, les contraintes d'utilisation et d'autres informations automatiquement chargées à chaque conversation

**`/memory`** - Gestion de la mémoire
- **Objectif** : Gérer le contenu de la mémoire du projet par l'IA
- **Sous-commandes** :
  - `add <text>` - Ajouter un nouveau contenu de mémoire
  - `show` - Afficher le contenu actuel de la mémoire
  - `refresh` - Recharger le fichier IFLOW.md

### Outils et aide

**`/tools`** - Afficher les outils disponibles
- **Par défaut** : Afficher la liste des outils
- **`desc`** : Afficher les descriptions détaillées des outils

**`/help`** ou **`/?`** - Afficher les informations d'aide

**`/about`** - Afficher les informations de version

### Gestion de session

**`/clear`** - Effacer l'écran et l'historique des conversations

**`/compress``** - Compresser l'historique des conversations
- **Objectif** : Compresser les longues conversations en résumés pour économiser les ressources des conversations suivantes

**`/chat`** - Gestion de l'état des conversations
- **Sous-commandes** :
  - `save <label>` - Sauvegarder l'état actuel de la conversation
  - `resume <label>` - Reprendre l'état spécifié de la conversation
  - `list` - Afficher les états de conversation sauvegardés

**`/stats`** - Afficher les statistiques de session (utilisation de jetons, économies de cache, durée de session, etc.)

### Fonctions utilitaires

**`/copy`** - Copier la dernière sortie dans le presse-papiers

**`/editor`** - Sélectionner l'éditeur de code

**`/theme`** - Changer le thème de l'interface

**`/auth`** - Changer la méthode d'authentification

### Extensions

**`/mcp`** - Gestion du serveur de protocole de contexte de modèle
- **Sous-commandes** :
  - `desc` - Afficher la description détaillée
  - `nodesc` - Masquer les descriptions des outils
  - `schema` - Afficher les paramètres de configuration complets
- **Raccourci** : Ctrl+T pour basculer l'affichage des descriptions d'outils

**`/extensions`** - Afficher la liste des extensions actives

### Signalement de problèmes

**`/bug`** - Soumettre un retour sur un problème
- **Utilisation** : `/bug description du problème` crée un problème GitHub

### Quitter

**`/quit`** ou **`/exit`** - Quitter la CLI

## Commandes At (`@`) - Commandes de référence de fichiers

Les commandes At vous permettent de référencer directement le contenu d'un fichier ou d'un répertoire dans les conversations.

**`@<chemin du fichier ou du répertoire>`**
- **Objectif** : Inclure le contenu des fichiers ou répertoires spécifiés dans la conversation actuelle
- **Cas d'utilisation** :
  - Poser des questions sur des fichiers de code spécifiques
  - Analyser le contenu de documents
  - Traiter par lots les fichiers dans les répertoires

**Exemples d'utilisation** :
```
@src/main.py Quel est le problème avec ce fichier ?
@docs/ Résumer tous les documents de ce répertoire
Expliquez ce fichier de configuration @config.json
```

**Règles de traitement** :
- Fichier unique : Lire directement le contenu du fichier
- Répertoire : Lire le contenu de tous les fichiers du répertoire et de ses sous-répertoires

## Commandes Shell (`!`) - Exécution de commandes système

Les commandes Shell vous permettent d'exécuter des commandes système directement dans iFlow CLI.

**`!<commande système>`** - Exécuter une commande unique
- **Objectif** : Exécuter une commande système, afficher les résultats, puis revenir à la CLI
- **Exemples** :
  ```
  !ls -la          # Afficher la liste des fichiers
  !git status      # Vérifier l'état Git
  !npm install     # Installer les dépendances
  ```

**`!`** - Basculer en mode Shell
- **Objectif** : Entrer/sortir du mode Shell
- **Fonctionnalités du mode Shell** :
  - L'affichage de l'interface change (thème de couleur différent)
  - Saisir directement des commandes système sans le préfixe `!`
  - Saisir à nouveau `!` pour quitter le mode Shell

**Notes importantes** :
- Les commandes Shell ont les mêmes autorisations que lorsqu'elles sont exécutées directement dans le terminal
- Soyez prudent avec les commandes pouvant affecter le système

---

En utilisant correctement ces trois types de commandes, vous pouvez utiliser efficacement iFlow CLI pour le développement et la gestion de projets. Les nouveaux utilisateurs sont recommandés de commencer par `/init` pour initialiser le projet, puis d'utiliser les autres commandes selon les besoins.