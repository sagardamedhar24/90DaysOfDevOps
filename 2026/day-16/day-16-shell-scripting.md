# Day 16 – Shell Scripting Basics

## What is Shell Script?
* A shell script is a set of commands written in a sequence from top to bottom.
* Shell script always starts with the Shebang (#! /bin/bash or #! /bin/sh)
* After writing any shell scripts, we need to provide the execute permission to user/group of intended users using `chmod`.

## Task 1: First Script
1. Create a file hello.sh
2. Add the shebang line `#!/bin/bash` at the top
3. Print Hello, DevOps! using echo
4. Make it executable and run it

**Attached script:**

Snapshot: 

<img width="583" height="125" alt="image" src="https://github.com/user-attachments/assets/a6cd38be-184f-4d35-be24-63776d3ab428" />

* What happens when you remove the shebang (#!) line?
  * Script ran without error. But, may work with different behaviour, because shebang tells the OS which interpreter should execute the script.
  * Using `sh hello.sh` / `bash hello.sh` : Script runs even without shebang, as we are explicitely telling system to use bash or sh to interpret the file.
  * Using `./hell.sh` : If we execute directly without any explicit shell option, script ran successfully. But it may behave differently. Without shebang,
    script execution may fail or depends on the calling shells fallback behaviour.

## Task 2: Variables
1. Create `variable.sh` with:
   * A variable for your NAME
   * A variable for your ROLE (e.g. "DevOps Engineer")
   * Print: 'Hello, I am `<NAME>` and I am a `<ROLE>`'

**Attached script:**

   Snapshot:

   <img width="693" height="470" alt="image" src="https://github.com/user-attachments/assets/dc9e793d-4dc8-4d2b-98f8-2acd9d74efd0" />

2. Try using Single quotes vs double quotes in echo command - Whats the difference?
   * With Double Quotes `"`: This allows variable expansion i.e. consider/substitute value of variable (e.g. NAME = Sagar).
   * With Single Quotes `'`: Treat every character written in single quote as it is. Does not consider variable assigned value.

   <img width="495" height="86" alt="image" src="https://github.com/user-attachments/assets/b750c793-f567-4791-a782-bd214a8c534f" />

## Task 3: User Input with read
1. Create `greet.sh` that:
   * Asks the user for their name using `read`
   * Asks for their favourite tool
   * Prints: 'Hello `<name>`, your favourite tool is `<tool>`'

**Attached script:**

   Snapshot:

   <img width="555" height="212" alt="image" src="https://github.com/user-attachments/assets/8b9646c3-3462-45a9-b071-897f9b4def43" />

## Task 4: If-Else Conditions
1. Create `check_number.sh` that:
   * Takes a number using `read`
   * Prints whether it is positive, negative or zero

**Attached script:**
  
  Snapshot:

  <img width="481" height="368" alt="image" src="https://github.com/user-attachments/assets/97cf60b2-4b2a-459e-b66e-e599d76b8f40" />
   
2. Create `file_check.sh` that:
   * Asks for filename
   * check if the file is exists using -f
   * Prints appropriate message

**Attached script:**

Snapshot: 

<img width="579" height="319" alt="image" src="https://github.com/user-attachments/assets/beb99ad4-7e1c-47df-9435-5512e76eae78" />

## Task 5: Combine It All

1. Create a server_check.sh that:
   * Stores a service name in variable (e.g. nginx, sshd)
   * Asks the user: "Do you want to check the service status? (y/n)"
   * If 'y' - Runs the systemctl status `<service>` and prints whether its active or not
   * if 'n' - prints "skipped"

