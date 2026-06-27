# Ansible Role
- it will organise files into standard directory structure.
- Think of ROles as Modules in Programming.
    - 1. Without Role: Everything in one file
    - 2. With Role: Separate file for tasks, Variable, Hnadlers, templates, file etc.
- An Ansible Role is a predefined directory structure that organizes all the files needed for a specific automation task.
- Instead of writting 
```
install nginx
copy configuration
start service
restart service
create users
```
inside one playbook
- But Here You Create One Role Called
```
nginx
```
that already contains everything
- Then your playbook becomes
```YAML
- hosts: web
  roles: 
    - nginx
```
That's it.

# Why Do We Need Roles?

Imagine you have to configure

- 50 web servers
- 20 database servers
- 10 application servers

Without Roles
```
Playbook
    ↓
Install nginx
Configure nginx
Start nginx
Copy HTML
Create Users
Firewall
```
1000+ lines
Its Hard To Maintain
But With Roles:
```
playbook

Roles

webserver
database
security
users
monitoring
```
Each role does one Job

## Create New Folder and Initiate Roles
```
ansible-galaxy role init roles/webserver 
# you can see folder named webserver under roles
```
## Give main logic
- tasks/main.yml(edit this)
```
- name: install nginx
  apt:
    name: nginx
    state: present
```

## Handlers: triggered by notify, used for restart
- handlers/main.yml(edit this)
```
- name: restart nginx
  service:
    name: nginx
    state: restarted
```
## Vars: varibale with high priority
- vars.main.yml(edit this)
```
nginx_port: 80
```
## Defaults
- Variable with low Priority
- easy to Override
- defaults/main.yml (edit this)
```
nginx_port: 8080
```

## Files
- here you can keep files which is the source code of your app
- like create index.html
- the edit tasks/main.yml
```
- name: install nginx
  apt:
    name: nginx
    state: present
# ADD THIS CODE
- name: Copy File
  copy:
    src: index.html # this lookup for file in files
    dest: /var/www/html/index.html
```
## Template

## Meta
- edit meta/main.yml
```
dependencies:
    - role: common
```
## How to use Role under playbook
- create playbook.yml
```
---
- name: Demo for Roles
  hosts: server1
  become: true

  roles:
    - webserver
```