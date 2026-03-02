terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

module "network" {
  source = "./modules/network"
  vpc_cidr                   = var.vpc_cidr
  vpc_name                   = "myvpc"
  public_subnet_cidr         = var.public_subnet_cidr
  public_availability_zone   = var.public_availability_zone
  public_subnet_name         = "public_subnet"
  private_subnet_cidr        = var.private_subnet_cidr
  private_availability_zone  = var.private_availability_zone
  private_subnet_name        = "private_subnet"
  db_subnet_name             = "db_subnet_group"
}


module "ami" {
  source = "./modules/ami"
  
  ami_name_pattern         = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
  ami_virtualization_type  = var.ami_virtualization_type
  ami_owners               = var.ami_owners
}
module "sg" {
  source = "./modules/sg"
  
  frontend_sg = var.frontend_sg
  backend_sg  = var.backend_sg
  # db_sg       = var.db_sg
  vpc_id      = module.network.vpc_id
}

module "ec2_frontend" {
  source = "./modules/ec2"
  subnet_id         = module.network.public_subnet_id
  security_group_ids = [ module.sg.frontend_sg_id ]
  ami_id             = module.ami.ubuntu_ami_id
  instance_type      = var.instance_type
  instance_name      = "frontend_instance"
}

module "ec2_backend" {
  source = "./modules/ec2"
  subnet_id          = module.network.private_subnet_id
  security_group_ids = [ module.sg.backend_sg_id ]
  ami_id             = module.ami.ubuntu_ami_id
  instance_type      = var.instance_type
  instance_name      = "backend_instance"
}

module "db" {
  source = "./modules/db"
  
  subnet_db_id              = module.network.db_subnet_id
  db_subnet_group_name      = var.db_subnet_group_name
  db_security_group_ids     = [ module.sg.bd_sg_id ]
  allocated_storage         = var.allocated_storage
  instance_class            = var.db_instance_class
  engine                    = var.db_engine
  engine_version            = var.db_engine_version
  db_name                   = var.db_name
  username                  = var.db_username
  password                  = var.db_password
  parameter_group_name      = var.parameter_group_name
  skip_final_snapshot       = var.skip_final_snapshot
}

