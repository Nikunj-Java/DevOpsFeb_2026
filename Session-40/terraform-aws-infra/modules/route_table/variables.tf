variable "vpc_id"{
    description = "The VPC ID where the subnet will be created."
    type        = string
}

variable "igw_id"{
    description = "The ID of the Internet Gateway."
    type        = string
}

variable "route_table_name"{
    description = "The name of the route table."
    type        = string
}

variable "subnet_id"{
    description = "The ID of the subnet to associate with the route table."
    type        = string
}