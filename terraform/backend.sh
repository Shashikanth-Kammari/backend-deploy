#!/bin/bash
component=$1
environment=$2
appVersion=$3
dnf install ansible -y
pip3.9 install boto3 botocore 
ansible-pull -i localhost, -U https://github.com/Shashikanth-Kammari/expense-ansible-rules-tf.git main.yaml -e 
component=$component -e env=$environment -e app_version=$appVersion