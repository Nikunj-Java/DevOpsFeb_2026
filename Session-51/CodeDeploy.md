# Code Deploy
```
GitHub /GithubAction
 ↓
CodeDeploy
 ↓
Ec2 Instance Deploy
```
## Step:1 Create EC2 Instance and Install Code Deploy
- Create Ubuntu Instance
- Open Port 80 and 5000
## Step:2 Create Role for EC2 Code Deploy
- 1. Create a New Role
```
I AM--> Create Role---> AWS Service--->Select EC2--->ServiceRoleEc2CodeDeploy
```
- 2. Attach Policies
```
AWSCodeDeployRole
AWSCodeDeployFullAccess
AmazonS3ReadOnlyAccess
```
- Create The Role
## Step:3 Attach Role to EC2 Instance
- EC2 Instance---> Action--->Security--->Modify IAM Role--> Attach the role "ServiceRoleEc2CodeDeploy"

## Step:4 Install CodeDeploy on EC2 Instance
[Code Deploy Docs](https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html)

- update the system
```
sudo apt update
```
- Upgrade the system
```
sudo apt upgrade -y
```
- Install wget
```
sudo apt install wget -y
```
- move to home directory
```
cd /home/ubuntu
```
- get the present working directory
```
pwd
```
- if any previous installer is available remove it
```
rm -f install
```
- download the new installer
```
wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latestv2/install
```
- Check
```
ls -l install
```
- Make it executable
```
chmod +x ./install
```
- Install Code Deploy Agent
```
sudo ./install auto
```
- Check the Status
```
sudo systemctl status codedeploy-agent
```