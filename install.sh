#!/bin/bash

set -e

# Define color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Define log functions
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install uv
install_uv() {
    local platform=$(uname -s)
    
    if command_exists uv; then
        log_success "uv is already installed"
        log_info "uv version: $(uv --version 2>/dev/null || echo 'version info not available')"
        return 0
    fi
    
    log_info "Installing uv..."
    
    case "$platform" in
        Linux|Darwin)
            # MacOS/Linux installation
            if curl -LsSf https://astral.sh/uv/install.sh | sh; then
                log_success "uv installed successfully"
                # Add uv to PATH for current session
                export PATH="$HOME/.cargo/bin:$PATH"
                return 0
            else
                log_error "Failed to install uv"
                log_warning "Continuing without uv installation..."
                return 1
            fi
            ;;
        MINGW*|CYGWIN*|MSYS*)
            log_info "Windows platform detected. Installing uv using PowerShell..."
            if powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"; then
                log_success "uv installed successfully"
                return 0
            else
                log_error "Failed to install uv"
                log_warning "Continuing without uv installation..."
                return 1
            fi
            ;;
        *)
            log_error "Unsupported platform for uv installation: $platform"
            log_warning "Continuing without uv installation..."
            return 1
            ;;
    esac
}

# Check if it's a development machine environment
is_dev_machine() {
    # Check if development machine specific directories or files exist
    if [ -d "/apsara" ] || [ -d "/home/admin" ] || [ -f "/etc/redhat-release" ]; then
        return 0
    fi
    return 1
}

# Get shell configuration file
get_shell_profile() {
    local current_shell=$(basename "$SHELL")
    case "$current_shell" in
        bash)
            echo "$HOME/.bashrc"
            ;;
        zsh)
            echo "$HOME/.zshrc"
            ;;
        fish)
            echo "$HOME/.config/fish/config.fish"
            ;;
        *)
            echo "$HOME/.profile"
            ;;
    esac
}

# Clean npm configuration conflicts
clean_npmrc_conflict() {
    local npmrc="$HOME/.npmrc"
    if [[ -f "$npmrc" ]]; then
        log_info "Cleaning npmrc conflicts..."
        grep -Ev '^(prefix|globalconfig) *= *' "$npmrc" > "${npmrc}.tmp" && mv -f "${npmrc}.tmp" "$npmrc" || true
    fi
}

# Download nvm offline package
download_nvm_offline() {
    local VERSION=${1:-v0.40.3}
    local OUT_DIR=${2:-"/tmp/nvm-offline-${VERSION}"}
    local PACKAGE_URL="https://cloud.iflow.cn/iflow-cli/nvm-${VERSION}.tar.gz"
    local TEMP_FILE="/tmp/nvm-${VERSION}.tar.gz"
    
    log_info "Downloading nvm ${VERSION} package to ${OUT_DIR}"
    mkdir -p "${OUT_DIR}"
    
    # Download nvm package from iflow cloud storage
    log_info "Downloading from: ${PACKAGE_URL}"
    if curl -sSL --connect-timeout 10 --max-time 60 "${PACKAGE_URL}" -o "${TEMP_FILE}"; then
        log_info "Package downloaded successfully, extracting..."
        
        # Extract package to output directory
        if tar -xzf "${TEMP_FILE}" -C "${OUT_DIR}"; then
            # Clean up temporary file
            rm -f "${TEMP_FILE}"
            
            # Make nvm-exec executable
            if [ -f "${OUT_DIR}/nvm-exec" ]; then
                chmod +x "${OUT_DIR}/nvm-exec"
            fi
            
            log_success "nvm downloaded and extracted successfully"
            return 0
        else
            log_error "Failed to extract nvm package"
            rm -f "${TEMP_FILE}"
            return 1
        fi
    else
        log_error "Failed to download nvm package from iflow cloud storage"
        return 1
    fi
}

# Install nvm
install_nvm() {
    local NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
    local NVM_VERSION="${NVM_VERSION:-v0.40.3}"
    local TMP_OFFLINE_DIR="/tmp/nvm-offline-${NVM_VERSION}"
    
    if [ -s "$NVM_DIR/nvm.sh" ]; then
        log_info "nvm is already installed at $NVM_DIR"
        return 0
    fi
    
    # Download nvm
    if ! download_nvm_offline "${NVM_VERSION}" "${TMP_OFFLINE_DIR}"; then
        log_error "Failed to download nvm"
        return 1
    fi
    
    # Install nvm
    log_info "Installing nvm to ${NVM_DIR}"
    mkdir -p "${NVM_DIR}"
    cp "${TMP_OFFLINE_DIR}/"{nvm.sh,nvm-exec,bash_completion} "${NVM_DIR}/" || {
        log_error "Failed to copy nvm files"
        return 1
    }
    chmod +x "${NVM_DIR}/nvm-exec"
    
    # Configure shell profile
    local PROFILE_FILE=$(get_shell_profile)
    local current_shell=$(basename "$SHELL")
    
    # Create necessary directories for fish shell
    if [ "$current_shell" = "fish" ]; then
        mkdir -p "$(dirname "$PROFILE_FILE")"
    fi
    
    # Add nvm to profile
    if [ "$current_shell" = "fish" ]; then
        # Fish shell 配置
        local FISH_NVM_CONFIG='
# NVM configuration for fish shell
set -gx NVM_DIR "'${NVM_DIR}'"
if test -s "$NVM_DIR/nvm.sh"
    bass source "$NVM_DIR/nvm.sh"
end'
        
        if ! grep -q 'NVM_DIR' "${PROFILE_FILE}" 2>/dev/null; then
            # Check if bass is installed
            if ! fish -c "type -q bass" 2>/dev/null; then
                log_warning "bass is not installed. Installing bass for fish shell nvm support..."
                fish -c "curl -sL https://raw.githubusercontent.com/edc/bass/master/functions/bass.fish | source && fisher install edc/bass" || {
                    log_warning "Failed to install bass. You may need to install it manually."
                    log_info "Visit: https://github.com/edc/bass"
                }
            fi
            echo "${FISH_NVM_CONFIG}" >> "${PROFILE_FILE}"
            log_info "Added nvm to ${PROFILE_FILE}"
        fi
    else
        # Bash/Zsh 配置
        local SOURCE_STR='
export NVM_DIR="'${NVM_DIR}'"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'
        
        if ! grep -q 'NVM_DIR' "${PROFILE_FILE}" 2>/dev/null; then
            echo "${SOURCE_STR}" >> "${PROFILE_FILE}"
            log_info "Added nvm to ${PROFILE_FILE}"
        fi
    fi
    
    # Clean up temporary files
    rm -rf "${TMP_OFFLINE_DIR}"
    
    log_success "nvm installed successfully"
    return 0
}

# Install Node.js
install_nodejs_with_nvm() {
    local NODE_VERSION="${NODE_VERSION:-22}"
    local NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
    
    # Ensure nvm is loaded
    export NVM_DIR="${NVM_DIR}"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    
    if ! command_exists nvm; then
        log_error "nvm not loaded properly"
        return 1
    fi
    
    # Check if xz needs to be installed
    if ! command_exists xz; then
        log_warning "xz not found, trying to install xz-utils..."
        if command_exists yum; then
            sudo yum install -y xz || log_warning "Failed to install xz, continuing anyway..."
        elif command_exists apt-get; then
            sudo apt-get update && sudo apt-get install -y xz-utils || log_warning "Failed to install xz, continuing anyway..."
        fi
    fi
    
    # Set Node.js mirror source (for domestic network)
    export NVM_NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
    
    # Clear cache
    log_info "Clearing nvm cache..."
    nvm cache clear || true
    
    # Install Node.js
    log_info "Installing Node.js v${NODE_VERSION}..."
    if nvm install ${NODE_VERSION}; then
        nvm alias default ${NODE_VERSION}
        nvm use default
        log_success "Node.js v${NODE_VERSION} installed successfully"
        
        # Verify installation
        log_info "Node.js version: $(node -v)"
        log_info "npm version: $(npm -v)"
        
        # Clean npm configuration conflicts
        clean_npmrc_conflict
        
        # Configure npm mirror source
        npm config set registry https://registry.npmmirror.com
        log_info "npm registry set to npmmirror"
        
        return 0
    else
        log_error "Failed to install Node.js"
        return 1
    fi
}

# Check Node.js version
check_node_version() {
    if ! command_exists node; then
        return 1
    fi
    
    local current_version=$(node -v | sed 's/v//')
    local major_version=$(echo $current_version | cut -d. -f1)
    
    if [ "$major_version" -ge 20 ]; then
        log_success "Node.js v$current_version is already installed (>= 20)"
        return 0
    else
        log_warning "Node.js v$current_version is installed but version < 20"
        return 1
    fi
}

# Install Node.js
install_nodejs() {
    local platform=$(uname -s)
    
    case "$platform" in
        Linux|Darwin)
            log_info "Installing Node.js on $platform..."
            
            # Install nvm
            if ! install_nvm; then
                log_error "Failed to install nvm"
                return 1
            fi
            
            # Load nvm
            export NVM_DIR="${HOME}/.nvm"
            [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
            
            # Install Node.js
            if ! install_nodejs_with_nvm; then
                log_error "Failed to install Node.js"
                return 1
            fi
            
            ;;
        MINGW*|CYGWIN*|MSYS*)
            log_error "Windows platform detected. Please use Windows installer or WSL."
            log_info "Visit: https://nodejs.org/en/download/"
            exit 1
            ;;
        *)
            log_error "Unsupported platform: $platform"
            exit 1
            ;;
    esac
}

# Check and update Node.js
check_and_install_nodejs() {
    if check_node_version; then
        log_info "Using existing Node.js installation"
        clean_npmrc_conflict
    else
        log_warning "Installing or upgrading Node.js..."
        install_nodejs
    fi
}


# Uninstall existing iFlow CLI
uninstall_existing_iflow() {
    local platform=$(uname -s)
    
    if command_exists iflow; then
        log_warning "Existing iFlow CLI installation detected"
        
        # Try to get current version
        local current_version=$(iflow --version 2>/dev/null || echo "unknown")
        log_info "Current version: $current_version"
        
        log_info "Uninstalling existing iFlow CLI..."
        
        # Try npm uninstall first
        if npm uninstall -g @iflow-ai/iflow-cli 2>/dev/null; then
            log_success "Successfully uninstalled existing iFlow CLI via npm"
        else
            log_warning "Could not uninstall via npm, trying to remove manually..."
            
            case "$platform" in
                MINGW*|CYGWIN*|MSYS*)
                    # Windows platform
                    local npm_prefix=$(npm config get prefix 2>/dev/null || echo "%APPDATA%\\npm")
                    local bin_path="$npm_prefix/iflow.cmd"
                    
                    # Remove iflow binary if exists
                    if [ -f "$bin_path" ]; then
                        rm -f "$bin_path" && log_info "Removed $bin_path"
                    fi
                    
                    # Remove from common Windows locations
                    local common_paths=(
                        "$npm_prefix/iflow"
                        "$npm_prefix/iflow.cmd"
                        "$APPDATA/npm/iflow.cmd"
                    )
                    ;;
                *)
                    # Unix-like platforms (Linux/macOS)
                    local npm_prefix=$(npm config get prefix 2>/dev/null || echo "$HOME/.npm-global")
                    local bin_path="$npm_prefix/bin/iflow"
                    
                    # Remove iflow binary if exists
                    if [ -f "$bin_path" ]; then
                        rm -f "$bin_path" && log_info "Removed $bin_path"
                    fi
                    
                    # Remove from common Unix locations
                    local common_paths=(
                        "/usr/local/bin/iflow"
                        "$HOME/.npm-global/bin/iflow"
                        "$HOME/.local/bin/iflow"
                    )
                    ;;
            esac
            
            for path in "${common_paths[@]}"; do
                if [ -f "$path" ]; then
                    rm -f "$path" && log_info "Removed $path"
                fi
            done
        fi
        
        # Verify uninstallation
        if command_exists iflow; then
            log_warning "iFlow CLI still exists after uninstall attempt. Attempting to locate and remove it..."
            
            # Find the iflow executable
            local iflow_path=$(which iflow 2>/dev/null)
            if [ -n "$iflow_path" ] && [ -f "$iflow_path" ]; then
                log_info "Found iflow executable at: $iflow_path"
                if rm -f "$iflow_path"; then
                    log_success "Successfully removed iflow executable: $iflow_path"
                else
                    log_error "Failed to remove iflow executable: $iflow_path"
                fi
            else
                log_warning "Could not locate iflow executable path"
            fi
            
            # Check again after removal attempt
            if command_exists iflow; then
                log_warning "iFlow CLI still exists after manual removal. Continuing with installation..."
            else
                log_success "Successfully removed existing iFlow CLI"
            fi
        else
            log_success "Successfully removed existing iFlow CLI"
        fi
    fi
}

# Install iFlow CLI
install_iFlow_cli() {
    # Uninstall existing installation first
    uninstall_existing_iflow
    
    log_info "Installing iFlow CLI..."
    
    # Install iFlow CLI
    if npm i -g @iflow-ai/iflow-cli@latest; then
        log_success "iFlow CLI installed successfully!"
        
        # Verify installation
        if command_exists iflow; then
            log_info "iFlow CLI version: $(iflow --version 2>/dev/null || echo 'version info not available')"
        else
            log_warning "iFlow CLI installed but command not found. You may need to reload your shell or add npm global bin to PATH."
            log_info "Try running: export PATH=\"\$PATH:$(npm config get prefix)/bin\""
        fi
    else
        log_error "Failed to install iFlow CLI!"
        exit 1
    fi
}

# Main function
main() {
    echo "=========================================="
    echo "   iFlow CLI Installation Script"
    echo "   Optimized for Development Machines"
    echo "=========================================="
    echo ""
    
    # Check system
    log_info "System: $(uname -s) $(uname -r)"
    log_info "Shell: $(basename "$SHELL")"
    if is_dev_machine; then
        log_info "Development machine environment detected"
    fi
    
    # Install uv first (continue even if it fails)
    install_uv || log_warning "UV installation failed, but continuing with the rest of the installation..."
    
    # Check and install Node.js
    check_and_install_nodejs
    
    # Ensure npm command is available
    if ! command_exists npm; then
        log_error "npm command not found after Node.js installation!"
        log_info "Please run: source $(get_shell_profile)"
        exit 1
    fi
    
    # Install iFlow CLI
    install_iFlow_cli
    
    echo ""
    echo "=========================================="
    log_success "Installation completed successfully!"
    echo "=========================================="
    echo ""
    
    log_info "To start using iFlow CLI, run:"
    local current_shell=$(basename "$SHELL")
    case "$current_shell" in
        bash)
            echo "  source ~/.bashrc"
            ;;
        zsh) 
            echo "  source ~/.zshrc"
            ;;
        fish)
            echo "  source ~/.config/fish/config.fish"
            ;;
        *)
            echo "  source ~/.profile  # or reload your shell"
            ;;
    esac
    echo "  iflow"
    echo ""
    
    # Try to run iFlow CLI
    if command_exists iflow; then
        log_info "Starting iFlow CLI..."
        iflow
    else
        log_info "Please reload your shell and run 'iflow' command."
    fi
}
 
# Error handling
trap 'log_error "An error occurred. Installation aborted."; exit 1' ERR
 
# Run main function
main
