> [!IMPORTANT]
> **iFlow CLI cesará su actividad el 17 de abril de 2026 (UTC+8).** Gracias por mantener iFlow CLI en tu terminal. Para más detalles y la guía de migración, consulta nuestra [publicación de despedida](https://vibex.iflow.cn/t/topic/4819).

---

# 🤖 iFlow CLI

[![Mencionado en Awesome Gemini CLI](https://awesome.re/mentioned-badge.svg)](https://github.com/Piebald-AI/awesome-gemini-cli)

![iFlow CLI Screenshot](./assets/iflow-cli.jpg)

[English](README.md) | [中文](README_CN.md) | [日本語](README_JA.md) | [한국어](README_KO.md) | [Français](README_FR.md) | [Deutsch](README_DE.md) | **Español** | [Русский](README_RU.md)

iFlow CLI es un potente asistente de IA que funciona directamente en tu terminal. Analiza repositorios de código de manera fluida, ejecuta tareas de programación, comprende necesidades específicas del contexto y aumenta la productividad automatizando desde operaciones simples de archivos hasta flujos de trabajo complejos.

[Más Tutoriales](https://platform.iflow.cn/)

## ✨ Características Principales

1. **Modelos de IA Gratuitos**: Accede a modelos de IA potentes y gratuitos a través de la [plataforma abierta iFlow](https://platform.iflow.cn/docs/api-mode), incluyendo Kimi K2, Qwen3 Coder, DeepSeek v3, y más
2. **Integración Flexible**: Mantén tus herramientas de desarrollo favoritas mientras integras en sistemas existentes para automatización
3. **Interacción en Lenguaje Natural**: Despídete de comandos complejos, controla la IA con conversación cotidiana, desde desarrollo de código hasta asistencia personal
4. **Plataforma Abierta**: Instalación con un clic de SubAgent y MCP desde el [mercado abierto iFlow](https://platform.iflow.cn/), expande rápidamente agentes inteligentes y construye tu propio equipo de IA

## Comparación de Características
| Característica | iFlow Cli | Claude Code | Gemini Cli |
|---------------|-----------|-------------|------------|
| Planificación Todo | ✅ | ✅ | ❌ |
| SubAgent | ✅ | ✅ | ❌ |
| Comandos personalizados | ✅ | ✅ | ✅ |
| Modo plan | ✅ | ✅ | ❌ |
| Herramientas de tarea | ✅ | ✅ | ❌ |
| Plugin VS Code | ✅ | ✅ | ✅ |
| Plugin JetBrains | ✅ | ✅ | ❌ |
| Recuperación de conversación | ✅ | ✅ | ❌ |
| Mercado abierto integrado | ✅ | ❌ | ❌ |
| Compresión automática de memoria | ✅ | ✅ | ✅ |
| Capacidad multimodal | ✅ | ⚠️ (Modelos chinos no soportados) | ⚠️ (Modelos chinos no soportados) |
| Búsqueda | ✅ | ❌ | ⚠️ (VPN requerido) |
| Gratuito | ✅ | ❌ | ⚠️ (Uso limitado) |
| Hook | ✅ | ✅ | ❌ |
| Estilo de salida | ✅ | ✅ | ❌ |
| Pensamiento | ✅ | ✅ | ❌ |
| Flujo de trabajo | ✅ | ❌ | ❌ |
| SDK | ✅ | ✅ | ❌ |
| ACP | ✅ | ✅ | ✅ |

## ⭐ Características Clave
* Soporte para 4 modos de funcionamiento: yolo (modelo con máximos permisos, puede ejecutar cualquier operación), accepting edits (modelo solo con permisos de edición de archivos), plan mode (planificar primero luego ejecutar), default (modelo sin permisos)
* Funcionalidad subAgent mejorada. Evoluciona la CLI de un asistente generalista a un equipo de expertos, proporcionándote consejos más profesionales y precisos. Usa /agent para ver más agentes preconfigurados
* Herramienta task mejorada. Compresión eficiente de la longitud del contexto, permitiendo que la CLI complete tus tareas más profundamente. Compresión automática cuando el contexto alcanza el 70%
* Integración con el mercado abierto iFlow. Instalación rápida de herramientas MCP útiles, Subagents, instrucciones personalizadas y flujos de trabajo
* Uso gratuito de modelos multimodales, también puedes pegar imágenes en la CLI (Ctrl+V para pegar imágenes)
* Soporte para guardado y retroceso del historial de conversaciones (comandos iflow --resume y /chat)
* Soporte para más comandos de terminal útiles (iflow -h para ver más comandos)
* Soporte para plugin de VSCode
* Actualización automática, iFlow CLI detecta automáticamente si la versión actual es la más reciente


## 📥 Instalación

### Requisitos del Sistema
- Sistemas Operativos: macOS 10.15+, Ubuntu 20.04+/Debian 10+, o Windows 10+ (con WSL 1, WSL 2, o Git for Windows)
- Hardware: 4GB+ de RAM
- Software: Node.js 22+
- Red: Conexión a Internet requerida para autenticación y procesamiento de IA
- Shell: Funciona mejor en Bash, Zsh o Fish

### Comando de instalación
**Usuarios de MAC/Linux/Ubuntu**:
* Comando de instalación con un clic (Recomendado)
```shell
bash -c "$(curl -fsSL https://cloud.iflow.cn/iflow-cli/install.sh)"
```
* Instalación con Node.js
```shell
npm i -g @iflow-ai/iflow-cli
```

Este comando instala automáticamente todas las dependencias necesarias para tu terminal.

**Usuarios de Windows**:
1. Ve a https://nodejs.org/es/download para descargar el instalador de Node.js más reciente
2. Ejecuta el instalador para instalar Node.js
3. Reinicia tu terminal: CMD o PowerShell
4. Ejecuta `npm install -g @iflow-ai/iflow-cli` para instalar iFlow CLI
5. Ejecuta `iflow` para iniciar iFlow CLI

Si estás en China continental, puedes usar el siguiente comando para instalar iFlow CLI:
1. Ve a https://cloud.iflow.cn/iflow-cli/nvm-setup.exe para descargar el instalador de nvm más reciente
2. Ejecuta el instalador para instalar nvm
3. **Reinicia tu terminal: CMD o PowerShell**
4. Ejecuta `nvm node_mirror https://npmmirror.com/mirrors/node/` y `nvm npm_mirror https://npmmirror.com/mirrors/npm/`
5. Ejecuta `nvm install 22` para instalar Node.js 22
6. Ejecuta `nvm use 22` para usar Node.js 22
7. Ejecuta `npm install -g @iflow-ai/iflow-cli` para instalar iFlow CLI
8. Ejecuta `iflow` para iniciar iFlow CLI

## 🗑️ Desinstalación
```shell
npm uninstall -g @iflow-ai/iflow-cli
```

## 🔑 Autenticación

iFlow ofrece dos opciones de autenticación:

1. **Recomendado**: Usar la autenticación nativa de iFlow
2. **Alternativa**: Conectar a través de APIs compatibles con OpenAI

![iFlow CLI Login](./assets/login.jpg)

Elige la opción 1 para iniciar sesión directamente, lo que abrirá la autenticación de cuenta iFlow en una página web. Después de completar la autenticación, puedes usarlo gratis.

![iFlow CLI Web Login](./assets/web-login.jpg)

Si estás en un entorno como un servidor donde no puedes abrir una página web, usa la opción 2 para iniciar sesión.

Para obtener tu clave API:
1. Regístrate para una cuenta de iFlow
2. Ve a la configuración de tu perfil o haz clic en [este enlace directo](https://iflow.cn/?open=setting)
3. Haz clic en "Reset" en el diálogo emergente para generar una nueva clave API

![iFlow Profile Settings](./assets/profile-settings.jpg)

Después de generar tu clave, pégala en el prompt del terminal para completar la configuración.

## 🚀 Primeros Pasos

Para iniciar iFlow CLI, navega a tu espacio de trabajo en el terminal y escribe:

```shell
iflow
```

### Iniciando Nuevos Proyectos

Para proyectos nuevos, simplemente describe lo que quieres crear:

```shell
cd nuevo-proyecto/
iflow
> Crea un juego de Minecraft basado en web usando HTML
```

### Trabajando con Proyectos Existentes

Para bases de código existentes, comienza con el comando `/init` para ayudar a iFlow a entender tu proyecto:

```shell
cd proyecto1/
iflow
> /init
> Analiza los requisitos según el documento PRD en el archivo requirement.md, genera un documento técnico y luego implementa la solución.
```

El comando `/init` escanea tu base de código, aprende su estructura y crea un archivo IFLOW.md con documentación completa.

Para una lista completa de comandos slash e instrucciones de uso, consulta [aquí](./i18/en/commands.md).

## 💡 Casos de Uso Comunes

iFlow CLI va más allá de la programación para manejar una amplia gama de tareas:

### 📊 Información y Planificación

```text
> Ayúdame a encontrar los restaurantes mejor valorados en Los Ángeles y crea un itinerario gastronómico de 3 días.
```

```text
> Busca las últimas comparaciones de precios del iPhone y encuentra la opción de compra más rentable.
```

### 📁 Gestión de Archivos

```text
> Organiza los archivos de mi escritorio por tipo de archivo en carpetas separadas.
```

```text
> Descarga por lotes todas las imágenes de esta página web y renómbralas por fecha.
```

### 📈 Análisis de Datos

```text
> Analiza los datos de ventas en esta hoja de cálculo de Excel y genera un gráfico simple.
```

```text
> Extrae información de clientes de estos archivos CSV y combínalos en una tabla unificada.
```

### 👨‍💻 Soporte de Desarrollo

```text
> Analiza los componentes arquitectónicos principales y las dependencias de módulos de este sistema.
```

```text
> Estoy obteniendo una excepción de puntero nulo después de mi solicitud, por favor ayúdame a encontrar la causa del problema.
```

### ⚙️ Automatización de Flujos de Trabajo

```text
> Crea un script para hacer copias de seguridad periódicas de mis archivos importantes al almacenamiento en la nube.
```

```text
> Escribe un programa que descargue precios de acciones diariamente y me envíe notificaciones por email.
```

*Nota: Las tareas de automatización avanzadas pueden aprovechar los servidores MCP para integrar las herramientas de tu sistema local con suites de colaboración empresarial.*

## 🔧 Cambiar a modelo personalizado

iFlow CLI puede conectarse a cualquier API compatible con OpenAI. Edita el archivo de configuración en `~/.iflow/settings.json` para cambiar el modelo que usas.

Aquí tienes un archivo de configuración de ejemplo:
```json
{
    "theme": "Default",
    "selectedAuthType": "iflow",
    "apiKey": "tu clave de iflow",
    "baseUrl": "https://apis.iflow.cn/v1",
    "modelName": "Qwen3-Coder",
    "searchApiKey": "tu clave de iflow"
}
```

## 🔄 GitHub Actions

También puedes usar iFlow CLI en tus flujos de trabajo de GitHub Actions con la acción mantenida por la comunidad: [iflow-cli-action](https://github.com/iflow-ai/iflow-cli-action)

## 👥 Comunicación de la Comunidad
Si encuentras problemas durante el uso, puedes crear Issues directamente en la página de GitHub.

También puedes escanear el siguiente código QR del grupo de WeChat para unirte al grupo de la comunidad para comunicación y discusión.

### Grupo de WeChat
![Grupo de WeChat](./assets/iflow-wechat.jpg)
