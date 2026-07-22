# Day 11 - File Ownership Challenge (chown & chgrp)

* Every file & directory in Linux has ownership. The owner & group in Linux are two different levels of file ownership.
* Owner is a single specific user account & group is a collection of multiple user accounts.
* Owner: It is a single user account that created or owns a file. Generally, it is represented as 'u' in Linux commands.
  The owner has the highest level of control for trust & special rights, such as changing the file permissions (chmod). 
* group: A designated set of multiple user accounts sharing common access needs. It allows collaboration so that a team of people can read, write or execute a shared file without opening access to the entire system. It is represented as 'g' in the Linux command. 

## Files & Directories Created
* devops-file.txt
* team-notes.txt
* project-config.yaml
* app-log/
* heist-project/vault/
* heist-project/plans/
* heist-project/vault/gold.txt
* heist-project/plans/strategy.conf
* bank-heist/
* bank-heist/access-codes.txt
* bank-heist/blueprints.pdf
* bank-heist/escape-plan.txt

## Groups & User Created
* Users: tokyo, berlin, nairobi, professor
* Groups: heist-team, planners, vault-team, tech-team

### Snapshot of Users & Groups:

<img width="956" height="481" alt="8" src="https://github.com/user-attachments/assets/1fa7d652-de54-4a76-a099-5680ffe83e61" />


<img width="674" height="422" alt="image" src="https://github.com/user-attachments/assets/831f1625-2e9b-4712-ba77-3fdfc4c60475" />

## Ownership changes
*Before Updating Owner:*

<img width="537" height="98" alt="image" src="https://github.com/user-attachments/assets/4bf647be-0ea4-44e1-953a-14ebf114e882" />

* -rw-rw-r-- 1 ubuntu ubuntu 0 Jul 21 15:52 devops-file.txt

*After Updating Owner to tokyo & berlin*

* -rw-rw-r-- 1 tokyo ubuntu 0 Jul 21 15:52 devops-file.txt 
* -rw-rw-r-- 1 berlin ubuntu 0 Jul 21 15:52 devops-file.txt

  <img width="937" height="86" alt="image" src="https://github.com/user-attachments/assets/dff3f870-240d-4a67-a19c-3e4ce9d82c22" />

* team-notes.txt : ubuntu:ubuntu -> ubuntu:heist-team (Changed group from ubuntu to heist-team)
* project-config.yaml : ubuntu:ubuntu -> professor:heist-team (Changed owner to professor & group to heist-team)
* app-log/ : ubuntu:ubuntu -> berlin:heist-team (Changed directory owner to berlin & group to heist-team)
* heist-project/ : ubuntu:ubuntu -> professor:planners (Changed owner to professor & group to planners)
* heist-project/plan/ : ubuntu:ubuntu -> professor:planners (Changed owner to professor & group to planners)
* heist-project/vault/ : ubuntu:ubuntu -> professor:planners (Changed owner to professor & group to planners)
* heist-project/vault/gold.txt: ubuntu:ubuntu -> professor:planners (Changed owner to professor & group to planners)
* heist-project/plan/strategy.conf: ubuntu:ubuntu -> professor:planners (Changed owner to professor & group to planners)
* bank-heist/access-codes.txt: ubuntu:ubuntu -> tokyo:vault-team (Changed owner to tokyo & group to vault-team)
* bank-heist/blueprints.pdf: ubuntu:ubuntu -> berlin:tech-team (Changed owner to berlin & group to tech-team)
* bank-heist/escape-plan.txt: ubuntu:ubuntu -> nairobi:vault-team (Changed owner to nairobi & group to vault-team)

<img width="752" height="341" alt="7" src="https://github.com/user-attachments/assets/2fc5e4d3-eaef-4644-b211-e7a37f6acde2" />

<img width="884" height="454" alt="9" src="https://github.com/user-attachments/assets/3bad18b7-a063-4497-935c-d515a24bca9f" />

## Commands Used
* `touch devops-file.txt`, `touch team-notex.txt` : To create a empty file. 
* `ls -l` : To check owner, group & other details of the files.
* `sudo chown user file-name.txt` : To update the owner of the file. (Mostly used with Sudo user)
* `sudo groupadd group-name` : To create new group.
* `cat /etc/passwd | tail -n 10` : To find the last 10 users
* `cat /etc/group | tail -n 5` : To find the last 5 groups
* `sudo chgrp group-name file-name` : To update the group of the file.
* `sudo chown owner:group file/directory-name` : To change owner & group for any file/directory at a time.
* `mkdir -p directory-name` : To create directory.
* `ls -lR directory-name` : To find all directory & sub-directories & files details recursively (-R).
  
## What I learned

Through this practice, I learned to manage file ownership.
* I learned how effectively we can manage file ownership using `chown` & `chgrp` Linux commands.
* Using owner(u) & group(g) options, we can either provide read, write & execute access to an individual user and a group of users to ensure the security of the files/directory.
* The commands `chown` & `chgrp` can not be accessed through a normal user, but we need a sudo user to use these commands.
* I even learned to manage ownership of any file/directory and its subdirectories collectively to avoid repetitive actions.   
