# Terraform Project
- Create Production ready AWS Infrasturture

## Project Structure
 
```
terraform-project
|
|-- dev
|   |-- main.tf
|   |-- provider.tf
|   |-- terraform.tfvars
|-- test
|   |-- main.tf
|   |-- provider.tf
|   |-- terraform.tfvars
|-- prod
|   |-- main.tf
|   |-- provider.tf
|   |-- terraform.tfvars
|-- modules
|     |--ec2
|     |--vpc
|     |--security-group/
|     |--rds/
|     |--alb/
|     |--iam/
```
## Demo Project Structure
```
terraform-aws-project
|
|-- provider.tf
|-- backend.tf
|-- variables.tf
|-- terraform.tfvars
|-- main.tf
|-- output.tf
|-- modules
|     |--vpc/
|     |  |-- main.tf
|     |  |-- provider.tf
|     |  |-- variables.tf
|     |--subnet/
|     |  |-- main.tf
|     |  |-- provider.tf
|     |  |-- variables.tf
|     |--internet_gateways/
|     |  |-- main.tf
|     |  |-- provider.tf
|     |  |-- variables.tf
|     |--route_table/
|     |  |-- main.tf
|     |  |-- provider.tf
|     |  |-- variables.tf
|     |--security_group/
|     |  |-- main.tf
|     |  |-- provider.tf
|     |  |-- variables.tf
|     |--ec2/
         |-- main.tf
         |-- provider.tf
         |-- variables.tf
```
## Project
[Project Link:](terraform-aws-infra)