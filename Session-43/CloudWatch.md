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

## Project
[Project](Jenkins-cicd-monitoring)

## Start Jenkins
```http://<Your Public IP>:8080
```
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
```
Install Suggested Plugins
```
## Goto> AWS - Generate Logs
```
for i in {1..10}; do
  echo "$(date) ERROR Jenkins build failed - Database connection failed - Error $i" | sudo tee -a /var/log/jenkins/jenkins.log
done
```

## Jenkins Logs
```
sudo cat /var/log/jenkins/jenkins.log
```