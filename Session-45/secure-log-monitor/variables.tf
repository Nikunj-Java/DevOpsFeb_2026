variable "aws_region" {
  description = "AWS region in which to create the resources."
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Prefix used for resource names."
  type        = string
  default     = "secure-log-monitor"
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "t3.micro"
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH to the EC2 instance. Replace with YOUR_PUBLIC_IP/32."
  type        = string
}

variable "log_retention_days" {
  description = "CloudWatch Logs retention period."
  type        = number
  default     = 7
}
