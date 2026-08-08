# Cloud Watch in AWS
- it is AWS Resource Monitoring Tool
- Suppose you have created an AWS ec2 instance and its CPU Memory Utilization exceeds 70% and Above(Greater tha 70%) in a minute, so it will automatically triggers an alarm and send notification to You on an email
```
EC2 Instance
   │
   │ CPU Utilization
   ▼
CloudWatch
   │
   │ CPU > 70%
   ▼
CloudWatch Alarm
   │
   ▼
SNS
   │
   ▼
Email
```
## Step by Step Guide to Create AWS CloudWatch Alarm
![alt text](images/image-1.png)

![alt text](images/image-2.png)

![alt text](images/image-3.png)

![alt text](images/image-4.png)

![alt text](images/image-5.png)

![alt text](images/image-6.png)

![alt text](images/image-7.png)

![alt text](images/image-8.png)

![alt text](images/image-9.png)

![alt text](images/image-10.png)

![alt text](images/image-11.png)

![alt text](images/image-12.png)

![alt text](images/image-13.png)

- confirm the Subscription in EMAIL(Check Spam Folder)
![alt text](images/image-14.png)

## Shootout the CPU Utilization
- Connect Your EC2 Instance

![alt text](images/image-15.png)

- let's install Load on EC2 Instance
```
sudo apt update
```
```
sudo apt install stress-ng -y
```
```
stress-ng --version
```
- Generate Load - This will use 2 CPU workers for 5 minutes.
```
stress-ng --cpu 2 --timeout 5m
```
- If your EC2 has only 1 vCPU, use:
```
stress-ng --cpu 1 --timeout 5m
```
- Goto> CloudWatch>Your Alarm
![alt text](images/image-16.png)
- Now Monitor it for 5 Minutes
![alt text](images/image-17.png)
- From 'OK(Green)' to 'Alarm(Red)' it will Change
- 
![alt text](images/image-18.png)

![alt text](images/image-20.png)

![alt text](images/image-19.png)

- once load will be free Graph Automatically Goes Down
  
![alt text](images/image-21.png)

![alt text](images/image-22.png)

![alt text](images/image-23.png)

----------------------------------------------------------------------------------------------------

# Create CloudWatch Alarm Using Terraform
- we will reproduce the same manual CloudWatch demo using Terraform

## Setup
```
Terraform
   │
   ├── EC2 Ubuntu
   │      └── stress-ng installed
   │
   ├── SNS Topic
   │      └── Email subscription
   │
   └── CloudWatch Alarm
          │
          └── CPU > 70% for 2 minutes
                    │
                    ▼
                  SNS
                    │
                    ▼
                  Email
```
## Project Structure
```
terraform-cloudwatch-demo/
│
├── provider.tf
├── variables.tf
├── terraform.tfvars
├── main.tf
└── outputs.tf
```