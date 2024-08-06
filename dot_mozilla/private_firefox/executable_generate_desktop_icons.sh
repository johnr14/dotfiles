#!/bin/bash

# Set the path to the Firefox profiles directory
PROFILE_DIR=~/.mozilla/firefox

# Set the path to the Desktop directory
DESKTOP_DIR=~/Desktop

# Loop through each profile entry in profiles.ini
while IFS='=' read -r key value; do
  # Check if the key is "Path" and the value contains a dot (.)
  if [ "$key" == "Path" ] && [[ "$value" == *.* ]]; then
    # Extract the profile name from the path
    profile_name="${value##*.}"
    # Create the .desktop file
    echo "[Desktop Entry]" > "$DESKTOP_DIR/FF-$profile_name.desktop"
    echo "Type=Application" >> "$DESKTOP_DIR/FF-$profile_name.desktop"
    echo "Name=$profile_name" >> "$DESKTOP_DIR/FF-$profile_name.desktop"
    echo "Comment=my $profile_name profile" >> "$DESKTOP_DIR/FF-$profile_name.desktop"
    echo "Exec=firefox -Profile $value -no-remote" >> "$DESKTOP_DIR/FF-$profile_name.desktop"
    echo "Path=~/." >> "$DESKTOP_DIR/FF-$profile_name.desktop"
    echo "Icon=firefox" >> "$DESKTOP_DIR/FF-$profile_name.desktop"
    echo "Terminal=false" >> "$DESKTOP_DIR/FF-$profile_name.desktop"
    echo "StartupNotify=false" >> "$DESKTOP_DIR/FF-$profile_name.desktop"
  fi
done < "$PROFILE_DIR/profiles.ini"
