#!/bin/bash

# Function to check if a package is installed
is_installed() {
    dpkg -s $1 &> /dev/null

    if [ $? -eq 0 ]; then
        echo "$1 is already installed."
    else
        echo "$1 is not installed."
        return 1
    fi
}

# Check if Google Chrome is installed
if ! is_installed google-chrome-stable; then
    echo "Installing Google Chrome..."
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    dpkg -i google-chrome-stable_current_amd64.deb
    apt-get install -f
fi

# Check if Microsoft Edge is installed
if ! is_installed microsoft-edge-dev; then
    echo "Installing Microsoft Edge..."
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list
    apt update
    apt install microsoft-edge-dev
fi

echo "Installation completed."

