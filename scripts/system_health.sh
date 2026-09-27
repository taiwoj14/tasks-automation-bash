#!/bin/bash

# ==========================================
# Task 2: System Health Monitor
# ==========================================

# Thresholds
DISK_THRESHOLD=80
MEMORY_THRESHOLD=80
PROCESS_THRESHOLD=200

echo "=========================================="
echo "        SYSTEM HEALTH MONITOR"
echo "=========================================="
echo

# ------------------------------------------
# Disk Usage Check
# ------------------------------------------

DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Disk Usage: ${DISK_USAGE}%"
echo "Disk Threshold: ${DISK_THRESHOLD}%"

if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "WARNING: Disk usage is above the threshold."
    DISK_STATUS=1
else
    echo "OK: Disk usage is within the safe limit."
    DISK_STATUS=0
fi

echo

# ------------------------------------------
# Memory Usage Check
# ------------------------------------------

MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.0f", ($3/$2)*100}')

echo "Memory Usage: ${MEMORY_USAGE}%"
echo "Memory Threshold: ${MEMORY_THRESHOLD}%"

if [ "$MEMORY_USAGE" -ge "$MEMORY_THRESHOLD" ]; then
    echo "WARNING: Memory usage is above the threshold."
    MEMORY_STATUS=1
else
    echo "OK: Memory usage is within the safe limit."
    MEMORY_STATUS=0
fi

echo

# ------------------------------------------
# Process Count Check
# ------------------------------------------

PROCESS_COUNT=$(ps -e --no-headers | wc -l)

echo "Running Processes: ${PROCESS_COUNT}"
echo "Process Threshold: ${PROCESS_THRESHOLD}"

if [ "$PROCESS_COUNT" -ge "$PROCESS_THRESHOLD" ]; then
    echo "WARNING: Process count is above the threshold."
    PROCESS_STATUS=1
else
    echo "OK: Process count is within the expected range."
    PROCESS_STATUS=0
fi

echo

# ------------------------------------------
# Determine Overall Health
# ------------------------------------------

if [ "$DISK_STATUS" -eq 0 ] && \
   [ "$MEMORY_STATUS" -eq 0 ] && \
   [ "$PROCESS_STATUS" -eq 0 ]; then
    HEALTH_STATUS=0
else
    HEALTH_STATUS=1
fi

# ------------------------------------------
# Health Summary
# ------------------------------------------

echo "=========================================="
echo "             HEALTH SUMMARY"
echo "=========================================="

if [ "$HEALTH_STATUS" -eq 0 ]; then
    echo "SYSTEM STATUS: HEALTHY"
else
    echo "SYSTEM STATUS: WARNING"
fi

echo "Exit Code: $HEALTH_STATUS"
echo "=========================================="

exit "$HEALTH_STATUS"