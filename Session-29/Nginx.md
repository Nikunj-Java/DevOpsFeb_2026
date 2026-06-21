# Install NGINX Server On AWS EC2 Instance Using Ansible

## Step:1 Creating AWS Instance
- Create AWS Ec2 ubuntu instance
![ alt text](images/image-1.png)

- choose Ubuntu OS
![ alt text](images/image-2.png)

- Choose Instance Type
![ alt text](images/image-3.png)

- Add / Select Key Value Pair
![alt text](images/image-6.png)

- Add Network Setting 
![alt text](images/image-4.png)

- Launch The Instance
![alt text](images/image-5.png)

## Step:2 Wrinting Ansible Script
- 1. inventory.yml
```
all:
  hosts:
    aws1:
      ansible_host: YourIPAddress
      ansible_user: ubuntu
      ansible_ssh_private_key_file: MyAnsible.pem

```
- 2. nginx.yml 
```
---
- name: Install Nginx Server
  hosts: aws1
  become: yes

  tasks:

    - name: Update apt cache
      apt:
        update_cache: yes

    - name: Install Nginx
      apt:
        name: nginx
        state: present
    - name: Copy the HTML File To Default Location
      copy: 
        src: index.html
        dest: /var/www/html/index.html
        mode: '0644'
    - name: Start and Enabled Nginx
      service:
        name: nginx
        state: started
        enabled: yes
```
## Step:3 Run The Ansiblee Playbook
```
sudo ansible-playbook -i inventory.yml nginx.yml
```

## Task: Create Multiple Instance and Install Nginx server on That
- Hint Add Ip Address on Inventory.yml file
```
all:
  hosts:
    aws1:
      ansible_host: 54.85.6.146
      ansible_user: ubuntu
      ansible_ssh_private_key_file: MyAnsible.pem
    aws2:
      ansible_host: 100.84.6.2
      ansible_user: ubuntu
      ansible_ssh_private_key_file: MyAnsible.pem
     
```