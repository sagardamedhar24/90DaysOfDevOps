#!/bin/bash

set -euo pipefail

output_log="/var/log/maintenance.log"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Redirect all the output through awk to prepend timestamp to every line
exec > >(awk '{print strftime("[%Y-%m-%d %H:%M:%S]"), $0}' | sudo tee -a "$output_log") 2>&1

echo "------------- Starting Maintenance --------------" 

echo "Calling Log rotation script...."

sudo bash "$script_dir/log_rotate.sh" /var/log/demo

echo "Log rotation script execution completed ..."

echo "Calling Backup script..."

bash "$script_dir/backup.sh" /home/ubuntu/DevOps-Practices/ /home/ubuntu/Backups

echo "Backup Script execution completed..."

echo "------------- Maintenance Finished ---------------"


