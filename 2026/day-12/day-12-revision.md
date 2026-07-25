# Day 12 – Breather & Revision (Days 01–11)

* Today, I revised the concept from Day 01 to Day 11 to brush up the fundamentals of DevOps roadmap, so that it will help me to
Keep track what I learned till date.
* During revision, I rerun the few process-related & service status-related commands and observed that, I could not able to find
Docker service status. Later on, I clicked that Docker is not installed, so I installed it and checked again.
Commands Used:  `ps -ef`, `systemctl status cron`, `sudo systemctl status docker`, `sudo apt install docker.io`, `journalctl -u docker|tail -n 10`, etc.
* From this, I can understand that practice is the key to learning. Even it is a basic things.
* Even rerunning commands `free -h` & `df -h` and got a deeper understanding that free -h uses to show RAM usage & df -h shows the actual disk usage.
* Then I practiced some file operations and permission management commands for creating and managing access to the file. I created one directory using `mkdir -p Day12Practice` and created two sample files using `touch` and `vim` command.
* e.g. `touch day12.txt`, `echo "This is the 3rd line" >> day12.txt`, `vim script.sh`, etc
* Also, I created one new user 'denver' & group 'back-office' and added user denver to group 'back-office'. I have created a new file using the newuser command with sudo.

## Mini Self-Check
1. Which 3 commands save you the most time right now, and why?
* Below are the 3 commands that saved my time:
  1. `journalctl -u nginx | tail -n 10`: This combination of `journalctl` & `head`/`tail` command saved my time, becaused it shows me the limited number of lines from log.
  2. `grep` & `awk`: I mostly used these two commands to filter out the any log file content as per my need. We can apply text level, row & column level filteration on any major files.
  3. `sudo chown user:group filename` : I find the `chown` command is very useful when there are multiple files & we have to update user & group combinely at a time. If we want to apply the same group & user to any directory & its subdirectories/files, it is very useful to use this command recurssively (-R).
     
2. How do you check if a service is healthy? List the exact 2–3 commands you’d run first.
   1. Checking Service status: To find whether it is active & running or not.
      e.g. `systemctl status nginx`
   2. View detailed configuration of the service
      e.g. `systemctl cat nginx`: Displays the actual service file 
   3. View logs of the service
      e.g. `journalctl -u nginx`, `journalctl -u nginx -f`
      
3. How do you safely change ownership and permissions without breaking access? Give one example command.
   * We can safely change ownership & permissions for any file/directory without breaking access, by avoiding recursive '-R' flag.
   * We can strictly allow write & execute permission only at the user level using the `chmod` command. So, this restricts access for modifying the file & execution of the file at the group level and other users.
     e.g. `chmod 744 sample.txt` 
   
4. What will you focus on improving in the next 3 days?
   * I am not able to find sufficient time, or even if time is available, I am not able to make proper utilization of the time for my practice.
   * So, I will focus to improving my time management skills to achieve my target goal.
     
Below are the some snapshots of command re-run:
<img width="755" height="268" alt="1" src="https://github.com/user-attachments/assets/a78b395f-0862-4d53-ac31-5d8ccc8876a6" />

<img width="959" height="464" alt="2" src="https://github.com/user-attachments/assets/fb007b30-352a-440b-b506-ebf9b0ba7a74" />

<img width="784" height="454" alt="5" src="https://github.com/user-attachments/assets/8bf4d050-174b-47f0-b32d-d944bb7e4ced" />

<img width="842" height="470" alt="6" src="https://github.com/user-attachments/assets/b97698a3-e9b9-46b4-b14c-2188452166c3" />

<img width="800" height="433" alt="8" src="https://github.com/user-attachments/assets/7d2f43c6-15f5-4264-bf69-eb370bc223e3" />





 
