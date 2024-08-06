#!/bin/bash

# Set the path to the Firefox profiles directory
PROFILE_DIR=~/.mozilla/firefox

# Delete old profiles.ini if it exists
[ -f "$PROFILE_DIR/profiles.ini" ] && rm "$PROFILE_DIR/profiles.ini"

# Create the profiles.ini file if it doesn't exist
touch "$PROFILE_DIR/profiles.ini"

# Initialize profile counter
PROFILE_COUNT=0

# Loop through each profile directory
for profile in "$PROFILE_DIR"/*; do
  # Skip non-directory entries
  [ -d "$profile" ] && [[ "$profile" == *.* ]] || continue

  # Write the profile entry to profiles.ini
  echo "[Profile$PROFILE_COUNT]" >> "$PROFILE_DIR/profiles.ini"
  echo "Name=${profile##*.}" >> "$PROFILE_DIR/profiles.ini"
  echo "IsRelative=1" >> "$PROFILE_DIR/profiles.ini"
  echo "Path=$profile" >> "$PROFILE_DIR/profiles.ini"
  echo "" >> "$PROFILE_DIR/profiles.ini" # Add a blank line between profiles

  # Increment profile counter
  PROFILE_COUNT=$((PROFILE_COUNT + 1))
done
