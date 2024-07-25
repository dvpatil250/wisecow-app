#!/bin/bash 

#path of directory which directory we want to take backups 
SOURCE_DIR="/home/ubuntu/directory1/" 
#path cloud storage S3 where backup want to store 
S3_BUCKET="s3://dvpatilbucket/backup/" 
#logs of backups
LOG_FILE="/home/ubuntu/backup.log"    
#capture the current date and time in a specific format and store it 
DATE=$(date +'%Y-%m-%d %H:%M:%S')

# Function to log messages
log_message() {
    local message="$1"
    echo "$DATE - $message" >> "$LOG_FILE"
}

# Perform the backup
aws s3 cp "$SOURCE_DIR" "$S3_BUCKET" --recursive >> "$LOG_FILE" 2>&1

# Check the exit status
if [ $? -eq 0 ]; then
    log_message "Backup to S3 bucket $S3_BUCKET was successful."
else
    log_message "Backup to S3 bucket $S3_BUCKET failed."
fi

echo "Backup completed. Check $LOG_FILE for details."

# Add a cron job to run this script every day at 9 PM
CRON_JOB="0 21 * * * /home/ubuntu/backupScript.sh"
(crontab -l 2>/dev/null; echo "$CRON_JOB") | sort - | uniq - | crontab -
