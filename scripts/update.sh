#!/usr/bin/env bash

# NixOS Update Script
# Usage: ./update.sh [--dry-run] [--cleanup-days=N]

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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
DRY_RUN=false
CLEANUP_DAYS=3

for arg in "$@"; do
    case $arg in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --cleanup-days=*)
            CLEANUP_DAYS="${arg#*=}"
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [--dry-run] [--cleanup-days=N]"
            echo "  --dry-run        - Show what would be done without actually doing it"
            echo "  --cleanup-days=N - Delete generations older than N days (default: 3)"
            exit 0
            ;;
        *)
            print_error "Unknown argument: $arg"
            echo "Use --help for usage information"
            exit 1
            ;;
    esac
done

print_status "NixOS Update Script"
echo "This will:"
echo "  1. Update flake inputs"
echo "  2. Rebuild and switch to new configuration"
echo "  3. Run cleanup (delete generations older than $CLEANUP_DAYS days)"

if [ "$DRY_RUN" = true ]; then
    print_warning "DRY RUN MODE - No changes will be made"
fi

echo
read -p "Do you want to continue? [y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_status "Update cancelled"
    exit 0
fi

# Change to the NixOS configuration directory
cd /etc/nixos

# Check if we're in a git repository and show current commit
if [ -d .git ]; then
    CURRENT_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
    print_status "Current commit: $CURRENT_COMMIT"
fi

# Update flake inputs
print_status "Updating flake inputs..."
if [ "$DRY_RUN" = true ]; then
    print_status "Would run: nix flake update"
else
    if nix flake update; then
        print_success "Flake inputs updated successfully"
    else
        print_error "Failed to update flake inputs"
        exit 1
    fi
fi

# Rebuild system
print_status "Rebuilding system configuration..."
if [ "$DRY_RUN" = true ]; then
    print_status "Would run: sudo nixos-rebuild switch --flake ."
else
    if sudo nixos-rebuild switch --flake .; then
        print_success "System rebuilt and activated successfully"
    else
        print_error "System rebuild failed"
        exit 1
    fi
fi

# Run cleanup
print_status "Running cleanup..."
if [ "$DRY_RUN" = true ]; then
    print_status "Would run: ./scripts/cleanup.sh $CLEANUP_DAYS --dry-run"
    if [ -x "./scripts/cleanup.sh" ]; then
        ./scripts/cleanup.sh "$CLEANUP_DAYS" --dry-run
    else
        print_warning "Cleanup script not found or not executable: ./scripts/cleanup.sh"
    fi
else
    if [ -x "./scripts/cleanup.sh" ]; then
        ./scripts/cleanup.sh "$CLEANUP_DAYS"
        print_success "Cleanup completed"
    else
        print_warning "Cleanup script not found or not executable: ./scripts/cleanup.sh"
        print_status "Running manual cleanup..."
        nix-collect-garbage -d
        sudo nix-store --optimise
    fi
fi

if [ "$DRY_RUN" = false ]; then
    print_success "Update completed successfully!"
    print_status "System has been updated and is now running the latest configuration"
else
    print_status "Dry run completed"
fi