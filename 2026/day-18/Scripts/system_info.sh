#!/bin/bash
# Script for System Information Report

set -euo pipefail

# Function to Display hostname & OS Info 

system_info(){
	echo "======== Hostname & OS Info ========"
	echo "Hostname : $(hostname)"
	echo "OS Name \& Version : $(lsb_release -ds)"
	echo "Current Login User: $(printenv USER)"
	echo 

}

get_uptime(){

	echo "========= System Uptime ========="
	echo "Total Uptime: $(uptime -p)"
	echo "Exact Date & Time of Boot: $(uptime -s)"
	echo "    "
}

get_disk_usage(){
	
	# df -h | head -n 1 : This commands prints headers at top
	# df -h | awk 'NR>1' : This will exclude header line from the output
	# sort -hr -k 5 : This will sort the output of df -h by column 5 (i.e. use %)
	# head -n 5 : Prints first 5 records
	echo "======== Disk Usage (Top 5 Disk Usage) ========"
	df -h | head -n 1; df -h | awk 'NR>1' | sort -hr -k 5 | head -n 5 
	echo 

}

get_memory_usage(){

	echo "======== Memory Usage ======="
	free -h | awk 'NR==2 { print "Total:" $2 " Used:" $3 " Free:" $4 " Available:" $7}'
	echo
}

get_cpu_usage(){

	echo "========= Top 5 CPU consuming Processes ========="
	ps -eo pid,cmd,%cpu --sort=-%cpu | head -n 6
	echo 
}

main(){
system_info
get_uptime
get_disk_usage
get_memory_usage
get_cpu_usage

}

# Call Main Function
main 
