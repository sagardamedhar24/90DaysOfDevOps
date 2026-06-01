# Linux Troubleshooting Runbook
A runbook is a set of step-by-step instructions for performing operational tasks or troubleshooting issues consistently.

Environment Basic: 
+ uname -a: displays all available system information about the Linux kernel and operating system. From the below output, I noticed that, it shows kernel OS type 'Linux', then hostname based on IP i.e. 'ip-172-31-43-160', Linux kernel version running on the system '6.17.0-1013-aws', Ubuntu build release for this kernel package '#13~24.04.1-Ubuntu', date and time when the kernel was compiled 'Fri Apr 24 21:50:45 UTC 2026', and other system information.
+ Output : Linux ip-172-31-43-160 6.17.0-1013-aws #13~24.04.1-Ubuntu SMP Fri Apr 24 21:50:45 UTC 2026 x86_64 x86_64 x86_64 GNU/Linux

+ lsb_release -a: Shows information about the Linux distribution installed on the system.
+ Output: 
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 24.04.4 LTS
Release:        24.04
Codename:       noble
+ <img width="812" height="107" alt="image" src="https://github.com/user-attachments/assets/0ec405b9-38eb-44c0-833f-c941fe1a3db0" />

+ cat /etc/os-release: This command reads the /etc/os-release file, which contains standardized information about the operating system.
+ <img width="836" height="187" alt="image" src="https://github.com/user-attachments/assets/27b66b07-3073-4692-a0bb-d304eb96ce14" />

Filesystem Santy:
+ mkdir /tmp/runbook-demo: creates runbook-demo folder under root/tmp folder.
+ <img width="889" height="278" alt="image" src="https://github.com/user-attachments/assets/1fc9d936-88fe-4cbf-943a-db8bb16dd6f0" />
+ cp /etc/hosts /tmp/runbook-demo/hosts-copy: Creates a copy of the hosts file under the root /tmp/runbook-demo folder.
+ <img width="949" height="272" alt="image" src="https://github.com/user-attachments/assets/38d152f3-0bb5-44a0-bff9-0c7ca15680bc" />

CPU/Memory:
+ top: From the output below, I noticed there are a total of 111 processes, with 110 sleeping and 1 running. No process in zombie or stopped status. Also, it shows the system has been up for the last 1.15 hr with idle CPU. And, RAM usage shows, 111 MB free out of 911 MB with 382MB used memory. Overall, system health looks fine. 
+ <img width="863" height="278" alt="image" src="https://github.com/user-attachments/assets/bda939d6-68ac-418e-b230-4864058b2aca" />

+ htop: The below output shows the interactive version of the top command. It showing CPU core 0 is using 0.0% & core1 is using 0.7%. And, memory usage : Mem [|||||||||||||||||||||||||||||....] 221M/911M suggest 211Mb is used out of 911Mb i.e. near about 25% of memory being used. 
+ <img width="839" height="274" alt="image" src="https://github.com/user-attachments/assets/df02ed91-b6c6-42c9-8f78-30001cc8fdd9" />

+ ps -o pid,user,pcpu,pmem,comm -p 529,977,2077 : This command shows specific columns for specific processes. The output below shows 0.0% CPU uses & 0.3% Memory uses for Crontab service. For SSH service, it shows 0.0% CPU & 0.8% for Memory usage. And, for Nginx service CPU usage is 0.0% & memory usage is 0.7%. So overall, all the services are running smoothly and not handling heavy traffic. 
+ Output:
    PID USER     %CPU %MEM COMMAND
    529 root      0.0  0.3 cron
    977 root      0.0  0.8 sshd
   2077 root      0.0  0.7 nginx
+ <img width="710" height="83" alt="image" src="https://github.com/user-attachments/assets/555bef4f-04fd-4796-9661-8eb9af8b2339" />
+ free -h: This command shows the current memory usage in an AWS EC2 instance in a human-readable form. Total column displays the total RAM available on the EC2 instance. Out of it, 377Mb is used, and available memory is 534Mb. So overall, 59% memory is still available on EC2 and 41% memory is actually utilized. 
+ <img width="737" height="122" alt="image" src="https://github.com/user-attachments/assets/4fd56363-cf64-42ed-8921-df068e77accb" />

Disk/IO:
+ df -h: The output below shows disc usage in human readable format. The command output shows the root filesystem disc usage. Total size is 6.8GB, of which 2.6GB is used, and 4.2GB is available. i.e 39% disc is occupied by main root filesystem. Hence, we can conclude that there is no disk space issue and it is healthy.
+ <img width="487" height="148" alt="image" src="https://github.com/user-attachments/assets/4776afb5-f34a-4606-9c50-1ae437fe946a" />
+ iostat: This command is used to monitor CPU utilization and disk I/O statistics. 
+ Linux 6.17.0-1013-aws (ip-172-31-43-160)        06/01/26        _x86_64_        (2 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.13    0.02    0.09    0.07    0.01   99.67

Device             tps    kB_read/s    kB_wrtn/s    kB_dscd/s    kB_read    kB_wrtn    kB_dscd
loop0             0.00         0.03         0.00         0.00        347          0          0
loop1             0.01         0.38         0.00         0.00       4431          0          0
loop2             0.03         0.16         0.00         0.00       1842          0          0
loop3             0.01         0.03         0.00         0.00        381          0          0
loop4             0.06         2.22         0.00         0.00      26153          0          0
loop5             0.03         0.15         0.00         0.00       1824          0          0
loop6             0.00         0.00         0.00         0.00         10          0          0
nvme0n1           3.62       111.78        68.27         0.00    1315529     803426          0
+ If disk usage becomes high i.e. >80% we can investigate in below few sample steps:
+ Find Largest directories: command: sudo du -sh /* | sort -hr
+ Check logs: sudo du -sh /var/log/*
+ Clean package cache: sudo apt clean
+ Remove Old Logs: sudo journalctl --vacume-time=7d

Network:
+ netstat -tulpn: This commands shows the network ports that are listening on our EC2 instance. From the below output, I see that Port no: 22 (SSH), 80 (HTTP Web Server) & 53 (DNS Resolver) are listening ports, and 68 & 323 are active ports. 
+ ss -tulpn: This command also uses for same purpose as above but it is a modern replacement for netstat. 
<img width="896" height="326" alt="image" src="https://github.com/user-attachments/assets/a9467004-82fa-48db-bb2f-9e025ac14b6b" />
+ curl localhost:
+ <img width="959" height="382" alt="image" src="https://github.com/user-attachments/assets/532367b9-e67a-4a68-a31d-ff60aa79d0b8" />
  
Logs: 
+ journalctl -u nginx -n 50: This command shows the last 50 log entries for the Nginx service. As per the below output, Nginx service was started successfully by the systemd service. And, there are no recent errors. 
Output:
Jun 01 15:08:40 ip-172-31-43-160 systemd[1]: Starting nginx.service - A high performance web server and a reverse proxy server...
Jun 01 15:08:40 ip-172-31-43-160 systemd[1]: Started nginx.service - A high performance web server and a reverse proxy server.
+ journalctl -u ssh -n 50 : This command shows the last 50 log entries for SSH service. Below logs shows, SSH service running smoothly, Login via EC2 instance connect succedded. Several internet bots attempted username enumeration, all suspicious attempts were rejected before authentication, and no sign of unauthorized access in the logs. 
+ <img width="958" height="406" alt="image" src="https://github.com/user-attachments/assets/26e0ef24-6daa-4e8c-9cee-b78d69057950" />

Suppose the user cannot access the application? So, below is the typical troubleshooting flow:
+ sudo systemctl status nginx
+ ss -tulpn | grep :80
+ curl localhost
+ sudo journalctl -u nginx -n 50
+ sudo tail -f /var/log/nginx/error.log

If all above troubleshooting steps does not shows any issue but things get worse, then below steps can be taken:
1) If High CPU usage: i.e. CPU = 95%
Possible cause: Infinite loops, Excessive nginx traffic
Action: Identify the process, restart the service if appropriate, scale horizontally, and tune the application.
2) High Memory Usage: Suppose Total Memory: 900 Mb & Used memory: 890 Mb
Possible cause: Memory leak, Java heap to large, Too many containers, etc.
Actions: Restart the service, Increase instance size, fix memory leak,
3) Disk space Full: i.e. used = 95%
Action: Clean logs, Remove unused Docker resources.

At last: 
- Restart Services
- Free Resources
- Scale Infrastructure
- RollBack Deployment, if any latest deployment causing an issue.
- After Recovery, Root Cause Analysis is the best approach.
