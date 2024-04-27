#!/bin/bash

# Create temporary directory
TMPDIR=$(mktemp -d)

echo "Downloading wp-cli.phar..."

# Download to temporary directory
curl -o "$TMPDIR/wp-cli.phar" https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Check download success
if [ $? -eq 0 ]; then
  echo "Download complete."

  # Install wp-cli
  sudo install "$TMPDIR/wp-cli.phar" /usr/local/bin/wp

  if [ $? -eq 0 ]; then
    echo "WP CLI installed successfully."
  else
    echo "Failed to install wp-cli."
  fi
else
  echo "Failed to download wp-cli.phar"
fi

# Clean up temporary directory
rm -rf "$TMPDIR"

