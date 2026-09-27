#!/bin/bash

# ==========================================
# Task 1: Directory and File Automation
# ==========================================

# Base directory for the project
BASE_DIR="$HOME/tasks-automation-bash/automation-data"

# Create a timestamp for the generated file
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Define directory structure
REPORTS_DIR="$BASE_DIR/reports"
LOGS_DIR="$BASE_DIR/logs"
DATA_DIR="$BASE_DIR/data"

# Define the dynamic report filename
REPORT_FILE="$REPORTS_DIR/report_$TIMESTAMP.txt"

echo "Starting directory and file automation..."

# Create nested directories
mkdir -p "$REPORTS_DIR"
mkdir -p "$LOGS_DIR"
mkdir -p "$DATA_DIR"

echo "Directories created successfully."

# Create a log file if it does not already exist
LOG_FILE="$LOGS_DIR/automation.log"

if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
    echo "Log file created: $LOG_FILE"
else
    echo "Log file already exists: $LOG_FILE"
fi

# Create a timestamped report
echo "Bash Automation Report" > "$REPORT_FILE"
echo "======================" >> "$REPORT_FILE"
echo "Generated on: $(date)" >> "$REPORT_FILE"
echo "Hostname: $(hostname)" >> "$REPORT_FILE"
echo "User: $USER" >> "$REPORT_FILE"

# Record the operation in the log
echo "$(date): Automation script executed successfully." >> "$LOG_FILE"

echo "Report created: $REPORT_FILE"
echo "Automation completed successfully."