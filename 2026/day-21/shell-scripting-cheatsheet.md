# Day 21 – Shell Scripting Cheat Sheet
A quick reference guide for Shell Scripting concepts, including basic syntax and indentation of Shell Scripting, loops, and functions.
Text processing tools, debugging techniques, etc. 

# Quick Reference Table
| Topic | Syntax | Example |
| ----- | ------ | ------- |
| Shebang | `#!/bin/bash` | First line of script |
| Make executable | `chmod +x filename` | `chmod u+x script.sh` |
| Run script | `./file.sh` | `./script.st` |
| Run using bash | `bash file.sh` | `bash script.sh` |
| Comment | `#` | `# This is a single line comment` |
| Variable | `VAR="value"` | `NAME="Sagar"` |
| Variable Use | `$VAR` | `echo "$NAME"` |
| Read User input | `read VAR` | `read USERNAME` |
| Aegument | `$1`, `$2` | `./script.sh Sagar Damedhar` |
| First Argument | `$1` | `./script.sh nginx` |
| Second Argument | `$2` | `./script.sh nginx apache` |
| Argument Count | `$#` | `echo "Argument Count: $#"` |
| All Argument | `$@` | `echo "All Argument: $@` |
| Script Name | `$0` | `echo "Script name: $0"` |
| Last Command exit code | `$?` | `echo "$?"` |
| If | `if [ condition ]; then` | `if [ -f file ]; then` |
| For loop | `for i in list; do` | `for i in 1 2 3; do` |
| Function | `name() { ... }` | `greet() { echo "Hi" }` |
| Grep | `grep pattern file` | `grep -i "ERROR" log.txt` |
| Awk | `awk '{print $1}' file` | `awk -F: '{print $1}' /etc/passwd` |
| Sed | `sed 's/old/new/g' file` | `sed -i 's/search/find/g' file.txt` |

# Comparison Operators 
## String Comparison
| Operator | Description | Example/Syntaxt |
| -------- | ------- | ------- |
| `=` or `==` | Equal | `[[ "$a" == "$b" ]]` |
| `!=` | Not equal | `[[ "$a" != "$b" ]]` |
| `-z` | Empty String or length zero | `[[ -z "$a" ]]` |
| `-n` | String is not empty | `[[ -n "$a" ]]` |

## Integer Comparison 
| Operator | Description | Example/Syntaxt |
| -------- | ------- | ------- |
| `-eq` | Equal To | `[[ $a -eq $b ]]` |
| `-ne` | Not equal to | `[[ $a -ne $b ]]` |
| `-lt` | Less than | `[[ $a -lt $b ]]` |
| `-gt` | Greater than | `[[ $a -gt $b]]` |
| `-le` | Less than or equal to | `[[ $a -le $b ]]` |
| `-ge` | Greater than or equal to | `[[ $a -ge $b ]]` |

## Logical Comparison 
| Operator | Description | Example/Syntaxt |
| -------- | ------- | ------- |
| `&&` | Logical AND | Return true if both conditions met to true |
| `\|\|` | Logical OR | Return true if atlease one condition is true |
| `!` | Logical NOT | Inverts the boolean state |
## Task 1: Basics
**1. Shebang (`#!/bin/bash`):**
   * What it does? : It tells the Linux OS which interpreter to use for running the rest of the code.
   * Why does it matter? : Ensures the script runs using Bash (Bourn Again Shell) regardless of the user's/system's current shell.
   * **Example:**
     ```bash
     #!/bin/bash
     echo "Hello World"
     ```
**2. Running a script:**
   * `chmod +x`: This makes the script executable. (Using `+x` it gives execute permission to user, group and others)
   * `./script.sh`: Runs the script using the same interpreter that defined in the shebang line.
   * `bash script.sh`: Runs the script explicitly using Bash interpreter even if script does not having execute permission.

**3. Comment:** Generally it is created with (`#`). Comments are used for making our code readable and understandable for self & others.
Comments are ignored by interpreter.
   * Single Line : Single line comment created with `#` before any text. They are written above the code, which it describe.
   * **Example:**
     ```bash
     # This is single line comment
     Name="Sagar"
     ```
   * Inline Comment: Inline comment is written on the same line, where code is there by following the code.
   * **Example:**
     ```bash
     echo "----- Job Execution Started -----" # This is inline comment, describing print output message
     ```

**4. Variables:** Variables stores the data like string, numbers or any other shell command output. Variables can be reused throughout the script.
In Shell Scripting, we cannot put the space around the `=` sign, while defining variable. 
   * Declaration:
     ```bash
     NAME="Sagar"
     ID=255
     ```
   * Using Variables/Accessing Variables:
     ```bash
     echo "$NAME"
     echo "My employee id is: $ID"
     ```
   * Quoting:
   * `$VAR`: This option expands variable but not safe for spacing. Breaks the argument into multiple argument.
   * Example: `FILE="My document.txt"`
     ```bash
     ls $FILE  # interpreted as: ls My document.txt (2 separate arguments)
     ```
   * `"$VAR"`: This is recommended option for using variables. It expands the variable's value, but preserves spaces and special characters as a single string.
   * Example: 
     ```bash
     ls "$FILE" # interpreted as: ls "My document.txt" (1 single argument)
     ```
   * `'$VAR'`: This option disables the expansion. Everything inside single quote treted as literal text.
   * Example:
     ```bash
     ls '$FILE' # interpreted as: literal string, does not read variable value.
     ```
**5. Reading User Input:** The `read` command reads user input from the terminal.
   * Example: Basic Input - Prompt the user to type something and store it in the variable.
     ```bash
     echo "Enter your name:"
     read NAME
     echo "Hello, $NAME"
     ```
   * Example: Prompt Input - Combined the prompt text and `read` command into single a line.
     ```bash
     read -p "Enter your name: " NAME
     ```
   * Example: Silent Input - Hides typing on the screen. Ideal for sensitive data like Password.
     ```bash
     read -sp "Enter Password: " PASSWORD
     echo -e "\Password Saved Securaly."
     ```
**6. Command Line Argument:** Argument allows user to pass values while running the script.
| **Argument** | **Meaning** |
| -------- | ------- |
| $0 | Print Script name |
| $1 | First Argument |
| $# | Number of arguments |
| $@ | All Argument |
| $? | Exit status of previous command | 

**Example:**
```bash
#!/bin/sh

echo "Script name: $0"
echo "First Argument: $1"
echo "Second Argument: $2"
echo "Number of arguments: $#"
echo "All argument: $@"

if [ $? -eq 0 ]; then
        echo "All above commands executed successfully"
fi
```
**Output:**
```
Script name: ./sample.sh
First Argument: Sagar
Second Argument: Damedhar
Number of arguments: 2
All arguments: Sagar Damedhar
All above commands executed successfully
```
## Task 2: Operators and Conditionals
**1. String Comparison:** These operators are useful for string comparison.
* `=`: Check for equality, if two strings are identical, gives true.
* `!=`: Check for inquality, if two strings are different, gives true.
* `-z`: Check if sting variable is empty or its length is zero.
* `-n`: Checks if length is greater than zero.
* Examples:
  ```bash
  #!/bin/bash
  STR1="Hello"
  STR2=""
  
  # '=' Check for equal operator
  if [ "$STR1" = "Hello" ]; then
          echo "Strings are identical"
  fi
  
  # '!=' Check for inequality
  if [ "$STR1" != "$STR2" ]; then
          echo "Strings are not identical"
  fi
  
  # '-z' Check for if variable is empty or with zero length
  if [ -z "$STR2" ]; then
          echo "Variable is empty."
  fi
  
  # '-n' check if variable has a value
  if [ -n "$STR1" ]; then
          echo "Variable is set and non-empty"
  fi
  ```
**2. Integer Comparison:** 
* `-eq` (equal): Check if two numbers are equal. 
* `-ne` (Not equal): Check if two numbers are not equal.
* `-lt` (less than): Check if the first number is less than the second.
* `-gt` (greater than): Check if the first number is greater than the second.
* `-le` (Less or equal): Check if the first number is less than or equal to the second.
* `-ge` (greater or equal): Check if the first number is greater than or equal to the second.
* **Example:**
  ```bash
  a=10
  b=20

  [ $a -eq $b ] # Check if two numbers are equal
  [ $a -ne $b ] # Check if two numbers are not equal
  [ $a -lt $b ] # Check if number one is less than second
  [ $a -gt $b ] # Check if number one is greater than second
  [ $a -le $b ] # Check if the first number is less than or equal to the second.
  [ $a -ge $b ] # Check if the first number is greater than or equal to the second.
  ```
**3. File Test Operators:** File test operators in shell scripting are unary operators used within conditional expressions (like if statements) to check the properties, permissions, types, and existence of files or directories.
* `-f`: Check if a regular file exists or not (not a directory). 
* `-d`: Validating if a folder exists before moving files into it. 
* `-e`: Check if a file or directory exists.
* `-r`: Checks if the file has read permission before attempting to read it.
* `-w`: Checks if the file exists and has write permission.
* `-x`: Checks if the file exists and has executable permission.
* `-s`: Checks if the file exists and has a size greater than zero (not empty).
* `-L`: File exists and is a symbolic link.
* **Example:**
```bash
file="Test.txt"
Dir_Path="/Backup"

[ -f "$file" ]
[ -d "$Dir_Path" ]
[ -e "$file" ] 
[ -r "$file" ]
[ -w "$file" ]
[ -x "$file" ]
[ -s "$file" ]
[ -L "$file" ]
```

**4. if, elif, else Syntax:**
* `if`: Check the first condition; if true, then execute the if code block.
* `elif`: Check another condition; if the first condition is false.
* `else`: Executes the else block/default block code if none of the conditions are true.
* **Syntax:**
  ```bash
  if [ condition_1 ]; then
    Commands/statements
  elif [ condition_2 ]; then
    Commands/statements
  else
    Commands/Statements
  fi
  ```
* **Example:**
  ```bash
  FILE="Test.txt"

  if [ -d "$FILE" ]; then
    echo "It is a directory."
  elif [ -f "$FILE" ]; then
    echo "It is a file."
  else
    echo "This file/directory is not present."
  fi
  ```
**5. Logical Operators:** Logical operators combine multiple conditions.
* `&&`: The entire expression is 'True' only if all the connected conditions are true.
* `||`: The entire expression is 'True' if at least one of the connected conditions is true.
* `!`: This operator inverts a condition's result. It turns a 'True' condition into 'False' and a 'False' condition to 'True'
* **Syntax:**
    ```bash
    [ condition_1 ] && [ condition_2 ] # Logical AND.
    [ condition_1 ] || [ condition_2 ] # Logical OR
    ! [ condition_1 ] # Logical NOT
    ```
* **Example:**
    ```bash
    # && Uses:
    FILE="test.txt"
    if [[ -f "$FILE" && -r "$FILE" ]]; then
      echo "File exists and is readable.
    fi

    # || Uses:
    USER="Guest"
    if [[ "$USER" == "ADMIN" || "$USER" == "root" ]]; then
      echo "Access Granted"
    else
      echo "Permission Denied."
    fi

    # ! Uses:
    Dir="Backup"
    if [ ! -d "$Dir" ]; then
      echo "Directory does not exist. Creating new directory..."
      mkdir "$Dir"
    else
      echo "Directory already exists"
    fi
    ```
**6. Case Statements:** The case statement is used whenever there is a need to handle multiple conditions, rather than using many `if-elif-else` blocks.
* **Syntax:**
  ```bash
  case $VAR in
    pattern_1)
    # Code to execute if variable matches pattern_1.
    ;;
    pattern_2)
    # Code to execute if variable matches pattern_2.
    ;;
    *)
    # Default code to execute if no pattern match found. (Optional)
    ;;
  esac
  ```
* **Example:**
  ```bash
  #!/bin/bash
  # This script handles simple system commands based on input
  echo "What action would you like to take? (start/stop/restart):"
  read ACTION

  case $ACTION in
    "start")
      echo "Starting the system services..."
      ;;
    "stop")
      echo "Stopping all the system services ..."
      ;;
    "restart")
      echo "Restarting the system..."
      ;;
    *)
      echo "Error: Invalid Option. Please choose start, stop or restart..!"
      ;;
  esac
  ```
## Task 3: Loops
**1. `for` loop:** A `for` loop in shell scripting iterates over a list of items or runs a set number of times.
  * List-Based For Loop: Iterate through a predefined list of words, strings or numbers.
    Example:
    ```bash
    # Loops through fruit lists
    for fruits in "apple" "mango" "orange" "banana" "papaya"; do
     echo "This is $fruits"
    done

    # Loops through numbers from 1 to 5
    for i in {1..5} ; do
     echo "$i"
    done
    ```
  * C-Style For Loop: Useful when we need traditional counter logic, with explicit condition and increments.
    ```bash
    for (( i=1; i<=5; i++)); do
      echo "$i"
    done
    ```
**2. `while` Loop:** A `while` loop in Bash runs a block of commands repeatedly as long as a given condition evaluates to 'True' (exit status is '0')
  * Example:
    ```bash
      # Counts up to 5.
      count=1
      while [ count -le 5 ]; do
        echo "Count: $count"
        ((count++))
      done
    ```
**3. `until` Loop:** An `until` loop in Bash runs the block of commands repeatedly as long as the specified condition evaluates to 'false'. It stops the moment the condition becomes true. *It is the exact inverse of the while loop*.
  * Example:
    ```bash
    # Loops until count is greater than 5.
    count=1
    until [ $count -gt 5 ]; do
    echo "Count : $count"
      ((count++))
    done
    ```
**4. Loop Control:** Loop control statements in Bash allow you to interrupt, skip, or break out of a single or multi-level loop (like `for`, `while`, `until`) using statements like `break` and `continue`.
  * `break`: Terminates the loop immediately and jumps to the code following the loop.
    ```bash
    for i in {1..10}; do
      if [ $i -eq 5 ]; then
        echo "Stopping loop at $i..."
        break
      fi
      echo "Number: $i"
    done
    ```
  * `continue`: Skips the rest of the current iteration and jumps directly to the evaluation step of the next iteration.
    ```bash
    for i in {1..5}; do
      if [ $i -eq 3 ]; then
        echo "Skipping iteration $i"
        continue
      fi
      echo "Number: $i"
    done
    ```
**5. Looping over files:** Process multiple files matching a specified pattern.
  * Example:
    ```bash
      for file in *.log do
        # skip if no log file exist.
        [ -e "$file" ] | continue
        echo "Processing $file"
      done
    ```
**6. Looping over command output:** Process command output line by line.
  * Example:
    ```bash
    # Process text file line by line
    ls *.txt | while read LINE; do
      echo "File: $LINE"
    done

    # Disk info line by line
    df -h | while read -r line; do
      echo "Disk Info: $line"
    done
    ```
## Task 4: Functions
**1. Defining a function**
  * Functions in Bash allow you to group reusable code, pass arguments, manage scope, and handle return values.
  * **Syntax:** Bash supports two standard formats for defining a function.
  * Without 'function' keyword (Recommended for portability)
    ```bash
    myFunction(){
      echo "Hello Dosto"
    }
    ```
  * By using 'function' keyword
    ```bash
    function myFunction(){
      echo "Hello Dosto"
    }
    ```
**2. Calling a function:** A function can be invoke/called by its name (without parentheses)
  * Example:
    ```bash
    # Define Function
    myFunction(){
      echo "Hello Dosto"
    }
    # Function call
    myFunction
    ```
**3. Passing arguments to a function:** In Bash, functions do not declare parameters/arguments in their signatures (e.g. func(arg1, arg2)). Instead, arguments are passed as a space-separated list when calling the function and accessed inside using standard positional parameters.  
  * Example:
    ```bash
      # --- Creating Functions ----
      function greet() {
      echo "Hello, $1!"
      }
      
      function add() {
      num1=$1
      num2=$2
      sum=$((num1+num2))
      echo "The sum of two numbers $num1 & $num2 is : $sum"
      }
      # --- Calling Function by passing arguments to it ---
      greet "Sagar"
      add 5 10
    ```
**4. Return Values:** In Shell Scripting, functions do not return values like traditional programming languages. Instead, a Bash function's `return` statement only sets an exit status code (an integer between 0 and 255).
  * Example: `return`:
    ```bash
    #!/bin/bash

    check_service(){
    systemctl status $1 > /dev/null 2>&1
    if [ $? -eq 0 ]; then
            echo "Status: Success ($1 is running)"
            return 0;
    else
            echo "Status: Failed ($1 is stopped or not found)"
            return 1;
    fi
    }
    check_service "nginx"
    
    #capture and print the function's exit code
    echo "Exit Code: $?"
    ```
  * Example: `echo` - Returns output that can be stored in a variable or a text itself.
    ```bash
    NAME="Sagar Damedhar"
    echo "Hello, $NAME"
    ```
**5. Local Variables:** Local variables are declared by using `local` keyword, and its scope is limited to the function in which it is declared. All variables used without declaring `local` keyword are treated as global/regular variables.
  * Example:
    ```bash
     #!/bin/bash
     # Understanding of local and global variables.
     #set -euo pipefail
    echo "--- Function with Local Variable ---"
    # Defining function with local variable
    function local_demo(){ 
    
       local local_var=x
       echo "Inside Local Demo Function - value of local variable: $local_var";
    }
    local_demo #Calling function
    echo "Outside Local Demo Function - value of local variable: $local_var" # Here local variable can not be accessible and got empty output.
    
    echo "--- Function Global/Regular Vairable ---"
     # Defining function with global (regular) variable.
    function global_demo(){
       global_var=y
       echo "Inside Global Demo Function - value of glogal variable: $global_var";
    }
    
    global_demo # Calling Function
    echo "Outside Global Demo Function - value of global variable: $global_var";
    ```
## Task 5: Text Processing Commands
**1. `grep` :** Searches for text pattern in files or input.
  * Syntax:
    ```bash
    grep [options] "pattern" [file or directory]
    ```
  * Common flags:
  * `-i` : Case insensitive (Search ignore if letter is Uppercase or Lowercase)
  * `-r` : Recursively search
  * `-c` : Count of matching lines per file
  * `-n` : Line numbers
  * `-v` : Invert match (Select lines that do not match the pattern)
  * `-E` : Extended Regex
  * `-l` : List files (Print only the names of files of containing matches, not the matching pattern)
  * `-w` : Word boundry (Match whole words only)
  * `-x` : Exact Line (Match full, exact lines only)
  * Example:
    ```bash
    grep -i "Error" system_log.log
    grep -r "Main" ./src
    grep -c "CRITICAL" error.log
    grep -n "FAILED" system_log.log
    grep -v "DEBUG" app.log
    grep -E "error|fail" /var/log/syslog.log
    ```
**2. `awk` :** Process or extract text from files or input by columns/fields.
  * Syntax :
    ```bash
    awk 'pattern { action }' input_file
    ```
  * Example:
    ```bash
    awk '{print $1, $2}' data.txt  # Print first and second column of file.
    awk '/ERROR/ {print $0}' server.log  #
    df -h | awk 'NR==2 {print $1, $2}' # print second row of first and second column
    ```
**3. `sed`:** (Stream Editor) is a non-interactive text editor tool used to parse, transform, and substitute text in files or data streams line-by-line.
  * Syntax:
    ```bash
    sed [options] 'script' [input_file]
    ```
  * Example: 
    ```bash
    # 1. Text Substitution (s/pattern/replacement/flags)
    sed 's/error/ERROR' app.log  # Replace the first occurrence of ERROR with error per line
    sed 's/error/ERROR/g' app.log # Global Replacement (ALL occurrences on every line)
    sed 's/error/ERROR/gi' app.log # Case insensitive global replacement
    sed '5 s/error/ERROR' app.log # Replace only on specific line (e.g. line 5)
    
    # 2. In-Place Editing(-i): Modifies the target file directly instead of printing output on stdout.
    sed -i 's/search/find/g' file.txt # Edit file in-place
    sed -i.bak 's/search/find/g' file.txt # Edit file in-place and create a backup file (.bak)

    # 3. Deleting lines (d)
    sed '3d' file.txt # Delete line 3
    sed '2,5d' file.txt # Delete line 2 through 5
    sed '/DEBUG/d' app.log # Delete lines matching pattern
    sed '/^$/d' file.txt # Delete blank lines

    # 4. Printing specific Lines (-n with p)
    sed -n '10p' file.txt # Print only line 10
    sed -n '5,10p' file.txt # Print lines 5 to 10
    sed -n '/ERROR/p' app.log # Print lines matching a regular expression

    # 5. Inserting, Appending, and Replacing Lines
    # i = Insert line before match
    # a = Append line after match
    # c = Change/replace entire line match
    sed '1i\Header' file.txt # Insert header at line 1
    sed '$a\Footer' file.txt # Append 'Footer' after the last line ($)  
    ```
**4. `cut`:** It is a lightweight tool used to extract specific sections (column, field, or byte ranges) from each line of a file/input stream, using a delimiter.
  * Example:
    ```bash
    cut -d ":" -f 1 /etc/passwd  # Extract the 1st column from /etc/passwd using column delimiter
    cut -d ":" -f 1,3 /etc/passwd # Extract the 1st and 3rd columns
    cut -d ":" -f 1-4 /etc/passwd # Extract columns 1 to 4 (range)
    ```
**5. `sort`:** This command rearranges lines of text files in numerical, alphabetical, or custom order.
  * Example:
    ```bash
    sort numbers.txt # Sort alphabetically 
    sort -n numbers.txt # Numeric Sort: Sort by numerical value.
    sort -r file.txt # Reverse: Reverse the result of comparison
    sort -u file.txt # Unique: Output unique lines
    sort -k 2 data.txt # Key: Sort by a specific column/field position
    ```
**6. `uniq`:** It filters out repeated adjacent lines from a text file or input.
  * Example:
    ```bash
    sort names.txt | uniq  # Removes all duplicate lines
    # Find the top 5 most frequent IP addresses in an access log
    awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -n 5 
    ```
**7. `tr` (translate):** A stream-based utility that translates, squeezes, or deletes characters from standard input.
  * Example:
    ```bash
    echo "hello world" | tr 'a-z' 'A-Z' # convert text to uppercase
    echo "Sagar Damedhar" | tr ' ', '_' # Replaces spaces with underscore
    ```
**8. `wc` (word count):** Prints newline, word, character, and byte counts for files or standard input.
  * Syntax:
    ```bash
    wc [options] [filename]
    ```
  * Example:
    ```bash
    wc -l app.log # Count total lines in a log file
    grep "Error" server.log | wc -l # Count how many lines match a pattern
    wc -w app.log # Count total words
    wc -c app.log # Count total characters 
    ```
**9. `head`/ `tail`:** Prints first or last N lines. 
  * `head` - Prints the first 10 lines of a file by default.
  * `tail` - Prints the last 10 lines of a file by default.
  * Examples:
    ```bash
    head /var/log/syslog # Shows lines 1-10
    tail /var/log/syslog # Shows last 10 lines
    head -n -5 file.txt # Output everything except the last 5 lines
    tail -f /var/log/nginx/access.log # Shows live logs of access.log
    ```
## Task 6: Useful Patterns and One-Liners
  * Find and delete files older than N days
    ```bash
    find /var/log/ -type f -name "*.gz" -mtime +15 -delete
    ```
  * Count lines in all `.log` files
    ```bash
    wc -l /var/log/*.log
    ```
  * Replace a string across multiple files
    ```bash
    sed -i 's/Search/Find/g' /myfile/.*txt
    ```
  * Check if a service is running
    ```bash
    systemctl is-active --quiet nginx && echo "Running" || echo "Stopped"
    systemctl is-active --quiet cron && echo "Running" || echo "Stopped"
    ```
  * Monitor disk usage with alerts
    ```bash
    df -h | awk '$5+0 > 80'; [ -n "$ALERT" ] && echo "$ALERT" | mail -s "Disk Alert on $(hostname)" your.email@example.com
    ```
  * Tail a log and filter for errors in real time
    ```bash
    tail -f /var/log/nginx/error.log | grep -E "ERROR|FAILED"
    ```
## Task 7: Error Handling and Debugging
**1. Exit Codes:** Exit codes are the indication of the previous command or script completion. It gives integer values between 0 to 255.
  * `?` : Stores a exit status of last command.
  * `exit 0`: Exit status '0' means a command exited with Success status.
  * `exit 1`: It denotes a general error and a specific error condition.
  * Example:
    ```bash
    ls file.txt
    echo "Exit status of ls command:$?"

    if [ -f "file.txt" -eq 0 ]; then
      echo "File Exists"
      exit 0
    else
      echo "File doesn't exist"
      exit 1
    fi   
    ```
**2. `set -e`:** Exit immediately after command failure.

**3. `set -u`:** If we used any undefined variable in the script, this flag identifies it and stops the script execution with error "unbound variable".

**4. `set -o pipefail`:** When we try to use pipe (|) for getting a result by combining multiple commands, then this flag stops the script execution if any of the command from this pipeline gets fail.

**5. `set -x`:** It enables the execution tracing by printing each command to the terminal right before executing it, along with it expanded argument.

**6. `trap`:** Is a built-in command, used to catch signals (such as `Control-C`, termination requests, or script exit) and execute specific code or functions when those signals arrive. It is primarily used for cleanup tasks.

  * `trap cleanup EXIT`: It is a standard bash pattern used to ensure temporary files, lock files, or temporary processes are safely removed when a script finishes executing.
  * Example:
    ```bash
    #!/bin/bash
    set -euo pipefail
    # create a temporary file
    TMP_FILE=$(mktemp)

    #define the cleanup function
    cleanup(){
      echo "Cleaning up..."
      rm -f "$TMP_FILE"
    }

    # Trap the EXIT signal to invoke cleanup automatically
    trap cleanup EXIT

    # Script logic
    echo "Working with temporary file: $TMP_FILE"
    echo "Some data" > "$TMP_FILE"
    ```
