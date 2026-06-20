# Ansible
- It is used to automate AWS Infrasturcture

## Install Ansible in Ubuntu
```
sudo apt update
sudo apt install ansible -y
```
## Check Ansible Version
```
ansible --version
```
- Output:
```
ansible [core 2.16.3]
  config file = None
  configured module search path = ['/home/skills/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  ansible collection location = /home/skills/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.12.3 (main, Mar 23 2026, 19:04:32) [GCC 13.3.0] (/usr/bin/python3)
  jinja version = 3.1.2
  libyaml = True
```
## Create Sample Ansible Playbook
- playbook.yaml
```
---
- name: Test Ansible Playbook
  hosts: localhost

  tasks:
  - name: Print Simple Message
    debug:
      msg: "Hello Ansible is Working"
```
## Run Playbook
```
ansible-playbook playbook.yaml
```
## Output

![alt text](images/image-23.png)