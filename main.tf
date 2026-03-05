# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }

# provider "aws" {
#   region = "us-west-1"
# }

# module "network" {
#   source = "./modules/network"
#   vpc_cidr                     = module.network.vpc_cidr
#   vpc_name                     = module.network.vpc_name
#   # igw_name                      = module.network.igw_name
#   # natigw_name                   = module.network.natigw_name
#   public_subnets                = module.network.public_subnets_ids
#   private_subnets               = module.network.private_subnets_ids
# }

# module "ami" {
#   source = "./modules/ami"
#   ami_type = var.ami_type
# }
# module "sg" {
#   source = "./modules/sg"
#   vpc_id          = module.network.vpc_id
#   security_groups = var.security_groups
#   # frontend_sg = module.sg.frontend_sg.id
#   # backend_sg  = module.sg.backend_sg.id
#   # # db_sg       = var.db_sg
# }

# module "ec2_instances" {
#   source = "./modules/ec2"

#   ami_id = module.ami.ubuntu_ami_id

#   instances = {
#     for key, instance in var.instances :
#     key => {
#       instance_name = instance.instance_name
#       instance_type = instance.instance_type

#       subnet_id = module.network.public_subnet_ids[instance.subnet_key]

#       security_group_ids = [
#         module.sg.security_groups_ids[instance.sg_key]
#       ]
#     }
#   }
# }

# module "db_instance_id" {
#   source = "./modules/db"
#   db_instance = var.db_instance
# }


# # module "ec2_backend" {
# #   source = "./modules/ec2"
# #   subnet_id          = module.network.private_subnet_id
# #   security_group_ids = [ module.sg.backend_sg_id ]
# #   ami_id             = module.ami.ubuntu_ami_id
# #   instance_type      = var.instance_type
# #   instance_name      = "backend_instance"
# # }

# # module "db" {
# #   source = "./modules/db"
# #   subnet_db_id              = module.network.db_subnet_id
# #   db_subnet_group_name      = var.db_subnet_group_name
# #   db_security_group_ids     = [ module.sg.bd_sg_id ]
# #   allocated_storage         = var.allocated_storage
# #   instance_class            = var.db_instance_class
# #   engine                    = var.db_engine
# #   engine_version            = var.db_engine_version
# #   db_name                   = var.db_name
# #   username                  = var.db_username
# #   password                  = var.db_password
# #   parameter_group_name      = var.parameter_group_name
# #   skip_final_snapshot       = var.skip_final_snapshot
# # }

