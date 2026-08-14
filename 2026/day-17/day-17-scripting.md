# Day 17 – Shell Scripting: Loops, Arguments & Error Handling
## Task 1: For Loop
1. Create `for_loop.sh` that:
   * Loops through a list of 5 fruits and prints each one.
   * **Script Code:** [for_loop.sh](Scripts/for_loop.sh)
     ```bash
     #!/bin/bash
     # Loops through a list of 5 fruits and prints each one
     for fruits in "apple" "mango" "orange" "banana" "papaya"; do
        echo "This is $fruits"
     done
     ```
   * **Script Output:** 

     <img width="653" height="374" alt="image" src="https://github.com/user-attachments/assets/c2dbff2f-4f6c-4125-91be-861ae1d3865d" />

2. Create `count.sh` that:
   * Prints numbers from 1 to 10 using a for loop.
   * **Script Code:** [count.sh](Scripts/count.sh)
     ```bash
     #!/bin/bash
     # Prints numbers from 1 to 10 using a for loop
     for i in {1..10} ; do
        echo "$i"
     done
     ```
   * **Output:**

     <img width="627" height="400" alt="image" src="https://github.com/user-attachments/assets/6655ac01-1eaa-4111-8fbf-ac5afd8d4b58" />
## Task 2: While Loop
1. Create `countdown.sh` that:
   * Takes a number from the user
   * Conunts down to 0 using a while loop
   * Prints "Done!" at the end.
   * **Script Code:** [countdown.sh](Scripts/countdown.sh)
     ```bash
     #!/bin/bash
     read -p "Enter the number : " num
     while [ $num -ge 0 ] ; do
        echo "This is reverse iteration : $num"
        num=$((num-1))
     done
     echo "Done..!"
     ```
   * **Output:**
     <img width="676" height="448" alt="image" src="https://github.com/user-attachments/assets/96b8b850-4c7f-4dfd-95b1-9cbae713b687" />

## Task 3: Command-Line Arguments
1. Create a `greet.sh` that:
   * Accepts a name as $1
   * Prints `Hello,` `<name>!`
   * If no argument is passed, prints "Usage:./greet.sh"
   * **Script Code:** [greet.sh](Scripts/greet.sh)
     ```bash
     #!/bin/bash
     # This is a practice demo for argument usag
     if [[ -z $1 ]]; then
     echo "Usage:$0"
     exit 1
     fi
     echo "Hello, $1"
     ```
   * **Output:**

     <img width="613" height="432" alt="image" src="https://github.com/user-attachments/assets/4c48c41e-9960-41c4-b575-3bf01521098a" />

2. Creates `args_demo.sh` that:
   * Prints total number of arguments
   * Prints all arguments
   * Prints the script name
   * **Script Code:** [args_deo.sh](Scripts/args_demo.sh)
     ```bash
     #!/bin/bash
     echo "Hello, $1"
     echo "You want to install $2 $3 $4"
     echo "Total number of arguments: $#"
     echo "All arguments: $@"
     echo "Script name is : $0"
     ```  
   * **Output:**
  
     <img width="759" height="411" alt="image" src="https://github.com/user-attachments/assets/a6c5a603-5344-4d60-b026-a6568a86875a" />

## Task 4: Install Packages via Script
1. Create a `install_packages.sh` that:
   * Defines a list of packages: `nginx`, `curl`, `wget`
   * Loops through the list
   * Checks if each package is installed
   * Install it if missing, skips if already present
   * Print status for each package
   * **Script Code:** [install_packages.sh](Scripts/install_packages.sh)
     ```bash
      #!/bin/bash
      #Install packages via this scripts which are not already installed from the provided list

      for packages in "nginx" "curl" "wget" ; do
        #Install package if not installed
        if dpkg -s "$packages" &>/dev/null; then
                echo "Package $packages is already installed"
        else
                echo "Installing $packages"
                sudo apt-get install -y "$packages"
        fi

        # Check service status for packages
        if [[ "$packages" == "nginx" ]]; then
                status=$(systemctl is-active nginx)
                echo "$packages service is $status"
        else
                if command -v "$packages" &>/dev/null; then
                        echo "$packages command is available"
                else
                        echo "$packages command is not available"
                fi
        fi
      done
     ```
   * **Output:**

     <img width="675" height="447" alt="image" src="https://github.com/user-attachments/assets/b360cb4a-7126-4fb8-a80f-62438e4891fd" />

     <img width="524" height="464" alt="image" src="https://github.com/user-attachments/assets/fd0515cd-47ef-44a9-a4a0-d5845a8ced69" />



## Task 5: Error Handling
1. Create a `safe_script.sh` that:
   * Uses `set -e` at the top (exit on error)
   * Tries to create a directory `/tmp/devops-test`
   * Tries to navigate into it
   * Creates a file inside
   * Use `||` operator to print the error if any steps fails
   * **Script Code:** [safe_script.sh](Scripts/safe_script.sh)
     ```bash
     #!/bin/bash
     # set -e : Exit on error

     set -e
     mkdir /tmp/devops-test || echo "Error: Directory already exists"
     cd /tmp/devops-test || echo "Cannot change to directory"
     touch devops.txt || echo "Failed to create a file"
     ```
   * **Output:**

     <img width="680" height="470" alt="image" src="https://github.com/user-attachments/assets/1dea90c2-8437-4b95-8e48-4d1d4c967c17" />

     <img width="594" height="59" alt="image" src="https://github.com/user-attachments/assets/884eaa86-8328-49d8-a22d-5fcf907c3453" />
   
2. Modify your install_packages.sh to check if the script is being run as root — exit with a message if not.
   * **Script Code:** [modified_install_packages.sh](Scripts/modified_install_packages.sh)
     ```bash
     #!/bin/bash
     #Install packages via this scripts which are not already installed from the provided list
     # Check if script is being run by root user by adding few if check at the beginning of this script

     if [[ $EUID -ne 0 ]]; then
        echo "Error: This script must be run as root user."
        exit 1
     fi

     for packages in "nginx" "curl" "wget" ; do
        #Install package if not installed
        if dpkg -s "$packages" &>/dev/null; then
                echo "Package $packages is already installed"
        else
                echo "Installing $packages"
                sudo apt-get install -y "$packages"
        fi

        # Check service status for packages
        if [[ "$packages" == "nginx" ]]; then
                status=$(systemctl is-active nginx)
                echo "$packages service is $status"
        else
                if command -v "$packages" &>/dev/null; then
                        echo "$packages command is available"
                else
                        echo "$packages command is not available"
                fi
        fi
     done
     ```
  * **Output:**

    <img width="802" height="456" alt="image" src="https://github.com/user-attachments/assets/96d67450-6e4c-40d9-8d59-04b8e4039fc3" />

## What I Learned:
* Today, I learned new things about writing and making shell scripts as per our needs.
* Understood the usage of `for-loop` in shell scripting for iterating over multiple items/numbers without repeating our code.
* Understood the usage of `while-loop` and implemented a few scripts to iterate the same block of commands/steps if we are not sure about the exact iteration count or want to execute them until a specific condition is met.
* Learned how command-line arguments can be used in shell scripting without defining/declaring them in the script.
* Understood how we can use `$#`, `$@`, `$1`, `$0`, etc for achieving our tasks without hardcoding values in our script.
* Also, learned to automate our daily or repetitive tasks using shell scripting, such as installing some packages/tools on our server/local machine, and verifying their status, etc.
* Learned to write production-grade scripts using an error handling mechanism with different options like `set -e`, `set -u`, `set -o pipefail`, etc, to avoid any unnecessary issues in the production environment.
* Implemented and understood that we can add a root user execution check in any of our scripts as per the requirements, like some scripts can't be executed without admin users, such as creating users, managing groups, etc.
* Understood the usage of `||` operator for printing any customized error message if some bash scripts do not show us traces of execution and to show visibility of what is happening through the scripts.
* I faced many issues while writing & executing the scripts during practice and learned through them by breaking them again and again.
