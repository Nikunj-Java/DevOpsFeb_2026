provider "aws" {
    region = var.aws_region
}

resource "aws_instance" "web_server"{
    ami=var.ami_id
    instance_type=var.instance_type
    key_name=var.key_name
    vpc_security_group_ids=[aws_security_group.web_sg.id]
    ## Any Software installation part here

    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install -y nginx
                sudo systemctl enable nginx
                sudo systemctl start nginx   
            EOF

    tags = {
        Name = "WebServer"
    }
}

resource "aws_security_group" "web_sg"{
    name="web_sg"
    description="Allow HTTP and SSH traffic"
    # inbound rule
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    # outbound rule
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}