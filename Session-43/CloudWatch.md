# AWS - EC2 - Jenkins - S3 bucket -  Jenkins Logs
- In This Tutorial we will create AWS EC2 Instance, Install Jenkins on it, Create S# bucket for Jenkins Logs Storage
## Final Flow of Project
```
Terraform
   │
   ├── EC2 Ubuntu
   │      ├── Java 21
   │      ├── Jenkins
   │      ├── CloudWatch Agent
   │      └── Jenkins logs
   │
   ├── IAM Role
   │
   ├── CloudWatch Log Group
   │
   ├── Metric Filter
   │       └── searches "ERROR"
   │
   ├── CloudWatch Alarm
   │       └── ERROR count > 5
   │
   └── SNS
           └── Email
```
## To check Available Keys
```
aws ec2 describe-key-pairs \
  --region us-east-1 \
  --query "KeyPairs[*].KeyName" \
  --output table
```