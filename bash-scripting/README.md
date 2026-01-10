# Bash Scripting

This folder contains short, focused Bash scripts used for learning and practicing common shell techniques.

**Scripts**

| Script | What it does |
| ------ | ------------ |
| `age.sh` | Collects user input and applies basic logic using variables and numeric comparisons. |
| `backup_script.sh` | Automates a basic backup workflow to practice working with directories, copying, and repeatable scripting. |
| `basic_arithmetic.sh` | Performs arithmetic operations (add, subtract, multiply, divide) using shell arithmetic. |
| `conditional_check.sh` | Demonstrates `if` / `elif` / `else` and common file tests (e.g., `-f`, `-d`). |
| `file_operations.sh` | Practice creating, reading, appending, moving, and deleting files safely. |
| `menu_arithmetic.sh` | A menu-driven arithmetic script using loops and `case` statements for CLI interaction. |

**Supporting files**

- `multiline.txt` — sample multi-line input for testing text processing
- `hotfix.txt` — file used for file-operation exercises

**Key learnings**

- Capture and validate user input using `read` and shell variables
- Write conditional logic with `if`, `elif`, and `else`, and use file tests (`-f`, `-d`)
- Build interactive CLI scripts with loops and `case` statements
- Manage files and directories safely with standard Linux commands
- Automate repeatable tasks (backups, deployments, setup) with Bash

**One challenge I overcame**

I restructured the repository into a dedicated `bash-scripting` folder without losing Git history by using `git mv`, then committed and pushed the clean changes.

**Why Bash matters in DevOps**

Bash is widely available on Linux systems, CI runners, and containers. It enables:

- Quick automation of repetitive tasks
- Lightweight CI/CD scripting to glue tools together
- Fast troubleshooting and diagnostics on servers
- Consistent, reproducible workflows that reduce manual errors
---

## How to run

From inside the bash-scripting folder:

```bash
chmod +x *.sh
./basic_arithmetic.sh
./menu_arithmetic.sh
```