variable "ami"{
    description = "The AMI ID to use for the instance"
    type        = string
}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_id" {}
