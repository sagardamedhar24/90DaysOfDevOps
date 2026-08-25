# Day 21 – Shell Scripting Cheat Sheet
A quick reference guide for Shell Scripting concepts, including basic syntax and indentation of Shell Scripting, loops, and functions.
Text processing tools, debugging techniques, etc. 

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
  
