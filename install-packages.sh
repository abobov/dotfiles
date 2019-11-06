#!/bin/sh

set -e

echo Installing base packages
xargs -a packages.debian sudo apt-get install -y
echo Changing shell to zsh
[ -n "$ZSH_VERSION" ] || chsh -s $(which zsh)
