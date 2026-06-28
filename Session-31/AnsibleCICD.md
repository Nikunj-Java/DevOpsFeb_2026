# Deploy Application using Ansible + Github Action
- in this tutorial We will Deploy Application using ansible + aws + github-action 

## Step:1 Create AWS Ubuntu Instance
- copy/ download Below Details
```
public_ip_address: 
private.pem key
Username: ubuntu
```

## Step:2 Create Github Repository and Configure the Secrets
- Follow This Step By Step:
- 1. Goto> Settings
![alt text](images/image-1.png)

- 2. Choose> Secrets and Variables
![alt text](images/image-2.png)

- 3. Choose> Actions
![alt text](images/image-3.png)

- 4. New Repository Secrets
![alt text](images/image-4.png)

- 5. New Repository Secrets (AWS PRIVATE KEY)
 
![alt text](images/image-5.png)

- 6. New Repository Secrets (AWS HOST PUBLIC IP)
![alt text](images/image-6.png)

- 7. New Repository Secrets (AWS HOST USERNAME)
![alt text](images/image-7.png)

- 8. Check all Secrets are Added 
![alt text](images/image-8.png)

## Step:3 Push the code to the Github Repository