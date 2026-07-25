# IAC - Infrastructure as Code

- It is a method of managing and provisioning IT Infrastructure (server, networks,storage and databases) manage using files rather than mannual process
- DevOps team can manage the entire infrastucture settings using IAC

## Key Principles
----------------------------------
1. __Declarative approach:__ define the requirenment with state and system automatically adjust configuration to match

2. __Imperative Approach:__ Specify step by step instructions to get the desired requirenments.

3. __Version Control:__ Maintains the versioning

4. __Automation:__ We can Automate Everything using IAC 

5. __Scalability:__ Scale the Infrastructure

## Types of IAC

1. __Configuration Management:__
    -- mange software installation
    -- Ansible, Chef , Puppet
2. __Orchastration & provisioning:__
    -- Resurce Creation and Manage Multiple cloud Provider
    -- Terraform
3. __Container Orchastration:__
    -- Mangae Containerized Application and deployments
    -- Kubernetes, Docker, Docker Compose

### Use Cases
1. Deploy Resources on AWS , Azure and Google Cloud
2. Maintain environments for developement, testing and production
----------------------------------------------------------------------------------------
# Terraform
- it is IAC tool
- it manages all cloud infrastructre in declarative approach

## 1. Configuration Files:
- it uses .tf files for define infrastructure
- it is written in HCL(HashiCorp Configuration Language) Language
- in VS code install Extension : HashiCorp Terraform

## 2. Providers:
- allows your terreform to interact with cloud platform like GCP, AWS, Azure etc...
- Syntax
```
providers "aws"{
    region="us-east-1"
}

```
## 3. Reources:
```
resources "aws_instance" "example"{
    ami="image_id"
    instance_type="t2.micro"
}
```
```
resources "aws_instance" "example"{
    ami="image_id"
    instance_type=var.instance_type
}
```

## 4. Variables:
- varibale allows parametrization and make your code dynamic

```
variable "instance_type"{
    instance_type="t2.micro"
}
```

- create variable once and use it at multiple configuration

## 5. Output:
- display useful information once terraform infrastructure is deployed
```
output "instance_ip"{
    value="aws_instance.example.public_ip"
}

```

## 6. State Management:
```
terraform.tfstate
```
- store Terraform State
- track the resource changes(You can track using state management)

## 7. Workflow
__Step:1__ : initialize working directory: ```terraform init```
__Step:2__ : Show Execution plan: ```terraform plan```
__Step:3__ : create or update the infrastucture: ```terraform apply```
__Step:4__ : Delete he resources: ```terraform destory```

## 8. Installtion
Link: [Terraform Website](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list


sudo apt update

sudo apt-get install terraform
```
## Verify the Installation
```
terraform -version
```
```
Terraform v1.15.8
on linux_amd64
```