variable "aws_region"{
    description = "AWS region"
    type        = string
    default = "us-east-1"
}
variable "ami_id"{
    description = "Ubuntu AMI ID"
    type        = string
}
variable "instance_type"{
    description = "EC2 instance type"
    type        = string
    default     = "t2.micro"
}
variable "key_name"{
    description = "EC2 Key Name"
    type        = string
    
}
 
variable "email" {
  description = "Your Email Address"
  type        = string
  default     = "nikunj_soni_consultant@pw.live"
}