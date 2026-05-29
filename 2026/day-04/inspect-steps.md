# Day-04 - Linux Practice : Note 2 - Service Inspection and Troubleshooting
1) Checking Service Status: This shows whether the service is active/running with PID, CPU & recent logs.
- systemctl ststus ssh : Checking ssh service status.
<img width="846" height="251" alt="image" src="https://github.com/user-attachments/assets/27ff8c84-b2db-418f-bda2-219572525c31" />

- systemctl is-enable ssh: checking if service is enabled at boot
<img width="959" height="82" alt="image" src="https://github.com/user-attachments/assets/b22074a7-6a04-4822-8c21-314cf3cdadf6" />
 
2) View Detailed service configuration:
- systemctl cat ssh: This displays the actual service file.
<img width="898" height="307" alt="image" src="https://github.com/user-attachments/assets/42ee1c7b-23b9-43d1-931e-c8151544468f" />

3) View logs of the service:
- journalctl -u ssh : Show all logs
- journalctl -u ssh -f : Show live logs

<img width="956" height="415" alt="image" src="https://github.com/user-attachments/assets/11cede0e-0159-433b-82a6-86381a9bc976" />

4) Check main process of Service:
- ps -ef | grep ssh : Show processes related to ssh.
<img width="956" height="122" alt="image" src="https://github.com/user-attachments/assets/4bd451f7-0d59-461d-b3ad-7a115dd5105d" />

# Quick Real Time Inspection Flow:

- systemctl status ssh
- journalctl -u ssh -f
- systemctl cat ssh
- ps -ef | grep ssh
