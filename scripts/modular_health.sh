#!/bin/bash

# ==========================================
# Task 3: Modular System Health Monitor
# ==========================================

# Load reusable functions
source "$(dirname "$0")/functions.sh"

# Thresholds
DISK_THRESHOLD=80
MEMORY_THRESHOLD=80
PROCESS_THRESHOLD=200

echo "=========================================="
echo "     MODULAR SYSTEM HEALTH MONITOR"
echo "=========================================="
echo

# Run health checks
check_disk_usage "$DISK_THRESHOLD"
DISK_STATUS=$?

echo

check_memory_usage "$MEMORY_THRESHOLD"
MEMORY_STATUS=$?

echo

check_process_count "$PROCESS_THRESHOLD"
PROCESS_STATUS=$?

echo

# Determine overall health
if [ "$DISK_STATUS" -eq 0 ] && \
   [ "$MEMORY_STATUS" -eq 0 ] && \
   [ "$PROCESS_STATUS" -eq 0 ]; then
    HEALTH_STATUS=0
else
    HEALTH_STATUS=1
fi

# Display summary
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