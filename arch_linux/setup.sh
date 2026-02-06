#!/bin/bash

# Exit on error
set -e

echo "🚀 Starting Arch Meta-Package Setup..."

# 1. Ensure base-devel and git are installed
echo "📦 Checking for build essentials..."
sudo pacman -S --needed --noconfirm base-devel git

# 2. Navigate to the meta-package directory
# Adjust the path below to where your PKGBUILD lives relative to this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_DIR="$SCRIPT_DIR"

if [ -d "$PACKAGE_DIR" ]; then
  cd "$PACKAGE_DIR"
else
  echo "❌ Error: Could not find directory $PACKAGE_DIR"
  exit 1
fi

# 3. Build and Install the meta-package
echo "🔨 Building and installing your system meta-package..."
# -s: installs dependencies, -i: installs the package,
# -r: removes build-time deps, --noconfirm: stays automated
makepkg -sir --noconfirm

echo "✅ System auto-configuration complete!"
