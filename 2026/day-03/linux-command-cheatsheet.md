# Day-03 of 90DaysOfDevOps
# Linux Command Cheatsheet 
----------------------------------------------------------------------------------------------------------
**1) Process Management Commands: Linux process management commands are useful to monitor, control & manage processes.**
- ps : show/displays currently running processes.
- ps -ef: Shows detailed process list
- ps -u: Show processes for current user
- ps -p [pid] -o comm= : To find any process name using PID.
- pgrep [process_name] : Find PID by using process name.
- top (table of processes): Shows live CPU, memory & process usage.
- htop: An interactive, real-time system monitor & process manager command in linux
- pstree: Show process tree
- kill PID: Kill processes using PID.
- kill -9 PID: Forcefully stop processes. (user carefully as it stop process forcefully)
- pkill (eg. pkill firefox): kill process by process name
- jobs : To show background & suspended jobs in current shell session
- bg : Run processes in background
- free -h: Check memory usage 
   
**2) File System Management: File System Management commands are used to create files/directories, manage storage,
   view disk usage etc.**
- pwd: Shows current working directory path
- ls: displays files & directories within specified location
- ls -l: Show detailed list of files & directories
- ls -a: show hidden fiels
- cd: change directory
- cd .. : Go bakc to directory
- cd ~: Home Directory
- mkdir: Create directory
- rmdir: remove empty directory
- touch: create an empty file
- cp: copy files & directories
- mv: Move or Rename file/directory
- rm: delete file & directory.
- cat: View file content
- head: first lines of file
- tail: last lines of file
   
**3) Network Troubleshooting Commands: Network commands are used to check connectivity, troubleshoot DNS/network issues, monitor ports, etc.**
- ping : check connectivity (eg. ping www.google.com)
- ifconfig: Shows IP Address and interface details
- ip: modern network command
- netstats: Show network connection (Show listening ports)
- traceroute [website/ip]: Trace Network path
- nslookup: DNS lookup

**4) Linux User & Permission Management: Linux User Management command are used to create users, manage user, manage groupt, etc.
User Management:**
- useradd: Create new user (eg. sudo useradd username)
- passwd: Set password for user (eg. sudo passwd sagar)
- adduser: Create user with interactive user input form for creating other details at the same time
- id: Show user information
- whoami: Current login user
- usermod: Modify user
- userdel: Delete user
- groupadd: Create group
- groupdel: Delete group
- groupmod: Modify group
  
Permission Management:
- chmod : Change permissions
- chown: Change ownership
- chgrp: Change Group ownership
