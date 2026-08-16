resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true 
    enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route  {
    cidr_block="0.0.0.0/0"
    gateway_id=aws_internet_gateway.igw.id
  }
}

resource "aws_subnet" "subnet" {
    count = 2
    cidr_block = cidrsubnet("10.0.0.0/16",4,count.index)
    vpc_id = aws_vpc.main.id
    availability_zone = data.aws_availability_zones.available.names[count.index]
    map_public_ip_on_launch = true

}
resource "aws_route_table_association" "public_assoc" {
  count = length((aws_subnet.subnet))
  subnet_id = aws_subnet.subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

data "aws_availability_zones" "available" {}
resource "aws_security_group" "ec2_sg" {
    name = "ec2_sg"
    description = "Allow HTTP and SSH"
    vpc_id=aws_vpc.main.id
    ingress {
        from_port=80
        to_port=80
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]

    }
    ingress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }
  
}

resource "aws_instance" "web" {
    count = var.instance_count
    ami="ami-0150ccaf51ab55a51"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.subnet[count.index].id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    //iam_instance_profile= aws_iam_instance_profile.ec2_profile.name
    user_data = <<-EOF
    #!/bin/bash
    sudo yum install -y httpd amazon-cloudwatch-agent
    echo "Hello From server ${count.index+1}"> /var/www/html/index.html
    sudo systemctl start httpd
    sudo systemctl enable httpd
    cat <<EOC > /opt/aws/amazon-cloudwatch-agent/bin/config.json
    {
      "logs":{
        "logs_collected":{
          "files":{
            "collect_list":{
              "file_path":"/var/log/messages",
              "log_group_name":"/ec2/web/messages",
              "log_stream_name":"{instance_id}"
            }
          }
        }
      }
    }
    EOC
    /opt/aws/amazon-cloudwatch-aget/bin/amazon-cloudwatch-agent-cli \
    -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s
    EOF

    
    tags = {
      Name="web-server-${count.index+1}"   }
  
}