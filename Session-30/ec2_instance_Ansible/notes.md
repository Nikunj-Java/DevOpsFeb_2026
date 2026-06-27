# AWS Instance Createtion Using Ansible
- To Create AWS ec2 instance using Ansible
## Step 1 : Install Required Collections

```
ansible-galaxy collection install amazon.aws
```
- Verify
```
ansible-galaxy collection list
```
- OUTPUT: 
```
amazon.aws
```

## Step 3: Install Python Packages
```
pip install boto3 botocore
```
or
```
sudo apt install python3-boto3 python3-botocore
```
- Verify:
```
 python3 -c "import boto3"
```
- if no error means everything is perfect

## Step:3 AWS Configuration
```
aws configure
```
- it is already done
## Step:4 Inventory file
- inventory.ini
```
[localhost]
localhost ansible_connection=local
```

## Step:5 Ansible Configuration
- ansible.cfg
```
[defaults]
inventory=inventory.ini
host_key_checking=False
```
## Step:6 Main Playbook
- main.yml
```
---
- name: Create AWS EC2 Instance
  hosts: localhost
  connection: local
  gather_facts: false

  roles:
    - create_ec2
```
## Step:7 Create Role
```
ansible-galaxy role init roles/create_ec2
```
## Step:8 Default Variables
- roles/create_ec2/defaults/main.yml
```
---
# defaults file for roles/create_ec2
instance_type: t2.micro

ami_id: ami-0c02fb55956c7d316

key_name: AnsibleNginx

security_group: launch-wizard-1

subnet_id: subnet-xxxxxxxx

instance_name: Demo-Ansible

region: us-east-1
```
## Step:9 Tasks
- roles/create_ec2/tasks/main.yml
```
---
# tasks file for roles/create_ec2
- name: Create EC2 Instance
  amazon.aws.ec2_instance:

    name: "{{ instance_name }}"

    key_name: "{{ key_name }}"

    instance_type: "{{ instance_type }}"

    image_id: "{{ ami_id }}"

    region: "{{ region }}"

    security_group: "{{ security_group }}"

    network:
      subnet_id: "{{ subnet_id }}"

    wait: true

    count: 1

    tags:
      Environment: Dev
      Owner: Ansible

  register: ec2
  # Display Instance Information
- name: Dipslay Instance Details
  debug:
    var: ec2.instnaces
  # Display Public IP
- name: Show Public IP
  debug:
    msg: "{{ ec2.instances[0].public_ip_address }}"

```
- keep vars, handlers,meta as it is
## Step: 10 Run the Playbook
```
ansible-galaxy main.yml
```