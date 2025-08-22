#!/bin/bash

# Install script for setting up the environment

# 1. Define source and target directories
SOURCE_DIR="$(pwd)"
FIREFOX_PROFILE_DIR="$HOME/Library/Application Support/Firefox/Profiles"
FIREFOX_INSTALL_DIR="/Applications/Firefox.app/Contents/Resources"

# 2. Find the default Firefox profile directory
PROFILE_DIR=$(find "$FIREFOX_PROFILE_DIR" -maxdepth 1 -type d -name "*.default-release" | head -n 1)

# Ensure the target directories exist
if [ ! -d "$FIREFOX_PROFILE_DIR" ]; then
    echo "Firefox profile directory does not exist. Please ensure Firefox is installed."
    exit 1
fi
if [ ! -d "$FIREFOX_INSTALL_DIR" ]; then
    echo "Firefox installation directory does not exist. Please ensure Firefox is installed."
    exit 1
fi
if [ -z "$PROFILE_DIR" ]; then
    echo "Firefox profile directory not found. Please ensure Firefox is installed and you have a profile."
    exit 1
fi

# Print the directories being used
echo "Source                    $SOURCE_DIR"
echo "Target - Firefox Install  $FIREFOX_INSTALL_DIR"
echo "Target - Firefox Profile  $PROFILE_DIR"

# 3. Symlink the chrome directory
if [ -d "$SOURCE_DIR/chrome" ]; then
    echo ""

    # Ask before overwriting if target exists
    if [ -d "$PROFILE_DIR/chrome" ]; then
        read -p "Target directory $PROFILE_DIR/chrome already exists. Overwrite? (y/n) " choice
        if [[ ! "$choice" =~ ^[Yy]$ ]]; then
            echo "Aborting."
            exit 1
        fi

        # Remove existing directory with .bak extension
        mv "$PROFILE_DIR/chrome" "$PROFILE_DIR/chrome.bak"
        echo "Moved existing chrome directory to chrome.bak"
    fi

    ln -sfn "$SOURCE_DIR/chrome" "$PROFILE_DIR/chrome"

    # Throw error if symlink creation fails
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create symlink for chrome"
        exit 1
    fi

    echo "Symlinked ./chrome"
    ls -l "$PROFILE_DIR/chrome"
else
    echo "Source chrome directory not found."
fi

# 4. Symlink config/config.js
if [ -f "$SOURCE_DIR/config/config.js" ]; then
    echo ""

    # Ask before overwriting if target exists
    if [ -f "$FIREFOX_INSTALL_DIR/config.js" ]; then
        read -p "Target file $FIREFOX_INSTALL_DIR/config.js already exists. Overwrite? (y/n) " choice
        if [[ ! "$choice" =~ ^[Yy]$ ]]; then
            echo "Aborting."
            exit 1
        fi

        # Remove existing file with .bak extension
        mv "$FIREFOX_INSTALL_DIR/config.js" "$FIREFOX_INSTALL_DIR/config.js.bak"
        echo "Moved existing config.js to config.js.bak"
    fi

    ln -sfn "$SOURCE_DIR/config/config.js" "$FIREFOX_INSTALL_DIR/config.js"

    # Throw error if symlink creation fails
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create symlink for config.js"
        exit 1
    fi

    echo "Symlinked ./config/config.js"
    ls -l "$FIREFOX_INSTALL_DIR/config.js"
else
    echo "Source config.js not found."
fi

# 5. Symlink the config/defaults directory
if [ -d "$SOURCE_DIR/config/defaults" ]; then
    echo ""

    # Ask before overwriting if target exists
    if [ -d "$FIREFOX_INSTALL_DIR/defaults" ]; then
        read -p "Target directory $FIREFOX_INSTALL_DIR/defaults already exists. Overwrite? (y/n) " choice
        if [[ ! "$choice" =~ ^[Yy]$ ]]; then
            echo "Aborting."
            exit 1
        fi

        # Remove existing directory with .bak extension
        mv "$FIREFOX_INSTALL_DIR/defaults" "$FIREFOX_INSTALL_DIR/defaults.bak"
        echo "Moved existing defaults directory to defaults.bak"
    fi

    ln -sfn "$SOURCE_DIR/config/defaults" "$FIREFOX_INSTALL_DIR/defaults"

    # Throw error if symlink creation fails
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create symlink for defaults"
        exit 1
    fi

    echo "Symlinked ./config/defaults"
    ls -l "$FIREFOX_INSTALL_DIR/defaults"
else
    echo "Source defaults directory not found."
fi

echo ""
echo "Installation complete."

# Uninstall instructions
echo ""
echo "To uninstall, run the following commands:"
echo "rm -rf \"$PROFILE_DIR/chrome\""
echo "rm -f \"$FIREFOX_INSTALL_DIR/config.js\""
echo "rm -rf \"$FIREFOX_INSTALL_DIR/defaults\""
echo ""
echo "Note: You may need to restart Firefox for changes to take effect."

# Open `about:support` in Firefox to clear startup cache

echo ""
echo "Opening \`about:support\` in Firefox..."
echo "Click \`Clear Startup Cache\` in Firefox to apply changes."

open -a "Firefox" "about:support"
