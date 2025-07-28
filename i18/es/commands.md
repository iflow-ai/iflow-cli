# Guía de uso de comandos de iFlow CLI

iFlow CLI proporciona tres tipos de comandos para satisfacer diferentes requisitos de uso:
- **Comandos Slash (`/`)**: Controlan las funciones y configuraciones de la CLI
- **Comandos At (`@`)**: Hacen referencia al contenido de archivos o directorios
- **Comandos Shell (`!`)**: Ejecutan comandos del sistema

## Comandos Slash (`/`) - Comandos de control de CLI

Los comandos slash se utilizan para gestionar y controlar las diversas funciones de iFlow CLI.

### Inicialización del proyecto y gestión de memoria

**`/init`** - Inicialización del proyecto
- **Propósito**: Permite que la IA entienda la estructura y el código de tu proyecto en el primer uso
- **Resultado**: Genera el archivo IFLOW.md para almacenar la información del proyecto
- **Descripción**: IFLOW.md sirve como el "archivo de memoria" del proyecto, que contiene la estructura del proyecto, estándares de codificación, restricciones de uso y otra información que se carga automáticamente en cada conversación

**`/memory`** - Gestión de memoria
- **Propósito**: Gestionar el contenido de la memoria del proyecto por parte de la IA
- **Subcomandos**:
  - `add <texto>` - Agregar nuevo contenido de memoria
  - `show` - Ver el contenido actual de la memoria
  - `refresh` - Recargar el archivo IFLOW.md

### Herramientas y ayuda

**`/tools`** - Ver herramientas disponibles
- **Predeterminado**: Mostrar lista de herramientas
- **`desc`**: Mostrar descripciones detalladas de las herramientas

**`/help`** o **`/?`** - Mostrar información de ayuda

**`/about`** - Ver información de versión

### Gestión de sesiones

**`/clear`** - Limpiar pantalla e historial de conversaciones

**`/compress`** - Comprimir historial de conversaciones
- **Propósito**: Comprimir conversaciones largas en resúmenes para ahorrar recursos para conversaciones posteriores

**`/chat`** - Gestión del estado de conversaciones
- **Subcomandos**:
  - `save <etiqueta>` - Guardar el estado actual de la conversación
  - `resume <etiqueta>` - Reanudar el estado especificado de la conversación
  - `list` - Ver estados de conversación guardados

**`/stats`** - Ver estadísticas de sesión (uso de tokens, ahorro de caché, duración de sesión, etc.)

### Funciones de utilidad

**`/copy`** - Copiar la última salida al portapapeles

**`/editor`** - Seleccionar editor de código

**`/theme`** - Cambiar tema de interfaz

**`/auth`** - Cambiar método de autenticación

### Extensiones

**`/mcp`** - Gestión del servidor de protocolo de contexto de modelo
- **Subcomandos**:
  - `desc` - Mostrar descripción detallada
  - `nodesc` - Ocultar descripciones de herramientas
  - `schema` - Mostrar parámetros de configuración completos
- **Atajo**: Ctrl+T para alternar la visualización de descripciones de herramientas

**`/extensions`** - Ver lista de extensiones activas

### Informe de problemas

**`/bug`** - Enviar retroalimentación de problema
- **Uso**: `/bug descripción del problema` crea un problema en GitHub

### Salir

**`/quit`** o **`/exit`** - Salir de la CLI

## Comandos At (`@`) - Comandos de referencia de archivos

Los comandos At te permiten hacer referencia directamente al contenido de archivos o directorios en las conversaciones.

**`@<ruta del archivo o directorio>`**
- **Propósito**: Incluir contenido de archivos o directorios especificados en la conversación actual
- **Casos de uso**:
  - Hacer preguntas sobre archivos de código específicos
  - Analizar contenido de documentos
  - Procesar por lotes archivos en directorios

**Ejemplos de uso**:
```
@src/main.py ¿Cuál es el problema con este archivo?
@docs/ Resumir todos los documentos en este directorio
Explica este archivo de configuración @config.json
```

**Reglas de procesamiento**:
- Archivo único: Leer directamente el contenido del archivo
- Directorio: Leer contenido de todos los archivos en el directorio y subdirectorios

## Comandos Shell (`!`) - Ejecución de comandos del sistema

Los comandos Shell te permiten ejecutar comandos del sistema directamente dentro de iFlow CLI.

**`!<comando del sistema>`** - Ejecutar un comando único
- **Propósito**: Ejecutar comando del sistema, mostrar resultados y luego volver a la CLI
- **Ejemplos**:
  ```
  !ls -la          # Ver lista de archivos
  !git status      # Verificar estado de Git
  !npm install     # Instalar dependencias
  ```

**`!`** - Alternar modo Shell
- **Propósito**: Entrar/salir del modo Shell
- **Características del modo Shell**:
  - La visualización de la interfaz cambia (tema de color diferente)
  - Ingresar comandos del sistema directamente sin el prefijo `!`
  - Ingresar `!` nuevamente para salir del modo Shell

**Notas importantes**:
- Los comandos Shell tienen los mismos permisos que al ejecutarse directamente en la terminal
- Tenga cuidado con comandos que puedan afectar al sistema

---

Al usar correctamente estos tres tipos de comandos, puede utilizar eficientemente iFlow CLI para el desarrollo y gestión de proyectos. Se recomienda a los nuevos usuarios comenzar con `/init` para inicializar el proyecto, y luego usar otros comandos según sea necesario.