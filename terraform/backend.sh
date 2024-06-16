#!/bin/bash
component=$1
environment=$2
appVersion=$3
dnf install ansible -y
pip3.9 install botocore boto3
ansible-pull -i localhost, -U https://github.com/Sudheer459/expense-ansible-roles-tf.git main.yaml -e component=$component -e env=$environment -e appVersion=$appVersion
