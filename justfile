# Simple Justfile to replace shell scripts

# Determine current host for flake target
HOST := `hostname`

# Optional flake path; default to current directory
FLAKE ?= .

# Default recipe prints help
default:
	@just --list

# Rebuild the system. ACTION can be: switch (default), test, boot, dry-run, build
rebuild ACTION="switch":
	sudo nixos-rebuild {{ACTION}} --flake {{FLAKE}}#{{HOST}}

# Update flake inputs, rebuild, and cleanup old generations
# Usage examples:
#   just update
#   just update cleanup_days=7
#   just update dry=true
update cleanup_days="3" dry="false":
	@if [ "{{dry}}" = "true" ]; then \
		echo "[DRY] nix flake update"; \
		echo "[DRY] sudo nixos-rebuild switch --flake {{FLAKE}}#{{HOST}}"; \
		echo "[DRY] nix-env --delete-generations +{{cleanup_days}}"; \
		echo "[DRY] sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +{{cleanup_days}}"; \
		echo "[DRY] nix-collect-garbage -d"; \
		echo "[DRY] sudo nix-store --optimise"; \
	else \
		nix flake update && \
		sudo nixos-rebuild switch --flake {{FLAKE}}#{{HOST}} && \
		nix-env --delete-generations +{{cleanup_days}} && \
		sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +{{cleanup_days}} && \
		nix-collect-garbage -d && \
		sudo nix-store --optimise; \
	fi

# Cleanup old generations and optimize store
# Usage: just cleanup [days=7]
cleanup days="7":
	nix-env --delete-generations +{{days}}
	sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +{{days}}
	nix-collect-garbage -d
	sudo nix-store --optimise

# Dry-run cleanup: show what would be done and list old generations
cleanup-dry days="7":
	@echo "[DRY] Would delete user generations older than {{days}} days"
	@echo "[DRY] Would delete system generations older than {{days}} days"
	@nix-env --list-generations | grep -E "^[0-9]+.*\\([0-9]+ days old\\)" | grep -E "\\([0-9]{2,}+ days old\\)" || true
	@sudo nix-env -p /nix/var/nix/profiles/system --list-generations | grep -E "^[0-9]+.*\\([0-9]+ days old\\)" | grep -E "\\([0-9]{2,}+ days old\\)" || true
	@echo "[DRY] Would run: nix-collect-garbage -d"
	@echo "[DRY] Would run: sudo nix-store --optimise"
