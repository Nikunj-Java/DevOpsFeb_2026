variable "vpc_id"{
    description = "The VPC ID where the subnet will be created."
    type        = string
}

variable "cidr_block"{ 
    description = "The CIDR block for the subnet."
    type        = string
}

variable "availability_zone" {
    description = "The availability zone where the subnet will be created."
    type        = string
}

variable "subnet_name" {
    description = "The name of the subnet."
    type        = string
}

variable "map_public_ip_on_launch" {
    description = "Indicates whether instances launched in this subnet should receive a public IP address."
    type        = bool
    default     = false
}