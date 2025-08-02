# 🤖 iFlow CLI
![iFlow CLI Screenshot](./assets/iflow-cli.jpg)

[English](README.md) | [中文](README_CN.md) | [日本語](README_JA.md) | [한국어](README_KO.md) | [Français](README_FR.md) | [Deutsch](README_DE.md) | **Español** | [Русский](README_RU.md)

iFlow CLI es un potente asistente de IA que funciona directamente en tu terminal. Analiza repositorios de código de manera fluida, ejecuta tareas de programación, comprende necesidades específicas del contexto y aumenta la productividad automatizando desde operaciones simples de archivos hasta flujos de trabajo complejos.

## ✨ Características Principales

1. **Modelos de IA Gratuitos**: Accede a modelos de IA potentes y gratuitos a través de la [plataforma abierta iFlow](https://docs.iflow.cn/en/docs), incluyendo Kimi K2, Qwen3 Coder, DeepSeek v3, y más
2. **Integración Flexible**: Soporte completo para proveedores de modelos con protocolo OpenAI
3. **Interfaz Intuitiva**: Experiencia de terminal optimizada con asistencia consciente del contexto
4. **Asistente Listo para Usar**: Servidores MCP preconfigurados y agentes especializados que trabajan juntos para resolver problemas complejos desde el primer momento

## 📥 Instalación

### Requisitos del Sistema
- Sistemas Operativos: macOS 10.15+, Ubuntu 20.04+/Debian 10+, o Windows 10+ (con WSL 1, WSL 2, o Git for Windows)
- Hardware: 4GB+ de RAM
- Software: Node.js 18+
- Red: Conexión a Internet requerida para autenticación y procesamiento de IA
- Shell: Funciona mejor en Bash, Zsh o Fish

### Comando de instalación
```shell
bash -c "$(curl -fsSL https://cloud.iflow.cn/iflow-cli/install.sh)"
```

Este comando instala automáticamente todas las dependencias necesarias para tu terminal.

**Usuarios de Windows**:
1. Ve a https://nodejs.org/es/download para descargar el instalador de Node.js más reciente
2. Ejecuta el instalador para instalar Node.js
3. Reinicia tu terminal: CMD o PowerShell
4. Ejecuta `npm install -g @iflow-ai/iflow-cli` para instalar iFlow CLI
5. Ejecuta `iflow` para iniciar iFlow CLI

## 🔑 Autenticación

iFlow ofrece dos opciones de autenticación:

1. **Recomendado**: Usar la autenticación nativa de iFlow
2. **Alternativa**: Conectar a través de APIs compatibles con OpenAI

![iFlow CLI Login](./assets/login.jpg)

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

## GitHub Actions

También puedes usar iFlow CLI en tus flujos de trabajo de GitHub Actions con la acción mantenida por la comunidad: [iflow-cli-action](https://github.com/vibe-ideas/iflow-cli-action)

## Comunicación de la Comunidad
Si encuentras problemas durante el uso, puedes crear Issues directamente en la página de GitHub.

También puedes escanear el siguiente código QR del grupo de WeChat para unirte al grupo de la comunidad para comunicación y discusión.

### Grupo de WeChat
![Grupo de WeChat](./assets/iflow-wechat.jpg)