#!/bin/bash

# ==========================================
# Task 3: Reusable Bash Function Library
# ==========================================

# Check disk usage against a threshold
check_disk_usage() {
    local threshold="$1"
    local usage

    usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

    echo "Disk Usage: ${usage}%"
    echo "Disk Threshold: ${threshold}%"

    if [ "$usage" -ge "$threshold" ]; then
        echo "WARNING: Disk usage is above the threshold."
        return 1
    else
        echo "OK: Disk usage is within the safe limit."
        return 0
    fi
}

# Check memory usage against a threshold
check_memory_usage() {
    local threshold="$1"
    local usage

    usage=$(free | awk '/Mem:/ {printf "%.0f", ($3/$2)*100}')

    echo "Memory Usage: ${usage}%"
    echo "Memory Threshold: ${threshold}%"

    if [ "$usage" -ge "$threshold" ]; then
        echo "WARNING: Memory usage is above the threshold."
        return 1
    else
        echo "OK: Memory usage is within the safe limit."
        return 0
    fi
}

# Check process count against a threshold
check_process_count() {
    local threshold="$1"
    local count

    count=$(ps -e --no-headers | wc -l)

    echo "Running Processes: ${count}"
    echo "Process Threshold: ${threshold}"

    if [ "$count" -ge "$threshold" ]; then
        echo "WARNING: Process count is above the threshold."
        return 1
    else
        echo "OK: Process count is within the expected range."
        return 0
    fi
}