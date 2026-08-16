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
   * Compare with a function that uses regular variable.
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
  
