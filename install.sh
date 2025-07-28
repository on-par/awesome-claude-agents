#!/bin/bash

# Awesome Claude Agents Installer
# Usage: ./install.sh [agent-name|suite-name] [agent-name...]
# Example: ./install.sh tdd-suite
# Example: ./install.sh tdd-orchestrator tdd-red

set -e

# Configuration
REPO_URL="https://raw.githubusercontent.com/on-par-dev/awesome-claude-agents/main"
AGENTS_DIR=".claude/agents"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Agent definitions - using simpler format for compatibility
AGENT_LIST="tdd-orchestrator tdd-red tdd-green tdd-refactor tdd-git"
TDD_SUITE_AGENTS="tdd-orchestrator tdd-red tdd-green tdd-refactor tdd-git"

get_agent_path() {
    case "$1" in
        "tdd-orchestrator") echo "tdd-suite/tdd-orchestrator.md" ;;
        "tdd-red") echo "tdd-suite/tdd-red.md" ;;
        "tdd-green") echo "tdd-suite/tdd-green.md" ;;
        "tdd-refactor") echo "tdd-suite/tdd-refactor.md" ;;
        "tdd-git") echo "tdd-suite/tdd-git.md" ;;
        *) echo "" ;;
    esac
}

is_valid_agent() {
    local agent="$1"
    for valid_agent in $AGENT_LIST; do
        if [[ "$agent" == "$valid_agent" ]]; then
            return 0
        fi
    done
    return 1
}

is_suite() {
    [[ "$1" == "tdd-suite" ]]
}

get_suite_agents() {
    case "$1" in
        "tdd-suite") echo "$TDD_SUITE_AGENTS" ;;
        *) echo "" ;;
    esac
}

print_usage() {
    echo "Usage: $0 [agent-name|suite-name] [agent-name...]"
    echo ""
    echo "Available agents:"
    for agent in $AGENT_LIST; do
        echo "  $agent"
    done
    echo ""
    echo "Available suites:"
    echo "  tdd-suite ($TDD_SUITE_AGENTS)"
    echo ""
    echo "Examples:"
    echo "  $0 tdd-suite                    # Install complete TDD suite"
    echo "  $0 tdd-orchestrator             # Install single agent"
    echo "  $0 tdd-red tdd-green            # Install multiple agents"
}

log() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

create_agents_dir() {
    if [[ ! -d "$AGENTS_DIR" ]]; then
        log "Creating $AGENTS_DIR directory..."
        mkdir -p "$AGENTS_DIR" || error "Failed to create $AGENTS_DIR directory"
    fi
}

download_agent() {
    local agent_name="$1"
    local source_path=$(get_agent_path "$agent_name")
    local url="$REPO_URL/$source_path"
    local dest="$AGENTS_DIR/$agent_name.md"
    
    if [[ -z "$source_path" ]]; then
        error "Unknown agent: $agent_name"
    fi
    
    log "Downloading $agent_name from $source_path..."
    
    # Test if URL is accessible first (but don't fail if it's a network issue)
    if ! curl -sSL --head "$url" > /dev/null 2>&1; then
        warn "Cannot access $url - this might be because the repo isn't published yet"
        warn "Trying download anyway..."
    fi
    
    if curl -sSL "$url" -o "$dest" 2>/dev/null; then
        # Verify the file was downloaded and has content
        if [[ -f "$dest" && -s "$dest" ]]; then
            success "Installed $agent_name"
        else
            error "Downloaded $agent_name but file is empty or missing"
        fi
    else
        error "Failed to download $agent_name from $url"
    fi
}

install_agent() {
    local name="$1"
    
    # Check if it's a suite first
    if is_suite "$name"; then
        log "Installing suite: $name"
        local suite_agents=$(get_suite_agents "$name")
        for agent in $suite_agents; do
            install_agent "$agent"
        done
        return
    fi
    
    # Check if it's a valid agent
    if ! is_valid_agent "$name"; then
        error "Unknown agent or suite: $name"
    fi
    
    # Check if already exists
    if [[ -f "$AGENTS_DIR/$name.md" ]]; then
        warn "$name already exists, overwriting..."
    fi
    
    download_agent "$name"
}

verify_installation() {
    log "Verifying installation..."
    local installed_count=0
    
    # Check if agents directory exists and has files
    if [[ ! -d "$AGENTS_DIR" ]]; then
        warn "No $AGENTS_DIR directory found"
        return
    fi
    
    # Count installed agents
    for agent_name in $AGENT_LIST; do
        if [[ -f "$AGENTS_DIR/$agent_name.md" ]]; then
            ((installed_count++))
            log "Found: $agent_name"
        fi
    done
    
    success "Found $installed_count Claude agents in $AGENTS_DIR"
    
    if [[ $installed_count -gt 0 ]]; then
        echo ""
        echo "To verify agents are available in Claude Code, run:"
        echo "  claude \"/agents\""
        echo ""
        echo "Example usage:"
        echo "  claude \"Use tdd-orchestrator to implement a calculator class\""
    else
        warn "No agents were successfully installed"
    fi
}

check_dependencies() {
    # Check for required tools
    if ! command -v curl >/dev/null 2>&1; then
        error "curl is required but not installed"
    fi
}

main() {
    check_dependencies
    
    if [[ $# -eq 0 ]]; then
        print_usage
        exit 1
    fi
    
    # Check if running from reasonable directory for a project
    if [[ ! -d ".git" && ! -f "package.json" && ! -f "pyproject.toml" && ! -f "Cargo.toml" && ! -f "go.mod" ]]; then
        warn "You might want to run this from your project root directory"
        echo "Current directory: $(pwd)"
        echo "Continuing in 3 seconds... (Ctrl+C to cancel)"
        sleep 3
    fi
    
    create_agents_dir
    
    # Install each requested agent/suite
    for arg in "$@"; do
        install_agent "$arg"
    done
    
    verify_installation
}

# Only run main if script is executed directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi