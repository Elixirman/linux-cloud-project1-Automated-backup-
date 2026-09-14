#!/bin/bash

# ============================================
# Automated Backup Script
# Compresses a target directory with a timestamp
# ============================================

# --- Configuration (Variables) ---
SOURCE_DIR="/var/www/html"
BACKUP_DIR="$HOME/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${BACKUP_DIR}/backup_${TIMESTAMP}.tar.gz"

# --- Error Handling: Does the source exist? ---
if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Source directory '$SOURCE_DIR' does not exist."
    exit 1
fi

# --- Error Handling: Does the destination exist? ---
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Backup directory not found. Creating '$BACKUP_DIR'..."
    mkdir -p "$BACKUP_DIR"
    if [ $? -ne 0 ]; then
        echo "ERROR: Failed to create backup directory."
        exit 1
    fi
fi

# --- Perform the Backup ---
echo "Starting backup of '$SOURCE_DIR'..."
tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# --- Check if tar succeeded ---
if [ $? -eq 0 ]; then
    echo "SUCCESS: Backup created at '$BACKUP_FILE'"
    ls -lh "$BACKUP_FILE"
    exit 0
else
    echo "ERROR: Backup failed."
    exit 1
fi
