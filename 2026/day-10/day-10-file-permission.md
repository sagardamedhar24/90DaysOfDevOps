# Day 10 – File Permissions & File Operations Challenge
## Files Created:
* I have created 3 files for performing file permission and file operations hands-on practice.
* Below are the 4 files/directory:
1. devops.txt : Created empty file using `touch` command.
2. notes.txt : Created text file with some content using `cat` command.
3. script.sh : Using `vim` command, I have created this .sh file and at the same time added some `echo` commands.
4. project : Using `mkdir` command, created an empty directory and modified the permission to 755 using `chmod` commands. 

<img width="385" height="60" alt="image" src="https://github.com/user-attachments/assets/ab6f6760-a581-48eb-b4d5-1eeece6d61da" />

## Permission Changes:
* Below are the permissions when I created files (Before Modified):
  
|file/directory|permission(symbolic)|permission(numeric)|
|--------------|----------|---------------|
| notes.txt | -rw-rw-r--|664|
| devops.txt | -rw-rw-r--|664|
| script.sh | -rw-rw-r--|664|
| project | drwxrwxr-x|775|

* Below are the permissions after modifying the files:

|file/directory|permission(symbolic)|permission(numeric)|
|--------------|----------|---------------|
| notes.txt | -rw-r-----|640|
| devops.txt | -r--r--r--|444|
| script.sh | -rwxrw-r--|764|
| project | drwxr-xr-x|755|

## Commands Used:
* `touch devops.txt` - This creates an empty file with name devops.txt
* `cat notes.txt`: Cat command allow to create the notes.txt file and add content into file at the same time
* `echo “Sample text” >> notes.txt`: Appended content to the existing file content using ‘>>’ operator with echo command.
* `vim script.sh` : Using this file created the .sh file and added content to the file using vim editor tool.
* `echo “Hello DevOps Learners”` : shell script with one sample command.
* `chmod 764 script.sh` : Given execute permission to user for script.sh file.
* `chmod 464 script.sh` : Modified file permission to read only for user.
* `cat /etc/passwd | head -n 5` : Displays first 5 lines of /etc/passwd file
* `cat /etc/passwd | head -n 10`: Displays first 10 lines of /etc/passwd file
* `cat /etc/passwd | tail -n 5`: Displays last 5 lines of /etc/passwd file.
* `chmod +x script.sh` OR `chmod 764 script.sh`: Added execute permission to all user, group & other using ‘+x’ or with numeric value 764 with execute permission to user only.
* `chmod u+x script.sh` : Add execute permission to user only.
* `chmod g-x script.sh`: Removes execute permission of group, which is assigned with +x.
* `chmod -w devops.txt`: Removes write permission for all user, group & others.
* `chmod 444 devops.txt`: Assigned only read permission to user, group & others.
* `chmod 640 notex.txt`: Assinged read-write to user, read to group and none for others.
* `mkdir project` : When directory gets created by default with mkdir command, it will get created with 775 permission i.e. read-write-execute to both user & group and read-execute to others.
* `chmod 755 project` : Add read-write-execute to users, read-execute to group and others.

## Permission Management Snapshots (EC2 console)

<img width="491" height="320" alt="permission-management-" src="https://github.com/user-attachments/assets/48cde25c-d397-4b71-b74c-9aa67332279e" />

<img width="407" height="161" alt="file-manipulation-7" src="https://github.com/user-attachments/assets/1d480d1f-6fc5-4be2-b589-04ebadfb6583" />

<img width="818" height="273" alt="file-manipulation-5" src="https://github.com/user-attachments/assets/110cc49b-5db6-4b31-9b86-719c9f684610" />




## What I Learned:
* Through this hands-on practice, I learned how we can create files and directory.
* By using Linux file management command, we can manage every file/directory and their access, which can help to maintain the security of the files.
* `chmod` command helps to manage the file access to ensure the system security by regulating which user, group can read, write & execute a file.
* When we try to access the read-only files using normal user, we can not able to make any changes into file/write content into the files.
* If we try to do so, we will get and error "ERROR: -- INSERT -- W10: Warning: Changing a readonly file"
* Even, shell scripts (.sh files) can not be useful for execution, until we give them the execute permission and that we can manage using `chmod` linux command.
* To manage the file/directory permission, we can either use numeric or symbolic modes of permission like +x, +w, +r, -x,-w,-r, etc.




