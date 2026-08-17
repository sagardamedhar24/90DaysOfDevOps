# Day 18 – Shell Scripting: Functions & Intermediate Concepts
## Task 1: Basic Functions
1. Create a `functions.sh` with:
   * A function `greet` that takes a name as an argument and prints `Hello, <name>!`
   * A function `add` that takes two numbers and prints their sum
   * Call both functions from the script
   * **Script Code:** 

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
    # --- Calling Function ---
    greet "Sagar"
    add 5 10
    ```
    * **Output:** 

    <img width="576" height="251" alt="image" src="https://github.com/user-attachments/assets/d98bbdea-649a-4b24-afbc-15b90247d616" />

## Task 2: Functions with Return Values
1. Create a `disk_check.sh` with:
   * A function `check_disk` that checks disk usage of `/` using `df -h`
   * A function `check_memory` that checks free memory using `free -h`
   * A main section that calls both and prints the results
   * **Script Code:**
     ```bash
     #!/bin/bash
     # -- Function to find disk memory usage
     function check_disk() {

        echo "--- The disk memory usage on root '/' ---"
        df -h | awk 'NR==1 || NR==2 {print $2, $3, $4, $5, $6}'
     }

     # -- Function to find free RAM memory
     function check_memory() {

        echo "--- Current free RAM memory ---"
        free -h | awk 'NR==2 {print $4}'
     }
     # -- Main Function
     main(){
     check_disk
     check_memory
     }
     # -- Calling Main function
     main
     ```
   * **Output:**

     <img width="759" height="469" alt="image" src="https://github.com/user-attachments/assets/124787c6-f18e-43fe-b9e3-fa9a2e134260" />

## Task 3: Strict Mode — set -euo pipefail
1. Create `strict_demo.sh` with `set -euo pipefail` at the top?
2. Try using an undefined variable - what happens with `set -u`?
3. Try a command that fails - what happens with `set -e`?
4. Try a piped command where one part fails - What happens with `set -o pipefail`?
   * **Script Before Break**:
     ```bash
     #!/bin/bash
     set -euo pipefail
     echo "--- Script Testing without Breaking any command---"
     echo "--- Testing Undefined variable ---"
     UNDEFINED_VAR="Variable Correctly used. This is used variable"
     echo "Hello, $UNDEFINED_VAR" || echo "Usage of -u"

     echo "--- Testing failing command ---"
     mkdir /home/ubuntu/DevOps-Practices/Day19 || echo "ERROR: Directory can not be created"

     echo "---- Pipefail check ---- "
     #Either one of the command failed in pipe command"
     df -h | awk 'NR==1 || NR==2 {print $3}'
     ```
   * **Output:**

     <img width="544" height="136" alt="image" src="https://github.com/user-attachments/assets/9e6bbcbd-0dd8-4204-bd77-4631ce9c22e1" />

   * **Script After Break**:
     ```bash
     #!/bin/bash
     set -euo pipefail
     #echo "--- Script Testing without Breaking any command---"
     echo "--- Testing Undefined variable ---"
     #UNDEFINED_VAR="Variable Correctly used. This is used variable"
     echo "Hello, $UNDEFINED_VAR" || echo "Usage of -u"

     echo "--- Testing failing command ---"
     mkdir /home/ubuntu/DevOps-Practices/Day19 || { echo "ERROR: Directory can not be created"; exit 1; }

     echo "---- Pipefail check ---- "
     #Either one of the command failed in pipe command"
     df -h | awk NR==1 || NR==2 {print $3}'
     ```
   * **What does each flag do? with Output:** 
     **Usage of `set -u`:** If we used any undefined variable in the script, this flag identifies it and stops the script execution with error **"unbound variable"**.

     <img width="522" height="56" alt="image" src="https://github.com/user-attachments/assets/b1c87c8b-c306-4b6a-ac7c-accfc96b4fd2" />
  
     **Usage of `set -e`:** If we get an error in any command in the script, script execution stop at the same time and exited with status '1'.
  
     <img width="547" height="311" alt="image" src="https://github.com/user-attachments/assets/25cd14ff-036a-41b3-a132-76c548141f1a" />

     **Usage of `set -o pipefail`:** When we try to use pipe `(|)` for getting result by combining multiple commands, then this flag stops the script execution if any of the command from this pipeline gets fail.

      <img width="535" height="64" alt="image" src="https://github.com/user-attachments/assets/7ef90660-6170-46bc-a3ba-1e0b5f4b5e37" />

## Task 4: Local Variables
1. Create a `local_demo.sh` with:
   * A function that uses `local` keyword for variables.
   * Show that `local` variable don't leak outside the function.
   * Compare with a function that uses regular variables.
   * **Script Code:**
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
   * **Output:**

     <img width="628" height="209" alt="image" src="https://github.com/user-attachments/assets/5ddb2d26-ed40-45b4-81d9-f50852127c87" />

## Task 5: Build a Script — System Info Reporter
* Create `system_info.sh` that uses functions for everything:
  1. A function to print hostname and OS Info
  2. A function to print Uptime
  3. A function to print disk usage ( top 5 by size)
  4. A function to print memory usage
  5. A function to print top 5 CPU-consuming processes
  6. A main function that calls all of the above section headers
  7. Use `set -euo pipefail` at the top
* **Script Code: **
  ```bash
  #!/bin/bash
  # Script for System Information Report
  set -euo pipefail
  # Function to Display hostname & OS Info
  system_info(){
        echo "======== Hostname & OS Info ========"
        echo "Hostname : $(hostname)"
        echo "OS Name \& Version : $(lsb_release -ds)"
        echo "Current Login User: $(printenv USER)"
        echo
  }

  get_uptime(){

        echo "========= System Uptime ========="
        echo "Total Uptime: $(uptime -p)"
        echo "Exact Date & Time of Boot: $(uptime -s)"
        echo "
  }
  get_disk_usage(){

        # df -h | head -n 1 : This commands prints headers at top
        # df -h | awk 'NR>1' : This will exclude header line from the output
        # sort -hr -k 5 : This will sort the output of df -h by column 5 (i.e. use %)
        # head -n 5 : Prints first 5 records
        echo "======== Disk Usage (Top 5 Disk Usage) ========"
        df -h | head -n 1; df -h | awk 'NR>1' | sort -hr -k 5 | head -n 5
        echo
  }

  get_memory_usage(){

        echo "======== Memory Usage ======="
        free -h | awk 'NR==2 { print "Total:" $2 " Used:" $3 " Free:" $4 " Available:" $7}'
        echo
  }
  get_cpu_usage(){

        echo "========= Top 5 CPU consuming Processes ========="
        ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6
        echo
  }

  main(){
  system_info
  get_uptime
  get_disk_usage
  get_memory_usage
  get_cpu_usage
  }

  # Call Main Function
  main
  ```
* **Output:**

  <img width="529" height="437" alt="image" src="https://github.com/user-attachments/assets/8daec28a-c19a-4291-ad38-5689e2c9adff" />

## What I Learned?
1. Linux Functions: I understood how important functions are for Linux automation. Functions help us to reduce the lenghty script and avoid repetitive code, which can be reused.
2. Local vs Global Variables:
   * Local Variables are declared using the `local` keyword before defining any local variable. Whereas regular (global) variables do not require any keyword identification. 
   * Local variables' scope is only in the same function where it is declared/defined and cannot be accessed outside of the function. But global variables can be a accessible through out the programm/script anywhere.
   * Local variables prevent functions from accidentally overriding global data, whereas functions with global variables can unintentionally overwrite global variables.
   * Local variables are automatically deleted from memory once the function exits. Unlike local variables, global variables stay in memory until the entire script execution finishes.
   * Best use cases of Local Variables: Temp variables, loop counters, or function-specific data.
   * Base use cases of global variables: Global configurations, shared file paths, or constant values.
3. Practical Use Cases of `set -euo pipefail`: For writing any strict and safer script, we can use error handling flags so that scripts can fail but by handling errors gracefully.
   * `set -e`: This flag stops script execution where it finds an error with any command and does not execute the next set of commands.
   * `set -u`: If we try to use any undefined variable, this flag identifies it and immediately stops the script execution.
   * `set -o pipefail`: When we write multiple commands using the pipe `(|)` operator, then if any of the commands fail in the pipeline, this flag considers the entire pipeline as failed and stops the script execution.
4. Understanding basic & advanced Linux command usage, it helps to consolidate all these useful commands for writing a few impactful scripts and generating some basic reports.
5. This exercise helped me understand how to write standardized, clean, and reusable scripts for the future.
