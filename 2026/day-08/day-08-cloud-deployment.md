<img width="956" height="455" alt="image" src="https://github.com/user-attachments/assets/790b0fa4-dfb4-4e55-975b-ad13093f4764" /># Day-08 of 90DaysOfDevOps - Cloud Server Setup: Docker, Nginx & Web Deployments
## Part -1 : Launch Cloud Instance & SSH Access
* *Step -1* : Create a cloud instance
* I have created a free tier account on AWS and launched an `t3.micro` EC2 cloud instance with name 'Test' and Ubuntu OS image.
* While creating an instance, I have created a key pair login and downloaded the (.pem) file for future authentication during SSH client connection.
<img width="955" height="466" alt="image" src="https://github.com/user-attachments/assets/e0884e5e-be40-4a33-9d48-37fa456e51f4" />

* *Step-2* : Connect via SSH
* I have connected to the EC2 instance (Test) through the AWS console (with Running status) and also connected it using SSH client.
* While making an SSH client connection, I used below steps:
1. Since I am using Windows OS, I have installed Gtbash for linux practice. So, for SSH connection I opened Gitbash. 
2. Located my private key file (.pem) that I downloaded during instance creation.
3. Changed the .pem file permission using below command, for ensuring my key is not viewable publicly.
   Command: chmod 400 "sagar-test.pem"
4. Then connected to the instance using instance public DNS:
   Command:  ssh -i "sagar-test.pem" ubuntu@ec2-16-171-30-171.eu-north-1.compute.amazonaws.com
   <img width="944" height="484" alt="ssh-client-connection" src="https://github.com/user-attachments/assets/0aa284d4-c111-44b3-a7d3-ffa23f92128f" />
   <img width="958" height="500" alt="ssh-connection" src="https://github.com/user-attachments/assets/70dd4ee8-2c98-43f0-a5f3-283a38fffddf" />


*Issue:* While connecting to the EC2 instance using SSH, I noticed below error: 
* *"ssh: Could not resolve hostname ec2-16-171-30-171.eu-north-1.compute.amazonaws.com: Name or service not known"*

## Part-02 : Install Docker & Nginx
* *Step-1* - Update System
* `sudo apt-get update` - Using this command, I have dowloaded the latest package updates/lists.
* *Step-2* - Install Nginx & Docker
* `sudo apt-get install docker.io` - Using this command, I have downloaded the Docker CLI package on my EC2 server.
* `systemctl status docker` - Checked the current status of the docker service. It shows active & enabled.
* <img width="937" height="388" alt="installing-docker" src="https://github.com/user-attachments/assets/a253ae02-836c-471a-8a4b-c02fad16022d" />
* <img width="959" height="276" alt="docker-running-status" src="https://github.com/user-attachments/assets/af459c60-17e9-4593-b35e-2e20d23f78e9" />
* `sudo apt install nginx` - Installed Nginx web server/proxy server.
* `systemctl status nginx` - Checked the current status of the Nginx service. It shows active & enabled.
* <img width="871" height="242" alt="image" src="https://github.com/user-attachments/assets/86c8ece4-ce7a-484d-a2a0-ca090aea4351" />

## Part-03 : Security Group Configuration
* I have checked and noticed that HTTP port 80 is not opened for inbound rules in Security group configuration. So, I have added in the
  the inbound rule.
  <img width="956" height="455" alt="image" src="https://github.com/user-attachments/assets/fef07f84-2087-42d2-b445-a8b4fa61ce87" />

* And, then I visited the webpage on web-browser : `http://http://56.228.42.234/` .
  <img width="951" height="351" alt="Nginx-WebPage" src="https://github.com/user-attachments/assets/14a9a19b-e706-4ade-bbca-8cbeabb42734" />

## Part-04 : Extracts Nginx Logs
* *Step-1* - View Nginx Logs
* `journalctl -u nginx` - Using this command, I found all the logs of Nginx service.
* `journalctl -u docker` - Using this command, I found all the logs of Docker service.
* `journalctl -u docker >> docker-service.logs` - By using this command, I have created one file with .logs extention and saved log in this file using `journalctl` command.
* `journalctl -u nginx >> nginx-logs.txt` - By this command, I have created a .txt file and saved logs of nginx service to the file.
* `scp -i sagar-test.pem ubuntu@56.228.42.234:/home/ubuntu/nginx-logs.txt D:/TrainWithShubham/AWS/` - By `scp` command, I have downloaded the logs file from EC2 server to my local machine.
* `scp -i sagar-test.pem ubuntu@56.228.42.234:/home/ubuntu/docker-service.logs D:/TrainWithShubham/AWS/` - By this command, I have downloaded the other log file from EC2 server too my local machine.
  <img width="944" height="388" alt="image" src="https://github.com/user-attachments/assets/aac0ea8a-212f-43fe-aa7c-4fe9afaecd19" />

## Command Used For above tasks:
- `scp` : Used to transferring files from EC2 server to local machine.
- `journalctl -u` : Used for viewing the service logs.
- `systemctl status docker` - Used to find the docker service logs.
- `ssh -i` - Used to connect EC2 server from local maching using SSH client.
- `chmod 400 "sagar-test.pem"` - Used for modifying the permission of the .pem file to ensure keys are not viewable public.

## What I learned through todays Practice:
* Today, I learned how to create the AWS EC2 server and configure it as per our requirement.
* Learned about SSH (Secure Shell) and connecting to a server from the local system using SSH client.
* Installation of any application like Docker, Nginx
* How to find logs of any particular service using the 'journalctl' command.
* Also, I have learned to transfer files from server to client (i.e. local machine) or vice-versa.
* Learn about Public Key & Private Key
* Understood how important key-based authentication is in Linux servers. And, got to know about the practical usage of symmetric and Asymmetric Key authentication and how they help to avoid passwordless authentication.


