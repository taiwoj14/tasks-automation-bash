# Bash Automation Script Explanations

## 1. create_structure.sh

Automates the creation of a nested directory structure and generates timestamped system reports.

### Key Bash concepts used

- Variables
- Command substitution
- `mkdir -p`
- `touch`
- `echo`
- Conditional statements
- Timestamp generation
- Idempotent directory creation

The script creates the required reports, logs, and data directories. It also creates an automation log and generates a timestamped system report.

---

## 2. system_health.sh

Monitors basic system health using disk usage, memory usage, and process count.

### Key Bash concepts used

- `df`
- `free`
- `ps`
- `awk`
- Variables
- `if` statements
- Thresholds
- Exit codes
- `$?`

The script checks disk usage, memory usage, and process count against configured thresholds.

A successful health check returns exit code `0`. A warning condition returns exit code `1`.

---

## 3. functions.sh

Provides reusable Bash functions for system health monitoring.

### Functions

- `check_disk_usage`
- `check_memory_usage`
- `check_process_count`

The functions demonstrate:

- Function arguments
- `local` variables
- Return status codes
- Code reuse

---

## 4. modular_health.sh

Uses the reusable functions from `functions.sh` to perform system health checks.

### Key Bash concepts used

- External function libraries
- `source`
- Function arguments
- Return values
- Exit status handling

The script combines the results of the individual health checks and reports an overall system status.

---

## 5. safe_automation.sh

Demonstrates safe and defensive Bash scripting practices.

### Safety features

- `set -e` stops execution when a command fails.
- `set -u` treats unset variables as errors.
- `set -o pipefail` detects failures inside pipelines.
- Input validation prevents invalid directory paths.
- `mktemp` creates a temporary workspace.
- `trap ... EXIT` performs cleanup when the script exits.
- `trap ... INT` handles Ctrl+C interruptions.

### Validation tests

The script was tested with:

- A valid directory
- No directory argument
- A non-existent directory
- Ctrl+C interruption

The cleanup function successfully handled normal execution and early termination.