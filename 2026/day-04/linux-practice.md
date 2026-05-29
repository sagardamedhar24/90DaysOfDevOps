# Day 04 - Linux-practice : Process and Services
+ Check Running process:
+ I used the Process-related commands below and noticed that every command has its own uses:
- ps aux:
<img width="675" height="304" alt="image" src="https://github.com/user-attachments/assets/c2f7f5dd-d3e6-48ca-9f88-7a859031d3ad" />

- ps -ef:
<img width="575" height="254" alt="image" src="https://github.com/user-attachments/assets/59059007-fd61-49ad-8fbc-523f5b1eb474" />

- pgrep ssh / pgrep cron: 
<img width="952" height="125" alt="image" src="https://github.com/user-attachments/assets/5f40a156-8a7b-4460-82be-42b5fe993756" />

+ Check running Services

+ systemctl is the main command used to manage systemd services in modern Linux distributions like Ubuntu, RHEL, CentOS, and Amazon Linux.
+ Service commands used for checking running services details:
- systemctl status cron:
<img width="954" height="275" alt="image" src="https://github.com/user-attachments/assets/f2d57185-aaf5-42fc-9de9-acadfb0c6fef" />

- systemctl list-units --type=service
<img width="955" height="331" alt="image" src="https://github.com/user-attachments/assets/d2d6d4e4-b380-4a0e-abd4-7c766bf49558" />

- systemctl --failed: To list failed services 
<img width="932" height="92" alt="image" src="https://github.com/user-attachments/assets/65ad5925-8ce9-4dcd-9cf3-cf24daba9f98" />

+ Check & troubleshooting Logs:
+ Linux log commands are very important for DevOps, system administration, and troubleshooting.
+ They help inspect application logs, system logs, authentication issues, crashes, and service failures.
- journalctl : Show all logs.
<img width="950" height="312" alt="image" src="https://github.com/user-attachments/assets/e80c5572-ea75-404e-8d9c-de89005fb0d8" />

- journalctl -f : Show live logs
<img width="944" height="184" alt="image" src="https://github.com/user-attachments/assets/19b48f5b-18d1-4025-805a-dda5c74f5082" />

- journalctl -u cron: checking logs for Cron service
<img width="959" height="386" alt="image" src="https://github.com/user-attachments/assets/a4e708e7-fabb-4481-928d-d620b647033e" />

- journalctl -u ssh: Checking logs for ssh service
<img width="959" height="386" alt="image" src="https://github.com/user-attachments/assets/ad45de1c-2ccc-4d53-b11e-fd4e07fdf136" />

