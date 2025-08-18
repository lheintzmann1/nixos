#!/usr/bin/env bash
# Script de mise à jour complète

set -e

cd /etc/nixos

echo "🔄 Mise à jour des inputs du flake..."
nix flake update

echo "🔧 Reconstruction du système..."
sudo nixos-rebuild switch --flake .

echo "🧹 Nettoyage..."
./scripts/cleanup.sh 3

echo "✅ Mise à jour terminée!"