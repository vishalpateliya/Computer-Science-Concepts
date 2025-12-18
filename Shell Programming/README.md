# Shell Programming & UNIX Commands

## Index

1. [Shell Scripting Basics](#1-shell-scripting-basics)
2. [Shell Variables](#2-shell-variables)
   - [Variable Rules & Quoting](#variable-rules--quoting)
   - [Data Types & Arithmetic](#data-types--arithmetic)
   - [Arrays (Indexed & Associative)](#arrays-indexed--associative)
3. [Shell Script Arguments](#3-shell-script-arguments)
   - [Special Variables](#special-variables)
   - [Environment Variables](#environment-variables)
4. [If Statement & Conditionals](#4-if-statement--conditionals)
   - [Syntax & Structure](#syntax--structure)
   - [Test Operators (Numeric, String, File)](#test-operators-numeric-string-file)
   - [The Case Statement](#the-case-statement)
5. [Loops](#5-loops)
6. [Return Statement & Functions](#6-return-statement--functions)
7. [Basic UNIX Commands](#7-basic-unix-commands)
   - [Directory & Navigation](#directory--navigation)
   - [File Operations](#file-operations)
   - [File Viewing](#file-viewing)
   - [Searching & Text Processing](#searching--text-processing)
   - [Permissions & Ownership](#permissions--ownership)
   - [Process Management](#process-management)
   - [Disk & System](#disk--system)
   - [Redirection & Pipes](#redirection--pipes)
   - [Archiving & Networking](#archiving--networking)

---

## 1. Shell Scripting Basics

### Definition

A shell script is a text file containing a list of commands to be executed by the shell in order.

**File Extension:** `.sh`

### The Shebang (#!)

The first line of the script specifies the path to the interpreter the system should use to execute the script.

**Syntax:** `#!/bin/bash` (For Bourne Again SHell)

### Execution & Permissions

Before executing, the file must have execute permissions.

**Check/Add Permission:**

```bash
chmod +x filename.sh
```

**Execution Methods:**

- `./filename.sh` (Requires Shebang and +x permission)
- `bash filename.sh` (Shebang not strictly necessary; explicit interpreter call)

---

## 2. Shell Variables

### Variable Rules & Quoting

- **Untyped:** Everything is usually treated as a string.
- **Naming Convention:** Constants/Environment variables should be in UPPERCASE.
- **Assignment:** NO SPACES around the = sign.
  - Correct: `name=Vishal`
  - Incorrect: `name = Vishal`
- **Accessing:** Use `$name` or `${name}` (Curly braces avoid ambiguity, e.g., `${age}th`).

**Quoting Mechanisms:**

| Type | Symbol | Behavior |
| :--- | :--- | :--- |
| Double Quotes | `""` | Interprets variables ($var) and escape characters. |
| Single Quotes | `''` | Literal string. No interpretation (prints exactly what is inside). |

### Data Types & Arithmetic

We can enforce specific behaviors using `declare`.

| Type | Declaration | Usage/Notes |
| :--- | :--- | :--- |
| String | (Default) | Filepaths, names, command I/O. |
| Integer | `declare -i var` | For math operations. Treats assignment as arithmetic. |
| Read-only | `declare -r var` or `readonly var` | Constants (cannot be changed). |
| Float | (Not native) | Use external tools like `bc`. |
| Boolean | (No native type) | Uses Exit Codes: 0 = True/Success, Non-zero = False/Failure. |

**Arithmetic Operations:**

- **let command:** `let count=count+1` (No spaces around operators).
- **Expansion:** `result=$(( count + 33 ))` (Spaces are optional/flexible).

### Arrays (Indexed & Associative)

#### 1. Indexed Arrays (Standard lists, 0-based index)

- **Declaration:** `declare -a fruits` or `fruits=("Apple" "Banana")`
- **Access Single Element:** `${fruits[0]}` → Apple
- **Access All Elements:** `${fruits[@]}` or `${fruits[*]}`
- **Array Length:** `${#fruits[@]}`

#### 2. Associative Arrays (Key-Value pairs like Maps/Dictionaries)

- **Declaration:** `declare -A user_config` (Explicit declaration required).
- **Assignment:**

```bash
user_config["username"]="jdoe"
user_config["theme"]="dark"
```

- **Access Value:** `${user_config["theme"]}` → dark
- **Access Keys:** `${!user_config[@]}` (Note the !)
- **Looping Associative Array:**

```bash
for key in "${!user_config[@]}"; do
    echo "$key: ${user_config[$key]}"
done
```

---

## 3. Shell Script Arguments

Arguments passed to the script at runtime.

```bash
./script.sh apple banana 10
```

### Special Variables

| Variable | Description |
| :--- | :--- |
| `$0` | The name of the script itself (./script.sh). |
| `$1` | The first argument (apple). |
| `$2` | The second argument (banana). |
| `$#` | The number of arguments passed (3). |

### $@ vs $* (Handling Lists)

- **`"$@"` (Preferred):** Treats each argument as a separate string. Preserves whitespace within arguments.
- **`"$*"`:** Treats all arguments as a single string.

### Environment Variables

- **HOME:** User's home directory path.
- **USER:** Current username.
- **PWD:** Current working directory.
- **PATH:** List of directories the shell searches for commands.
- **SHELL:** Path to the current shell interpreter.

---

## 4. If Statement & Conditionals

### Syntax & Structure

**Golden Rule:** The if statement checks the exit status of the command inside the brackets.

```bash
if [ condition ]; then
    # Commands
elif [ condition ]; then
    # Commands
else
    # Default Commands
fi
```

- **`[ ... ]` (Test Command):** Standard POSIX. Spaces are mandatory inside brackets.
- **`[[ ... ]]` (Bash Enhanced):** Safer and more powerful. Supports regex (`=~`) and avoids word splitting issues.

### Test Operators (Numeric, String, File)

| Type | Operator | Meaning |
| :--- | :--- | :--- |
| Numeric | `-eq` | Equal |
| | `-ne` | Not Equal |
| | `-gt` / `-lt` | Greater Than / Less Than |
| | `-ge` / `-le` | Greater or Equal / Less or Equal |
| String | `=` | Strings are equal |
| | `!=` | Strings are not equal |
| | `-z` | String is empty (Zero length) |
| File | `-e` | File or directory exists |
| | `-f` | Path is a regular file |
| | `-d` | Path is a directory |
| | `-x` | Path is executable |

**Logical Operators (inside `[[ ]]`):**

- **AND:** `&&`
- **OR:** `||`

### The Case Statement

Similar to switch in other languages. Used for pattern matching.

```bash
case "$variable" in
    pattern1)
        # commands
        ;;
    pattern2|pattern3)  # Match multiple patterns with |
        # commands
        ;;
    *)                  # Default catch-all
        echo "No match"
        ;;
esac
```

**Terminators:**

- **`;;`** Stop (Standard break).
- **`;&`** Fall through (Execute next block too).

---

## 5. Loops

### 1. For Loop (Iterating over Lists)

```bash
for FILE in *.txt; do
    echo "Processing $FILE"
done
```

### 2. C-Style For Loop (Arithmetic)

```bash
for (( i=0; i<5; i++ )); do
    echo "Count: $i"
done
```

### 3. While Loop (True Condition)

Runs as long as the condition is true.

```bash
while [ condition ]; do
    # commands
done
```

Common use: Reading a file line-by-line using `read`.

### 4. Until Loop (False Condition)

Runs until the condition becomes true (runs while false).

```bash
until [ condition ]; do
    # commands
done
```

### Loop Control

- **`break`:** Terminates the loop immediately.
- **`continue`:** Skips the rest of the current iteration and starts the next one.
- **`exit`:** Terminates the entire script.

---

## 6. Return Statement & Functions

- **Exit Status Only:** `return` can only return integers (0-255).
  - 0 = Success.
  - 1-255 = Failure/Error.
- **Returning Data:** To return text/variables, use `echo` inside the function and capture it using command substitution `$()`.
- **`local` keyword:** Use `local var_name` inside functions to prevent variable leakage to the global scope.
- **Checking Status:** Use `$?` immediately after the function call to see the return code (0 or non-zero).

**Example:**

```bash
my_fun() {
    echo "Value to be returned"
    return 0
}
RESULT=$(my_fun)
```

---

## 7. Basic UNIX Commands

### Directory & Navigation

| Command | Description |
| :--- | :--- |
| `pwd` | Prints absolute path of current directory. |
| `ls` | Lists files/directories. |
| `ls -l` | Long listing (permissions, owner, size, time). |
| `ls -a` | Shows hidden files (. prefixed). |
| `ls -la` | Long list including hidden files. |
| `ls -lh` | Human-readable file sizes. |
| `ls -R` | Recursively lists subdirectories. |
| `ls -t` | Sorts by modification time (Last modified first). |
| `ls -r` | Reverses sort order (Based on file name). |
| `cd dir` | Changes to directory dir. |
| `cd ..` | Moves to parent directory. |
| `cd ~` | Goes to home directory. |
| `cd /` | Goes to root directory. |
| `cd -` | Goes to previous directory. |

### Directory Creation & Removal

| Command | Description |
| :--- | :--- |
| `mkdir dir` | Creates a directory. |
| `mkdir -p d1/d2/d3` | Creates the parent directories if they don't exist. |
| `mkdir -v dir` | Prints message saying that it is creating the directory. |
| `rmdir dir` | Removes empty directory. |
| `rmdir -p d1/d2` | First deletes d2 if empty, then deletes d1 if empty (as d2 is already deleted from d1). |
| `rmdir -v dir` | Prints message saying that it is removing the directory. |

### File Operations

#### Creation, Copy, Move, Delete

| Command | Description |
| :--- | :--- |
| `touch file.txt` | Creates empty file. |
| `touch -c file.txt` | Updates the timestamp of the file only if it exists. |
| `touch file{1..3}.txt` | Creates file1.txt, file2.txt, file3.txt (also works in descending). |
| `rm file.txt` | Deletes file. |
| `rm -i file.txt` | Prompts before deletion, need to answer y* or Y* to delete. |
| `rm -r dir` | Deletes directory recursively. |
| `rm -rf dir` | Force deletes directory. |
| `cp file1 file2` | Copies file (creates file2 if it does not exist). |
| `cp -i file1 file2` | Prompts before overwrite (if file2 already exists). |
| `cp -u file1 file2` | Copies only if source is newer than destination (if file2 does not exist, then works normally). |
| `cp -r dir1 dir2` | Copies directory recursively. |
| `mv old new` | Renames file. |
| `mv file dir/` | Moves file. |
| `mv -i file dir/` | Prompts before overwrite. |

### File Viewing

| Command | Description |
| :--- | :--- |
| `cat file.txt` | Displays file content. |
| `cat -n file.txt` | Displays with line numbers. |
| `cat -b file.txt` | Numbers non-empty lines only (empty lines displayed without numbering). |
| `cat -E file.txt` | Displays the file with the end of each line marked with $. |
| `cat -A file.txt` | Shows everything ($ - end of line, ^I - tab, etc). |
| `less file.txt` | Paged file viewing (Space - next page, b - previous, /word - search, q - quit, Enter - scroll down line by line, = - displays current line number). |
| `more file.txt` | One-directional paging (Same navigation as `less`, NOT PREFERRED). |
| `head file.txt` | Shows first 10 lines. |
| `head -n 5 file.txt` | Shows first 5 lines. |
| `tail file.txt` | Shows last 10 lines. |
| `tail -n 20 file.txt` | Shows last 20 lines. |
| `tail -f log.txt` | Live log monitoring (shows the live changes made to the file). |

### Searching & Text Processing

| Command | Description |
| :--- | :--- |
| `grep "err" file` | Searches matching lines. |
| `grep -i "err" file` | Case-insensitive search. |
| `grep -n "err" file` | Shows line numbers. |
| `grep -v "err" file` | Shows non-matching lines. |
| `grep -w "main" file` | Matches whole word. |
| `grep -r "main" .` | Recursive search. |
| `wc file.txt` | Counts lines, words, bytes. |
| `wc -l file.txt` | Counts lines. |
| `wc -w file.txt` | Counts words. |
| `wc -c file.txt` | Counts bytes (also includes new lines, whitespaces, etc.). |
| `sort file.txt` | Sorts alphabetically, line by line (`sort` does not change the file, it just displays like `cat`). |
| `sort -n nums.txt` | Numeric sort. |
| `sort -r file.txt` | Reverse sort. |
| `sort -u file.txt` | Unique sorted output. |
| `uniq file.txt` | Removes adjacent duplicate lines (does not change the file). |
| `uniq -c file.txt` | Counts adjacent duplicate lines. |
| `uniq -d file.txt` | Shows only adjacent duplicate lines. |
| `sort file.txt \| uniq` | Unique sorted output. |

### Permissions & Ownership

**Note:** These commands only work if you have UNIX file system (i.e., ext4, xfs, btrfs).

| Command | Description |
| :--- | :--- |
| `chmod 777 file` | Full permissions [Read (r) = 4, Write (w) = 2, Execute (x) = 1, No Permission (-) = 0]. |
| `chmod 755 file` | rwxr-xr-x |
| `chmod 644 file` | rw-r--r-- |
| `chmod u+x file` | Adds execute for owner. |
| `chmod g-w file` | Removes write for group. |
| `chmod o+r file` | Adds read for others. |
| `chown user file` | Changes owner (Only root user can change the ownership). |
| `chown user:group file` | Changes owner and group. |
| `chown -R user dir` | Changes ownership of directory and everything inside (Recursive). |
| `umask` | Shows default mask. |
| `umask 022` | Sets default permissions (if system provides default permission as 777, after this whenever file/directory is created it will have 777 - 022 = 755 permission). |

### Process Management

| Command | Description |
| :--- | :--- |
| `ps` | Shows shell processes. |
| `ps -e` | Shows all processes. |
| `ps -ef` | Full process info. |
| `top` | Live process monitoring. |
| `kill PID` | Graceful termination. |
| `kill -9 PID` | Force kill. |
| `jobs` | Lists background jobs (Ctrl + Z to suspend/pause a job, e.g., `sleep 200`). |
| `fg %1` | Brings job [1] to foreground. |
| `bg %1` | Resumes job [1] in background. |

### Disk & System

| Command | Description |
| :--- | :--- |
| `df` | Disk usage. |
| `df -h` | Human-readable. |
| `df -T` | Filesystem type. |
| `du dir` | Directory size. |
| `du -sh dir` | Summary size (just shows the size in K/M/etc.). |
| `uname` | Kernel name (Linux). |
| `uname -a` | Full system info. |
| `whoami` | Current user (root or username). |
| `who` | Logged-in users. |

### Redirection & Pipes

| Command | Description |
| :--- | :--- |
| `cmd > out.txt` | Redirect output (overwrite). |
| `cmd >> out.txt` | Redirect output (append). |
| `cmd < in.txt` | Redirect input. |
| `cmd 2> err.txt` | Redirect errors (2 represents Standard Error Stream). |
| `cmd1 \| cmd2` | Pipe output to input. |
| `ps -ef \| grep java` | Filter processes. |

### Archiving & Networking

| Command | Description |
| :--- | :--- |
| `tar -cvf a.tar dir` | Create archive (Packs): meaning putting many files into one box (c-create, v-show files while packing, f-file name). |
| `tar -xvf a.tar` | Extract archive (Unpacks) (x-extract). |
| `tar -czvf a.tar.gz dir` | Create compressed archive (bundles first, then compression). |
| `zip -r a.zip dir` | Zip directory (archive + compress, together). |
| `ping host` | Network check. |
| `ping -c 4 host` | Limited pings. |

**Note:** tar (Tape ARchive) is generally used for Linux/UNIX systems, zip is for cross-platform sharing. For working with tar in Windows, a specific tool is needed.

---
