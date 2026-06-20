# AWS CLI(Command Line Interface)
- it is used to connect local machine with Remote Server

## Installation (WSL)
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

## Check the Version
```
aws --version
```
- Output:
```
aws-cli/2.33.2 Python/3.13.11 Linux/6.6.87.2-microsoft-standard-WSL2 exe/x86_64.ubuntu.24
```
## OPEN AWS Console
- Goto> Search> Type: I am
- Select I AM Users (Right Side)
- Create New User
![alt text](images/image-1.png)

![alt text](images/image-2.png)

- choose ec2 Full Access
![alt text](images/image-22.png)

![alt text](images/image-4.png)

![alt text](images/image-5.png)

- Create Access Key
![alt text](images/image-6.png)

- choose CLI
![alt text](images/image-7.png)

- confirm the checkbox and click Next

![alt text](images/image-8.png)

- click on Create Access Key
![alt text](images/image-9.png)

- copy the Access Key And Secreat Key Some where on your System (Or Download .CSV File)

- Click on Done

## Open WSL
- configure aws
```
aws configure
```
- Fill The Below Details From AWS Access Key, Secrete Key, AWS Region, JSON Format
![alt text](images/image-10.png)
- You Are All Set With REMOTE and LOCAL Server Connectivity

## Create New AWS Instance
![alt text](images/image-11.png)

- Choose Default AWS Linux Instance,t3.micro 

- Create New KEY Value Pair
![alt text](images/image-12.png)

- Now Download that Recent Key Value Pair
![alt text](images/image-13.png)

- Create New Key Value Pair
![alt text](images/image-14.png)

- goto > Download Folder and Open WSL there (Make Sure Key .pem is Available in that Folder)
![alt text](images/image-15.png)

- Add Network Settings on aws

![alt text](images/image-16.png)
- Launch the instance

- Choose the recent instance and click on connect

![alt text](images/image-17.png)

- Choose SSH
![alt text](images/image-18.png)

- copy Example

![alt text](images/image-19.png)

## Open WSL 
- Paste the Copied SSH (add sudo at the Begining of ssh)
![alt text](images/image-20.png)

![alt text](images/image-21.png)

- We are Done with Connectivity
