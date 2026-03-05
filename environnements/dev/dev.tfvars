vpc_cidr = "10.0.0.0/16"
vpc_name = "my_vpc"


public_subnets = {
  public_app = {
    name = "public_app_dev"
    cidr = "10.0.1.0/24"
    az   = "us-west-1a"
  }
}

private_subnets = {
  private_app = {
    name = "private_app_dev"
    cidr = "10.0.2.0/24"
    az   = "us-west-1a"
  }

  private_db = {
    name = "private_db_dev"
    cidr = "10.0.3.0/24"
    az   = "us-west-1b"
  }
}

ami_type = {
    ubuntu_20 = {
      ami_name         = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
      ami_virtualization_type  = "hvm"
      ami_owners               = ["099720109477"] # ID du propriétaire officiel d'Ubuntu sur AWS
    }
}

# instances = {
#   ec2_instances = {
#     frontend_instance = {
#       instance_name      = "frontend_instance"
#       instance_type      = "t2.micro"
#       subnet_key         = "public_app"
#       sg_key             = "frontend_sg_dev"
#     }
#     backend_instance = {
#       instance_name      = "backend_instance"
#       instance_type      = "t2.micro"
#       subnet_key         = "private_app"
#       sg_key             = "backend_sg"
#     }
#   }
# }

security_groups = {
  
    frontend_sg = {
      name        = "frontend_sg_dev"
      description = "Security group for frontend instances in dev environment"
      ingress = [
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
    backend_sg = {
      name        = "backend_sg_dev"
      description = "Security group for backend instances in dev environment"
      ingress = [
        {
          from_port   = 3000
          to_port     = 3000
          protocol    = "tcp"
          cidr_blocks = ["10.0.1.0/24"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
    db_sg = {
      name        = "db_sg_dev"
      description = "Security group for database instances in dev environment"
      ingress = [
        {
          from_port   = 3306
          to_port     = 3306
          protocol    = "tcp"
          cidr_blocks = ["10.0.3.0/24"]
        }
      ]
      egress = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      ]
    }
  
}

db_instance = {
  dev_db_instance = {
    db_name = "mydb"
    db_subnet_group_name = "private_db_dev"
    db_security_group_ids = ["db_sg_dev"]
    allocated_storage = 20
    instance_class = "db.t2.micro"
    engine = "mysql"
    engine_version = "8.0"
    username = "admin"
    password = "password123"
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot = true
    subnet_db_id = "private_db_dev"
  }
}