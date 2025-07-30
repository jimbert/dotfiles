#!/bin/bash

# Setup xcape for Caps Lock to act as Escape when tapped, Control when held

echo "Setting up xcape..."

# Check if xcape is installed
if ! command -v xcape &> /dev/null; then
    echo "xcape is not installed. Please install it first:"
    echo "  sudo apt-get install xcape"
    exit 1
fi

# Map Caps Lock to Control
setxkbmap -option ctrl:nocaps

# Kill any existing xcape processes
killall xcape 2>/dev/null

# Start xcape with Control_L mapped to Escape
xcape -e 'Control_L=Escape'

# Create autostart directory if it doesn't exist
mkdir -p ~/.config/autostart

# Create autostart entry
cat > ~/.config/autostart/xcape.desktop << 'EOF'
[Desktop Entry]
Type=Application
Exec=sh -c "setxkbmap -option ctrl:nocaps && xcape -e 'Control_L=Escape'"
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Xcape
Comment=Make Caps Lock act as Escape when tapped, Control when held
EOF

chmod +x ~/.config/autostart/xcape.desktop

echo "✓ Caps Lock is now Control when held, Escape when tapped"
echo "✓ Configuration will persist across reboots"