# wisecow-app
===> 1.Write a script to automate the backup of a specified directory to a remote server or a cloud storage solution. The script should provide a report on the success or failure of the backup operation.

Step 1: Install AWS CLI v2 Installing the AWS CLI (Command Line Interface) is essential for interacting with AWS services directly from the command line. Here’s why you need to install it for your backup script

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" sudo apt install unzip unzip awscliv2.zip sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin --update

step 3:create user and give policy of administrativeAccess (credentials ) step 4:IAM Role/Policy for EC2 Instance: Ensure your EC2 instance has the proper IAM role attached with the necessary permissions to access S3. If you’re using IAM roles for EC2, make sure the role has policies like AmazonS3FullAccess or a more restrictive policy that allows s3:PutObject actions on your bucket. • To Attach an IAM Role to an EC2 Instance: 1. Go to the AWS Management Console. 2. Navigate to the EC2 service. 3. Select the instance you want to attach the role to. 4. Click on "Actions" > "Security" > "Modify IAM role". 5. Choose an IAM role with S3 access permissions and apply

step 5: Setup your access by

aws configure (provide credentials of user)

step 6: Create the Log File

sudo touch /var/log/backup.log

step 7:change the ownership of log file sudo chown ubuntu:ubuntu /var/log/backup.log

step 8:change the permission,make script executable. chmod +x backupScript.sh

step 9:run the script. ./backupScript.sh

step 10:cheak logs cat /var/log/backup.log

===> 2.Create a script that analyzes web server logs (e.g., Apache, Nginx) for common patterns such as the number of 404 errors, the most requested pages, or IP addresses with the most requests. The script should output a summarized report.

step 1: install webserver

sudo apt install nginx

step 2:change the permission,make script executable.

chmod +x logFileAnalyzer.sh

step 3:run the script.

sudo ./logFileAnalyzer.sh

step 4:cheak logs and report

cd /var/log/nginx cat access.log cat web_server_report.log
