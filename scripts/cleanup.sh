#!/usr/bin/env bash

# NixOS Cleanup Script
# Usage: ./cleanup.sh [days] [--dry-run]

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
DAYS=7
DRY_RUN=false

for arg in "$@"; do
    case $arg in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [days] [--dry-run]"
            echo "  days     - Delete generations older than this many days (default: 7)"
            echo "  --dry-run - Show what would be done without actually doing it"
            exit 0
            ;;
        [0-9]*)
            DAYS=$arg
            shift
            ;;
    esac
done

print_status "NixOS Cleanup Script"
echo "This will:"
echo "  1. Delete user profiles older than $DAYS days"
echo "  2. Delete system generations older than $DAYS days"
echo "  3. Run garbage collection"
echo "  4. Optimize the Nix store"

if [ "$DRY_RUN" = true ]; then
    print_warning "DRY RUN MODE - No changes will be made"
fi

echo
read -p "Do you want to continue? [y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_status "Cleanup cancelled"
    exit 0
fi

# Show disk usage before cleanup
print_status "Disk usage before cleanup:"
df -h /nix

# Delete old user profiles
print_status "Cleaning user profiles older than $DAYS days..."
if [ "$DRY_RUN" = true ]; then
    nix-env --list-generations | grep -E "^[0-9]+.*\([0-9]+ days old\)" | grep -E "\([0-9]{2,}+ days old\)" || print_status "No old user profiles found"
else
    nix-env --delete-generations "+$DAYS"
fi

# Delete old system generations
print_status "Cleaning system generations older than $DAYS days..."
if [ "$DRY_RUN" = true ]; then
    sudo nix-env -p /nix/var/nix/profiles/system --list-generations | grep -E "^[0-9]+.*\([0-9]+ days old\)" | grep -E "\([0-9]{2,}+ days old\)" || print_status "No old system generations found"
else
    sudo nix-env -p /nix/var/nix/profiles/system --delete-generations "+$DAYS"
fi

# Run garbage collection
print_status "Running garbage collection..."
if [ "$DRY_RUN" = true ]; then
    print_status "Would run: nix-collect-garbage -d"
else
    nix-collect-garbage -d
fi

# Optimize store
print_status "Optimizing Nix store..."
if [ "$DRY_RUN" = true ]; then
    print_status "Would run: nix-store --optimise"
else
    sudo nix-store --optimise
fi

if [ "$DRY_RUN" = false ]; then
    # Show disk usage after cleanup
    print_status "Disk usage after cleanup:"
    df -h /nix
    
    print_success "Cleanup completed successfully!"
else
    print_status "Dry run completed"
fi
