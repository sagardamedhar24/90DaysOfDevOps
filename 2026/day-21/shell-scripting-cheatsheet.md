# Day 21 – Shell Scripting Cheat Sheet
A quick reference guide for Shell Scripting concepts including basic syntax and indentation of Shell Scripting, loops, functions
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

## Task 2: Operators and Conditionals
**1. String Comparison:** 
      
