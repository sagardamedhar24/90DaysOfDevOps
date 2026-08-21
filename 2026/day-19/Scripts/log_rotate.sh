#!/bin/bash
# Tool for taking log files backup and deleting old logs older than 30 days.

set -euo pipefail

# Getting log directory path as an argument
LOG_DIR=$1


dir_exist(){

if [ ! -d "$LOG_DIR" ]; then 
	echo "Error: Direcotry $LOG_DIR does not exist."
	exit 1
fi
}

compress(){
	
	echo "===== Compressing all logs files with .log extention ====="
	compressed=$(find "$LOG_DIR" -type f -name "*.log.*" ! -name "*.gz" -mtime +7 -exec gzip {} \; -print | wc -l)

	echo "Total compressed log files: $compressed"

}

delete_old_log(){
	echo "==== Deleting .gz files older than 30 days ===="
	deleted=$(find "$LOG_DIR" -type f -name "*.gz" -mtime +30 -print -delete | wc -l)

	echo "Total deleted older log files: $deleted"
}

# Main Function to call above functions

main(){

	dir_exist
	compress
	delete_old_log
}

# Calling Main Function
main

