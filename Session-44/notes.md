# AWS VPC Route Table --- Manual Setup Notes

## Scenario

We are manually building the AWS infrastructure first and later
converting the same architecture to Terraform.

The current step is configuring a **Public Route Table** so that
resources in a public subnet can communicate with the Internet through
an **Internet Gateway (IGW)**.

------------------------------------------------------------------------

# 1. Architecture

``` text
                         Internet
                            |
                            |
                    Internet Gateway
                            |
                            |
                    Public Route Table
                       /          \
                      /            \
                 Subnet-1        Subnet-2
                    |               |
                  EC2-1           EC2-2
```

The route table controls where network traffic should go.

------------------------------------------------------------------------

# 2. Create the VPC Manually

Go to:

*__AWS Console → VPC → Your VPCs → Create VPC__*

Choose:
```
Name: devops-vpc
IPv4 CIDR:
10.0.0.0/16
```
### Create Two Subnets
We Want:
```
VPC
10.0.0.0/16
       |
       +--- Subnet-1
       |    10.0.0.0/20
       |
       +--- Subnet-2
            10.0.16.0/20
```
For An Example
```
Subnet-1
AZ: us-east-1a
CIDR: 10.0.0.0/20

Subnet-2
AZ: us-east-1b
CIDR: 10.0.16.0/20
```


------------------------------------------------------------------------

# 3. Internet Gateway

*__VPC → Internet Gateways → Create Internet Gateway__*

Name:
```
devops-igw
```
Then:
__Actions → Attach to VPC__
Select:
```
devops-vpc
```
------------------------------------------------------------------------

# 4. Create Public Route Table

Create a route table:

``` text
Name: Public-route-table
VPC: devops-vpc
```

AWS automatically creates:

``` text
Destination: 10.0.0.0/16
Target: local
```

Do not remove this route.

------------------------------------------------------------------------

# 5. Add Internet Route

Edit the routes of `Public-route-table`.

Add:

``` text
Destination: 0.0.0.0/0
Target: Internet Gateway
```

Then select the **actual Internet Gateway ID**.

Example:

``` text
0.0.0.0/0 → igw-0123456789abcdef
```

Save the changes.

The final route table should look like:

  Destination     Target           Meaning
  --------------- ---------------- ------------------------
  `10.0.0.0/16`   `local`          Traffic inside the VPC
  `0.0.0.0/0`     `igw-xxxxxxxx`   Internet traffic

------------------------------------------------------------------------

# 6. Understanding `0.0.0.0/0`

`0.0.0.0/0` means:

> Any IPv4 destination that does not match a more specific route.

Therefore:

``` text
0.0.0.0/0 → Internet Gateway
```

means:

> Send Internet-bound IPv4 traffic through the Internet Gateway.

# 7. Associate Route Table With Subnets

Now associate:
```
public-route-table
        |
        +---- subnet-1
        |
        +---- subnet-2
```

# 8. Create EC2 Security Group

Create:
```
Name: ec2-sg
VPC: devops-vpc
```
For your learning lab, allow:
```
HTTP
TCP
80
0.0.0.0/0
```

And SSH:
```
SSH
TCP
22
YOUR-IP/32
```
# 9. Launch EC2 Instance #1

Go:

EC2 → Launch Instance

Example:
```
Name:
web-server-1

AMI:
Amazon Linux

Instance type:
t2.micro / eligible current free-tier option

VPC:
devops-vpc

Subnet:
subnet-1

Auto assign Public IP:
Enable

Security Group:
ec2-sg
```
User data: 
```
#!/bin/bash

yum install -y httpd

echo "Hello From Server 1" > /var/www/html/index.html

systemctl start httpd
systemctl enable httpd
```
# 10. Launch EC2 Instance #2
Same configuration.

But choose:
```
Subnet:
subnet-2
```
And:
```
#!/bin/bash


yum install -y httpd


echo "Hello From Server 2" > /var/www/html/index.html


systemctl start httpd
systemctl enable httpd
```
Now you have:
```
             VPC
              |
       +------+------+
       |             |
    Subnet-1      Subnet-2
       |             |
      EC2-1         EC2-2
       |             |
   "Server 1"    "Server 2"
```

# 11. Test EC2 Individually

Copy:

EC2-1 Public IPv4

Open:
```
http://EC2-1-PUBLIC-IP

```
You should see:
```
Hello From Server 1
```
Then:
```
http://EC2-2-PUBLIC-IP
```
You should see:
```
Hello From Server 2
```

# PART B — ADD LOAD BALANCER MANUALLY

# 12. Create ALB Security Group

Create:
```
alb-sg
```
Inbound:
```
HTTP
TCP
80
0.0.0.0/0
```
Outbound:
```
All traffic
```
Your Terraform ALB module creates essentially this security group.

# 13. Create Target Group

Go:

*_EC2 → Target Groups → Create target group_*

Choose:
```
Target type:
Instances


Name:
web-target-group


Protocol:
HTTP


Port:
80


VPC:
devops-vpc
```
Health check:
```
Protocol: HTTP
Path: /
Port: traffic port
```

# 14. Register EC2 Instances

Add:
```
EC2-1
EC2-2
```
Port:
```
80
```
Now:
```
Target Group


+----------------+
| EC2-1 :80      |
+----------------+
| EC2-2 :80      |
+----------------+
```
Wait for:
```
healthy
healthy
```

# 15. Create Application Load Balancer

Go:

*__EC2 → Load Balancers → Create Load Balancer__*

Choose:
```
Application Load Balancer
```
Name:
```
devops-alb
```
Scheme:
```
Internet-facing
```
IP type:
```
IPv4
```
Select:
```
devops-vpc
```
Select both subnets:
```
subnet-1
subnet-2
```
Security group:
```
alb-sg
```
Listener:
```
HTTP : 80
```
Forward to:
```
web-target-group
```

# 16. Test ALB
Copy:
```
DNS name
```
Example:
```
http://devops-alb-xxxx.us-east-1.elb.amazonaws.com
```
------------------------------------------------------------------------