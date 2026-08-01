module "web_server" {
  source = "./modules/ec2"
  ami = var.ami
  instance_type = var.instance_type
}