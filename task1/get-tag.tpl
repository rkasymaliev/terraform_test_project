#!/bin/bash
yum -y install httpd
systemctl start httpd
aws configure set aws_access_key_id ${access_key}
aws configure set aws_secret_access_key ${secret_key}
aws configure set default.region ${region}
aws configure set default.output ${output}

REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')
INSTANCE_ID=$(ec2-metadata --instance-id | cut -f2 -d " ")

echo "<table><tr><th>Tag Key</th><th>Tag Value</th></tr>" > /var/www/html/index.html
for KEY in Date_creation OS_type Your_First_Name Your_Last_Name AWS_Account_ID
do
        TAG_VALUE=$(aws ec2 describe-tags --filters "Name=resource-id,Values=$INSTANCE_ID" "Name=key,Values=$KEY" --region=$REGION --output=text | cut -f5)
        echo "<tr><td>$KEY</td><td>$TAG_VALUE</td></tr>" >> /var/www/html/index.html
done
echo "</table>" >> /var/www/html/index.html
