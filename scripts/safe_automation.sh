#!/bin/bash

# ==========================================
# Task 4: Safe Bash Automation
# ==========================================

# Stop the script when a command fails
set -e

# Treat unset variables as errors
set -u

# Detect failures inside pipelines
set -o pipefail

# ------------------------------------------
# Cleanup Function
# ------------------------------------------

cleanup() {
    echo
    echo "Cleaning up temporary resources..."

    if [ -n "${TEMP_DIR:-}" ] && [ -d "$TEMP_DIR" ]; then
        rm -rf "$TEMP_DIR"
        echo "Cleanup completed."
    else
        echo "No temporary resources to clean up."
    fi
}

# ------------------------------------------
# Interrupt Handler
# ------------------------------------------

handle_interrupt() {
    echo
    echo "Script interrupted by user."
    exit 130
}

# Clean up when the script exits
trap cleanup EXIT

# Handle Ctrl+C
trap handle_interrupt INT

# ------------------------------------------
# Input Validation
# ------------------------------------------

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

TARGET_DIR="$1"

if [ -z "$TARGET_DIR" ]; then
    echo "ERROR: Directory path cannot be empty."
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "ERROR: Directory does not exist: $TARGET_DIR"
    exit 1
fi

# ------------------------------------------
# Temporary Workspace
# ------------------------------------------

TEMP_DIR=$(mktemp -d)

echo "=========================================="
echo "       SAFE BASH AUTOMATION"
echo "=========================================="
echo
echo "Target directory: $TARGET_DIR"
echo "Temporary directory: $TEMP_DIR"
echo
# ------------------------------------------
# Generate System Information
# ------------------------------------------

REPORT_FILE="$TEMP_DIR/system_report.txt"

{
    echo "System Automation Report"
    echo "========================="
    echo "Date: $(date)"
    echo "Hostname: $(hostname)"
    echo "User: $USER"
    echo
    echo "Disk Usage:"
    df -h "$TARGET_DIR"
    echo
    echo "Memory Usage:"
    free -h
} > "$REPORT_FILE"

echo "System report created successfully."
echo "Report location: $REPORT_FILE"

# ------------------------------------------
# Display Report
# ------------------------------------------

echo
echo "========== SYSTEM REPORT =========="
cat "$REPORT_FILE"

echo
echo "Safe automation completed successfully."
