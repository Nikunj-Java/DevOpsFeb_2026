module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = "my-vpc"
}

module "subnet" {
  source                    = "./modules/subnet"
  vpc_id                    = module.vpc.vpc_id
  cidr_block                = var.subnet_cidr
  availability_zone         = var.availability_zone
  subnet_name               = "PublicSubnet"
  map_public_ip_on_launch   = true
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source           = "./modules/route_table"
  vpc_id           = module.vpc.vpc_id
  subnet_id        = module.subnet.subnet_id
  igw_id           = module.internet_gateway.igw_id
  route_table_name = "PublicRouteTable"
}

module "ec2_instance" {
  source            = "./modules/ec2"
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = module.subnet.subnet_id
  security_group_id = module.security_group.security_group_id
}