#!/usr/bin/env bash

# NixOS Rebuild Script
# Usage: ./rebuild.sh [switch|test|boot|dry-run|build]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Parse arguments
ACTION="${1:-switch}"
HOSTNAME=$(hostname)

# Validate action
case "$ACTION" in
    switch|test|boot|dry-run|build)
        ;;
    *)
        print_error "Invalid action: $ACTION"
        echo "Usage: $0 [switch|test|boot|dry-run|build]"
        echo "  switch   - Build and activate configuration (default)"
        echo "  test     - Build and activate temporarily"
        echo "  boot     - Build and activate on next boot"
        echo "  dry-run  - Show what would be done"
        echo "  build    - Build only, don't activate"
        exit 1
        ;;
esac

# Change to the NixOS configuration directory
cd /etc/nixos

print_status "Starting NixOS rebuild with action: $ACTION"
print_status "Current hostname: $HOSTNAME"

# Check if we're in a git repository and show current commit
if [ -d .git ]; then
    CURRENT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
    print_status "Current commit: $CURRENT_COMMIT"
fi

# Construct the flake target
FLAKE_TARGET=".#$HOSTNAME"

# Run the rebuild command
print_status "Running: sudo nixos-rebuild $ACTION --flake $FLAKE_TARGET"

if sudo nixos-rebuild "$ACTION" --flake $FLAKE_TARGET; then
    print_success "NixOS rebuild completed successfully!"
    
    if [ "$ACTION" = "switch" ]; then
        print_status "System has been rebuilt and activated"
    elif [ "$ACTION" = "test" ]; then
        print_warning "Configuration activated temporarily (will revert on reboot)"
    elif [ "$ACTION" = "boot" ]; then
        print_status "Configuration will be activated on next boot"
    elif [ "$ACTION" = "build" ]; then
        print_status "Configuration built successfully (not activated)"
    fi
else
    print_error "NixOS rebuild failed!"
    exit 1
fi
