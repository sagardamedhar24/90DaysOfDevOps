# Day 19 – Shell Scripting Project: Log Rotation, Backup & Crontab
## Task 1: Log Rotation Script
* Create a `log_rotate.sh` that:
1. Takes a log directory as an argument (e.g. `/var/log/myapp`)
2. Compresses `.log` files older than 7 days using gzip
3. Delete `.gz` files older than 30 days
4. Prints how many files were compressed and deleted.
5. Exists with an error if the directory doesn't exists.
* **Script Code**:
    ```bash
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
    ```
* **Output**:

  <img width="727" height="415" alt="log_rotate_1" src="https://github.com/user-attachments/assets/850bdc9a-e0d6-483b-9d3c-9f25e4bc38a4" />

  <img width="408" height="469" alt="image" src="https://github.com/user-attachments/assets/a86112b8-cfc5-4392-96ba-665b8dcc9d22" />

## Task 2: Server Backup Script
* Create `backup.sh` that:
1. Takes a source directory and backup destination as arguments
2. Create a timestamped `.tar.gz` archieve (e.g. backup-2026-02-08.tar.gz)
3. Verifies the archive was created successfully
4. Prints archive name and size
5. Deletes backups older than 14 days from the destination
6. Handles errors — exit if source doesn't exist

* **Script Code:**
  ```bash
  #!/bin/bash
  # This script creates the backup of my DevOps-Practices folder
  set -euo pipefail

  source_dir=$1
  dest_dir=$2
  
  # Generate timestamp and single archive filename
  timestamp=$(date +%Y%m%m_%H%M%S)
  archive="backup_${timestamp}.tar.gz"
  
  check_source_dest(){
      if [[ ! -d "$source_dir" || ! -d "$dest_dir" ]]; then
          [ ! -d "$source_dir" ] && echo "Error: Source \"$source_dir\" does not exist." >&2
          [ ! -d "$dest_dir" ] && echo "Error: Destination directory \"$dest_dir\" does not exist." >&2
          exit 1
      fi
  }
  
  display_usage(){
      echo "Usage: ./backup.sh <source_dir> <dest_dir>"
  }
  
  create_backup(){
      echo "============ Backup Started ============="
      
      # Combined target path cleanly
      full_archive_path="$dest_dir/$archive"
      
      if tar -czf "$full_archive_path" "$source_dir" 2>/dev/null; then
          echo "Success: Backup Created Successfully with name: $archive"
          
          # Extract file size
          size=$(du -h "$full_archive_path" | awk '{print $1}')
          echo "Archive Name: $archive | Size: $size"
      else
          echo "Error: Backup failed to create" >&2
          exit 1
      fi
  }
  
  delete_old_backup(){
      echo "========== Deleting Old Backup =========="
      
      deleted_backup=$(find "$dest_dir" -type f -name "*.tar.gz" -mtime +14 -print -delete)
      
      if [ -n "$deleted_backup" ]; then
          echo "$deleted_backup"
          count=$(echo "$deleted_backup" | wc -l)
          echo "----------------------------------------"
          echo "Total files deleted: $count"
      else
          echo "No backups older than 14 days were found."
          echo "Total files deleted: 0"
      fi
  }
  
  main(){
      check_source_dest
      create_backup
      delete_old_backup
  }
  
  # Execute main function
  main
  
  ```

* **Output:**

  <img width="826" height="244" alt="image" src="https://github.com/user-attachments/assets/9715ece9-4e1c-43e1-9fbe-1eec87e20aa1" />

  <img width="733" height="455" alt="image" src="https://github.com/user-attachments/assets/bc0dfaa3-4e72-40fa-bf46-4e6ec7a2f600" />

## Task 3: Crontab
1. Read: `crontab -l` - what's currently scheduled?
   * Currently, there are no cron jobs scheduled.
   * `crontab -l` : This will listdown currently scheduled crontab entries for current logged in user. 

   <img width="279" height="44" alt="image" src="https://github.com/user-attachments/assets/b1bd49ec-bca1-4dab-bdd2-cc3a4647a0e8" />

3. Understand cron syntax:
   ```plaintext
   * * * * *  command
    │ │ │ │ │
    │ │ │ │ └── Day of week (0-7)
    │ │ │ └──── Month (1-12)
    │ │ └────── Day of month (1-31)
    │ └──────── Hour (0-23)
    └────────── Minute (0-59)
   ```
   * `crontab` (Crontable) is a system file and a command line utility in Unix/Linux used to scheduled automated tasks (Called Cron Jobs), to
     run repeatadly at specific times, dates or intervals.   
   * A standard crontab entry consists of 5 time fields as mentioned above followed by the command/script path to execute.
     
4. Write cron entries (in your markdown, don't apply if unsure) for:
  * Run log_rotate.sh every day at 2 AM.
  * I have scheduled this cron by using root user's crontab. (`sudo crontab -e`)
  * Cron Expression:
    ```bash
    # Cron for running log_rotate.sh script daily at 2:00 AM.
    0 2 * * * /bin/bash /home/ubuntu/DevOps-Practices/Day19/scripts/log_rotate.sh /var/log/nginx >> /tmp/cron_log_rotate.log 2>&1
    ```
  * Run backup.sh every Sunday at 3 AM
  * Cron Expression:
    ```bash
    # Cron for running backup.sh every Sunday at 3 AM.
    0 3 * * 7 /bin/bash /home/ubuntu/DevOps-Practices/Day19/scripts/backup.sh /home/ubuntu/DevOps-Practices/Scripts /home/ubuntu/Backups >> /tmp/cron_backup.log 2>&1

    # Cron for running backup.sh at every 2 minutes (For testing purpose)
    */2 * * * * /bin/bash /home/ubuntu/DevOps-Practices/Day19/scripts/backup.sh /home/ubuntu/DevOps-Practices/Scripts /home/ubuntu/Backups >> /tmp/cron_backup.log 2>&1
    ```
    
  * Run a health check script every 5 minutes
  * Cron Expression:
    ```bash
    # Running health check script (system_info.sh) at every 5 minutes (Testing Purpose)
    */5 * * * * /bin/bash /home/ubuntu/DevOps-Practices/Scripts/system_info.sh >> /tmp/cron_system_health.log 2>&1
    ```
  *  **Crontab Snapshot:**

  <img width="944" height="155" alt="image" src="https://github.com/user-attachments/assets/bf55cbeb-6292-41da-a867-a365c32a45e0" />

  <img width="895" height="60" alt="image" src="https://github.com/user-attachments/assets/ba8c1617-3a27-474b-aea9-aa1b000af5ff" />

## Task 4: Combine — Scheduled Maintenance Script
* Create `maintenance.sh` that:
1. Calls your log rotation function.
2. Calls your backup function.
3. Logs all output to `/var/log/maintenance.log` with timestamps.
4. Write the cron entry to run it daily at 1 AM.
* **Crontab Expression:**
  ```bash
    0 1 * * * /bin/bash /home/ubuntu/DevOps-Practices/Day19/scripts/maintenance.sh >> /tmp/cron_maintenance.log 2>&1
  ```
* **Script Code:**
  ```bash
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

  ```
* **Output:**

<img width="579" height="475" alt="image" src="https://github.com/user-attachments/assets/3e0d5f06-2f86-4ea5-9765-92c8565d651b" />

## What I Learned
* Through this hands-on practice & building these small but useful utilities, I learned how to:
1. Efficiently rotate logs and system logs directories organized and clean.
2. Use `find` with flags like `mtim` to target and filter older logs and files based on date/time.
3. Apply tools like `gzip` and `tar.gz` to compress large files and significantly reduce disk usage.
4. Generate unique, timestamped backup files using date formats and implement retention logic to clean up older archives.
5. Automate task execution using cron to minimize manual effort and capture automated execution logs effectively.
6. By calling already written scripts/functions into a different script as per our requirement, I learned how we can avoid code repetition, saving time and maintaining a clean architecture.

Overall, this exercise reinforced my shell scripting foundational skills and deepened my understanding of practical DevOps automation.
