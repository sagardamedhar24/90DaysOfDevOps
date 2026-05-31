# Linux Troubleshooting Runbook
A runbook is a set of step-by-step instructions used to perform operational tasks or troubleshoot issues in a consistent way.

Environment Basic: 
+ uname -a: Provides detailed information about your's system's hardware and software configuration.
+ Output : Linux ip-172-31-43-160 6.17.0-1013-aws #13~24.04.1-Ubuntu SMP Fri Apr 24 21:50:45 UTC 2026 x86_64 x86_64 x86_64 GNU/Linux
+ lsb_release -a: 
+ <img width="548" height="100" alt="image" src="https://github.com/user-attachments/assets/be031d86-a125-46a2-ba40-c7e7c93b74c5" />
+ cat /etc/os-release: Shows details about current linux flavor that system has.
+ <img width="583" height="201" alt="image" src="https://github.com/user-attachments/assets/76fe42be-4883-4e70-a10e-0aa7172ad891" />

Filesystem Santy:
+ mkdir /tmp/runbook-demo: creates runbook-demo folder under root/tmp folder.
+ <img width="889" height="278" alt="image" src="https://github.com/user-attachments/assets/1fc9d936-88fe-4cbf-943a-db8bb16dd6f0" />
+ cp /etc/hosts /tmp/runbook-demo/hosts-copy : Creates copy of hosts file under root /tmp/runbook-demo folder.
+ <img width="949" height="272" alt="image" src="https://github.com/user-attachments/assets/38d152f3-0bb5-44a0-bff9-0c7ca15680bc" />

CPU/Memory:
+ top: Shows 
+ <img width="821" height="271" alt="image" src="https://github.com/user-attachments/assets/4adf2cd3-5f38-4e03-85c6-e5a8057b7f02" />
+ htop: shows interactive view 
+ <img width="959" height="287" alt="image" src="https://github.com/user-attachments/assets/4ef0d1df-d408-4c0e-abb6-890335d324d2" />

