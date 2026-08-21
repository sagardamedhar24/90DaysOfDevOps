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
