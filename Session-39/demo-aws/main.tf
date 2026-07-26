provider "aws"{
    region = "us-east-1" # N-virginia
}

resource "aws_instance" "server1"{
    #count=3
    ami = "ami-004f790b835b26145" # Amazon Linux 2 AMI
    instance_type = "t2.micro"
    tags = {
        Name = "server1"
        #Name = "server-${count.index}"
    }
}

output "server1_public_ip" {
    description="Public IP of server1"
    value = aws_instance.server1[*].public_ip
}
# terraform init 
# terraform plan
# terraform apply -auto-approve
# terraform init && Terraform plan && terraform apply -auto-approve