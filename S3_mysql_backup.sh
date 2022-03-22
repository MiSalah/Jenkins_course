#/bin/bash

DATE=$(date +%H-%M-%S)
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_ACCESS_KEY=$4
AWS_SECRET_KEY=$5
BUCKET_NAME=$6
BACKUP=database-$date.sql

# Local backup
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/BACKUP

# AWS Credentials
export AWS_ACCESS_KEY=$AWS_ACCESS_KEY && \
export AWS_SECRET_KEY=$AWS_SECRET_KEY && \
echo "uploading the backup" && \

aws s3 cp /tmp/db-$DATA.sql s3://$BUCKET_NAME/$BACKUP
