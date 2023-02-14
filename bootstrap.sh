#!/bin/bash
#
# Development environment setup bootstrap script
#

# Install brew dependencies
brew bundle

#Open Docker, only if is not running
pgrep -f Docker.app > /dev/null || (echo "Starting Docker.app" && open /Applications/Docker.app)

# Open Project in Xcode
xed Package.swift