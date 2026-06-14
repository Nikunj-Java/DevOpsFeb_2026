# Amazon Web Services
- To Work With AWS(Amazon Web Services) You Need to Create AWS Account
- goto>google>aws login

![alt text](images/image.png)

![alt text](images/image-2.png)

- create your account and login (For Registration Debit/Credit Card is Mendatory)
- Note: Giving Debit Card Details is a Good Practise here in AWS
![alt text](images/image-3.png)

![alt text](images/image-4.png)
- Now Come back to Login

![alt text](images/image-5.png)
- choose Sign in using Root user

![alt text](images/image-6.png)

- use your registered email id and password and do the login

![alt text](images/image-7.png)

## Authenticator Application
- download Microsoft Authenticator Application
- Goto>AWS>top-right corner, select your name and number
- choose Security Credential

![alt text](images/image-8.png)
scroll down to the MultiFactor Authenticator(MFA) section and click Assign MFA Device

![alt text](images/image-9.png)

![alt text](images/image-10.png)

![alt text](images/image-11.png)

![alt text](images/image-12.png)

- Make Sure You are logged in in AWS and Authenticator app using same email id
![alt text](images/image-13.png)

- You are Done

- Logout from AWS and Do the Login Again
- Now you have 3 layer Security
    - Email ---> Password -----> MFA

-----------------------------------------------------------------------
# Creating AWS Instance

- goto > AWS > Search >EC2
- EC2 is Elastic Cloud Computing

![alt text](images/image-14.png)

![alt text](images/image-15.png)

![alt text](images/image-16.png)

- Choose Launch Without Walk Through

- Give the Name of your Instance
![alt text](images/image-17.png)

## Choose OS
- choose your OS (Linux)

![alt text](images/image-18.png)

## Kernel
- choose your free tier Kernel
![alt text](images/image-19.png)

- choose Instance Type (Free Tier)
![alt text](images/image-20.png)

## Key Pair
- Key pair is Needed if you want to connect your local machine with aws(remote)
![alt text](image.png)

![alt text](images/image-21.png)

- create Key Value Pairs with RSA and .pem key
![alt text](images/image-22.png)
- it will automatically doenloaded to your local machine
- save it for further use
![alt text](images/image-23.png)

## Network Settings
- click on Edit
![alt text](images/image-24.png)

- click on add security Group Rule
![alt text](images/image-25.png)

- add Port Range and Source
![alt text](images/image-26.png) 

## Storage
![alt text](images/image-27.png)

## Launch Instance
![alt text](images/image-28.png)

![alt text](images/image-29.png)

- if you are getting any error, Make sure you are in correct region while creating AWS Instance
- Generally its  'United States(N.Virginia)'
![alt text](images/image-30.png)

- click on instance
![alt text](images/image-31.png)

## Dashboard
![alt text](images/image-32.png)