# Tasks Automation Using Bash Scripting

## Overview

This project demonstrates practical Bash scripting techniques for automating file-system operations, monitoring Linux system resources, creating reusable functions, and implementing safe scripting practices.

The project was developed and tested in an Ubuntu environment running through WSL on Windows.

## Project Objectives

The project focuses on five areas:

1. File system automation
2. System monitoring
3. Modular Bash programming
4. Script safety
5. Professional project organization

---

## Project Structure

```text
tasks-automation-bash/
├── README.md
├── automation-data/
│   ├── data/
│   ├── logs/
│   │   └── automation.log
│   └── reports/
├── docs/
│   ├── completion-checklist.md
│   └── script-explanations.md
├── logs/
├── screenshots/
│   ├── task-1-generated-files.png
│   ├── task-1-script-execution.png
│   ├── task-2-exit-code.png
│   ├── task-2-health-monitor.png
│   ├── task-3-functions.png
│   └── task-4-trap-cleanup.png
└── scripts/
    ├── create_structure.sh
    ├── functions.sh
    ├── modular_health.sh
    ├── safe_automation.sh
    └── system_health.sh
```

---

## Task 1 — File System Automation

The `create_structure.sh` script automates the creation of nested directories and generates timestamped system reports.

### Concepts Demonstrated

- Bash variables
- Command substitution
- `mkdir -p`
- `touch`
- `echo`
- Conditional statements
- Timestamp generation
- Idempotent directory creation

The script creates:

```text
automation-data/
├── data/
├── logs/
│   └── automation.log
└── reports/
```

It also records script executions in the automation log and generates timestamped reports.

---

## Task 2 — System Monitoring

The `system_health.sh` script monitors basic Linux system resources.

### Metrics Monitored

- Disk usage
- Memory usage
- Running processes

### Commands Used

```bash
df
free
ps
awk
```

The script compares system measurements against configured thresholds and returns an appropriate exit status.

A healthy system returns:

```text
Exit Code: 0
```

A warning condition returns:

```text
Exit Code: 1
```

---

## Task 3 — Modular Bash Programming

The project uses an external function library to demonstrate reusable Bash code.

### `functions.sh`

Contains the following reusable functions:

```text
check_disk_usage
check_memory_usage
check_process_count
```

### `modular_health.sh`

Loads the function library using:

```bash
source "$(dirname "$0")/functions.sh"
```

The functions use arguments, `local` variables, conditional logic, and return status codes.

The `modular_health.sh` script calls these reusable functions and combines their results to determine the overall system health status.

This demonstrates how Bash scripts can be organized into reusable components rather than placing all logic into one large script.

---

## Task 4 — Script Safety

The `safe_automation.sh` script demonstrates defensive Bash scripting practices.

### Safety Settings

```bash
set -e
set -u
set -o pipefail
```

These settings help detect command failures, unset variables, and pipeline failures.

### Input Validation

The script validates:

- Number of arguments
- Directory path
- Directory existence

### Temporary Workspace

A temporary directory is created using:

```bash
mktemp -d
```

The temporary workspace is removed automatically when the script exits.

### Signal Handling

The script uses `trap` to handle:

```text
EXIT
INT
```

`EXIT` ensures cleanup occurs when the script finishes or exits.

`INT` handles a user pressing `Ctrl+C`.

### Safety Tests Performed

The script was tested with:

- A valid directory
- No directory argument
- A non-existent directory
- `Ctrl+C` interruption

All tests completed with the expected behavior.

---

## Verification

The scripts were validated using Bash syntax checking.

Example:

```bash
bash -n scripts/safe_automation.sh
```

The safety script passed syntax validation with no errors.

Example system monitoring results observed during testing:

```text
Disk Usage: 5%
Memory Usage: approximately 33%
Running Processes: approximately 97–99
SYSTEM STATUS: HEALTHY
Exit Code: 0
```

These values are environment-dependent and may change between executions.

---

## Screenshots

Visual evidence from the project is stored in the `screenshots/` directory.

The screenshots demonstrate:

- Task 1 script execution
- Task 1 generated files
- Task 2 system monitoring
- Task 2 exit code
- Task 3 reusable functions
- Task 4 interrupt handling and cleanup

---

## Documentation

Additional technical documentation is available in:

```text
docs/script-explanations.md
```

The project completion checklist is available in:

```text
docs/completion-checklist.md
```

---

## Learning Outcomes

This project demonstrates practical Bash automation skills including:

- File-system automation
- Linux system monitoring
- Variables and command substitution
- Conditional statements
- Functions
- Function arguments
- External function libraries
- Exit codes
- Input validation
- Error handling
- Temporary resource management
- Signal handling with `trap`
- Professional project organization

---

## Author

**Taiwo Joseph**
