# Day 09 – Linux User & Group Management Challenge
## Users & Groups Created : I have created below 4 users and groups using the user & group management commands. 
* **Users** : tokyo, berlin, professor & nairobi

  <img width="427" height="94" alt="image" src="https://github.com/user-attachments/assets/3cb8599e-3c65-4a8b-9a7b-409a351d2a02" />
  <img width="488" height="49" alt="image" src="https://github.com/user-attachments/assets/20c94ec4-ce00-4fb1-83c4-51f5828c1292" />

* **Groups** : developers, admins & project-team

* <img width="273" height="88" alt="image" src="https://github.com/user-attachments/assets/c1c4b2fe-d651-4ec7-b780-52a63c866508" />

## Group Assignments : Assigned above users to the created groups as below.
|User|Assigned Groups|
|------|------|
|tokyo|tokyo,developers, project-team|
|berlin|users,berlin,developers,admins|
|professor|users,professor,admins|
|nairobi|users,nairobi,project-team|

EC2 Terminal Snapshot:

<img width="524" height="254" alt="image" src="https://github.com/user-attachments/assets/301a5697-a2a5-42ed-ad6f-8a19919fc251" />

## Directories Created: There are some directories I created manually and for each user there is one home directory also got created with the same name i.e. username

|permission|numeric-permission|directory|group|
|----------|------------------|---------|----|
|drwxr-x---|750|berlin|berlin|
|drwxr-x---|750|nairobi|nairobi|
|drwxr-x---|750|professor|professor|
|drwxr-x---|750|tokyo|tokyo|
|drwxrwxr-x|775|dev-project|developers|
|drwxrwxr-x|775|team-workspace|project-team|

EC2 Terminal Snapshot:

<img width="476" height="182" alt="image" src="https://github.com/user-attachments/assets/17b87126-c27a-4657-a7ae-d4796fb8b7a9" />

## Command Used:
### User Management Commands:
- `sudo useradd -m tokyo` : Created ‘tokyo’ user with home directory.
- `sudo passwd tokyo` : created new password for tokyo user.
- `cd /etc/passwd `: Shows user details with their group/home directory.
- `sudo adduser berlin`: Create user berlin with other details and password at the same time.
- `sudo adduser professor`: Create user ‘professor’ with other details and password at the same time.
- `sudo adduser nairobi` : Create user ‘nairobi’ with other details and password at the same time.
- `ls -l` : Check if the user's home directory has been created or not, under the ‘/home/’ directory.

Group Management Command:
- `sudo groupadd groupname`: Created new groups with names developers, admins & project-team
* e.g., `sudo groupadd developers`, `sudo groupadd project-team`, `sudo groupadd admins`
- `cat /etc/group`: Find/List the groups created under /etc/groups.
- `sudo gpasswd -a user group`: Assigned groups to the user or added user to any particular groups
* e.g., `sudo gpasswd -a tokyo developers`, `sudo gpasswd -a berlin developers`, `sudo gpasswd -a professor admins`, etc.
- `cat /etc/group | grep berlin`: To find a specific user's group
- `sudo usermod -aG project-team nairobi` - modified user Nairobi properties with group.

File Management Command:
- Created directory: /opt/dev-project
- To create a directory under the`/opt` folder, we need sudo access.
* `sudo mkdir dev-project`: Created a directory under the `/opt` folder with the name ‘dev-project’
* `sudo mkdir team-workspace` : Created directory ‘team-workspace’ using sudo access.
- Set group owner to developers: 
* `sudo chgrp developers dev-project`: Change group ownership for directory ‘dev-project’ from ‘root’ to ‘developers’.
- Set permissions to 775: 
* `sudo chmod 775 dev-project`: Change permission to 775 for the directory ‘dev-project’
* `sudo -u tokyo touch tokyo-sample.txt`: Created file Tokyo-sample.txt under dev-project folder using sudo.
* `sudo -u berlin vim berlin.txt`: Created ‘berlin.txt’ and added content to the file using the sudo user.
* `sudo vim Nairobi.txt` - Created a sample text file and added content to it. 
* `sudo -u Nairobi touch Nairobi-sample.txt` - Run a command as user Nairobi

EC2 Terminal Snapshot:
<img width="765" height="320" alt="image" src="https://github.com/user-attachments/assets/e4e4fb2b-c8cc-4053-bfdc-a6fb9c1ca1a3" />

## What I Learned
- Through this practice assignment, I learned how to create and manage users and groups in Linux.
- I explored different ways to manage user accounts, group memberships, and how to modify user-group assignments effectively.
- This exercise helped me understand the difference between the `useradd` and `adduser` commands and their practical use cases.
- The `useradd` command is a non-interactive command that requires options/flags to define user properties during creation, whereas `adduser` is an interactive utility that guides users through the creation process, including setting passwords and user details.
- By default, `useradd` does not create a home directory for the user. To create it during user creation, we need to use the -m option. On the other hand, `adduser` automatically creates the user's home directory.
- I also learned about the `chown` and `chgrp` commands and their differences:
  * `chown` is used to change the ownership of a file or directory. It can modify the user owner, group owner, or both.
  * `chgrp` is used specifically to change the group ownership of a file or directory.
- `chgrp` allows users to change group ownership of files they own (depending on permissions), whereas `chown` generally requires elevated privileges (sudo) when changing ownership to another user or modifying ownership beyond the user's permissions.

*This practice improved my understanding of Linux user administration, permissions, and ownership management.*
