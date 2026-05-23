# Day-2 Of 90DaysOfDevOps
# Linux Architecture, Processes & systemd

1) Linux Architecture:
* Basically, Linux architecture is a set of below layers:
- Application/End User (topmost layer): The end users or applications that are accessing/using the Linux OS.
- Shell (middle layer/second layer): The interface to communicate with the Linux core i.e. Kernel, in human readable language. 
  It mainly involves working on Command-Line Interfaces (CLI).
- Kernel (Heart of Linux): The core of the Linux OS. It directly talks with the system Hardware 
  using different shells (those are written in C programming).
- Hardware (Bottom layer): The internal layer which is made up of physical devices including CPU, RAM, Hard Drives, etc.

2) Processes: Everything in Linux is a process. 
- A Linux process is an instance of a running program. Whenever user executes a command or launches any application,
  a linux create a process to handle that request with a unique identifies i.e. PID. 
- Most of the processes are created by another process (parent process).
- 'systemd' is the very first process that is started by kernel after loading a bootloader. Its PID is '1' i.e. PID = 1.

3) systemd (PID = 1): It is the very first process started by Kernel, after loading the bootloader program, wherenver we Power On our system.
   
4) Process States: In Linux, a process state is a current condition of a program during its lifecycle. Different process state:
- Running : The process is either currently executing on CPU core or is ready to run. 
- Stopped : The process has been suspended by a singal, often from a user action.
- Zombies : The process has finished its execution, but still has an entry present in the system process table. 
- sleeping : The process is waiting for an event to occur such as user input, a network package. 

5) 5-commands that I used daily:
- cd: it use to Change directory path
- pwd: it shows Present Working Directory.
- kill: To terminate the process. 
- ls : to List directories/files.
- mkdir: to make a directory. 
- top: Provides a dynamic view of your linux system resource usage. 




