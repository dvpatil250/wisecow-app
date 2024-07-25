#!/bin/bash

# Nginx access log file
LOG_FILE="/var/log/nginx/access.log"  
 # Nginx-specific report file location
REPORT_FILE="/var/log/nginx/web_server_report.log" 

# Ensure the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Log file $LOG_FILE does not exist."
    exit 1
fi

# Create or clear the report file
: > $REPORT_FILE

# Count 404 errors
echo "Number of 404 Errors:" >> $REPORT_FILE
grep " 404 " $LOG_FILE | wc -l >> $REPORT_FILE

# Most requested pages
echo -e "\nMost Requested Pages:" >> $REPORT_FILE
# For Nginx logs, the URL is typically the 7th field in the log format
awk '{print $7}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 10 >> $REPORT_FILE

# IP addresses with the most requests
echo -e "\nIP Addresses with Most Requests:" >> $REPORT_FILE
# For Nginx logs, the IP address is typically the 1st field in the log format
awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 10 >> $REPORT_FILE

# Output the report
cat $REPORT_FILE
