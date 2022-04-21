#!/bin/bash
value=$(head -1 /etc/os-release)
sub1='Ubuntu'
sub2='Amazon Linux'
if [[ "$value" == *"$sub2"* ]]
then
	yum -y install httpd
	systemctl start httpd
	echo "SUCCESS" > /tmp/result.txt
elif [[ "$value" == *"$sub1"* ]]
then
	apt update
	apt -y install apache2
	echo "SUCCESS" > /tmp/result.txt
else
	echo "This is not Amazon Linux or Ubuntu OS type..."
fi
