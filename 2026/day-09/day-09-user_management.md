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

## Directories Created: There are some directories I created manually and for each user there is one home directory 
also got created with the same name i.e. username

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
- `ls -l` : Check if the user's home directory has been created or not under ‘/home/’ directory.

Group Management Command:
- `sudo groupadd developers`: Created new group for developers
- `sudo groupadd admins`: Created new group for admins
- `cat /etc/group`: Find/List the groups created under /etc/groups.


Test Users:
<img width="765" height="320" alt="image" src="https://github.com/user-attachments/assets/e4e4fb2b-c8cc-4053-bfdc-a6fb9c1ca1a3" />


