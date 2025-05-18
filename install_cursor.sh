#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting installation of Python and Cursor...${NC}"

# Update system
echo -e "${GREEN}Updating system packages...${NC}"
sudo pacman -Syu --noconfirm

# Install Python and pip
echo -e "${GREEN}Installing Python and pip...${NC}"
sudo pacman -S python python-pip --noconfirm

# Install required dependencies for Cursor
echo -e "${GREEN}Installing required dependencies...${NC}"
sudo pacman -S git base-devel --noconfirm

# Install yay (AUR helper) if not installed
if ! command -v yay &> /dev/null; then
    echo -e "${GREEN}Installing yay...${NC}"
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Install Cursor using yay
echo -e "${GREEN}Installing Cursor...${NC}"
yay -S cursor --noconfirm

# Verify installations
echo -e "${GREEN}Verifying installations...${NC}"
python3 --version
pip3 --version
cursor --version

echo -e "${GREEN}Installation completed!${NC}"
echo -e "You can now run Cursor by typing 'cursor' in your terminal" 