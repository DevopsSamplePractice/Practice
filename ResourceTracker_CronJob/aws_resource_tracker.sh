#!/bin/bash

#######
#Author: Harsh Kushwaha
#Description: Sample script to report the AWS resource usage
#Date:6th August 2025
#Version: v1
#######
# List of resources to be tracked
#
# AWS ec2
# AWS S3
# AWS lambda
# AWS IAM user

echo “Cron job ran at $(date)”

set -x

#list aws ec2

echo "Print ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'

# list aws s3 buckets
#
echo "Print s3 buckets"
aws s3 ls

#list aws lambda

echo "Print lambda functions"
aws lambda list-functions

#list iam users

echo "Print iam users"
aws iam list-users
                                   


