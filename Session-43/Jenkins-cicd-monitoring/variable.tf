variable "aws_region" {
    description = "AWS Region"
    type= string
    default = "us-east-1"
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}
variable "key_name" {
  description = "Existing EC2 key pair name"
  type        = string
}
variable "email" {
  description = "Email Address for CloudWatch Alarm Notification"
  type        = string
}
# here we are not adding AMI ID , Terraform will automatically find the latest UBUNTU AMI ID Available