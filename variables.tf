##creation des variables pour le module vpc et subnets

variable "vpc_name" {
  type = string
  default = "myvpc"
  description = "The name of the VPC to create"
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
  description = "The CIDR block for the VPC"
}

variable "public_subnet_name" {
  type = string
  default = "public_subnet"
  description = "The name of the public subnet to create"
}

variable "private_subnet_name" {
  type = string
  default = "private_subnet"
  description = "the name of te private subnet to create"
}

variable "public_subnet_cidr" {
  type = list(string)
  default = ["10.0.1.0/24"]
  description = "public subnet cidr to create"
}

variable "private_subnet_cidr" {
    type = string
    default = "10.0.2.0/24"
    description = "private subnet cidr to create"
  
}


variable "public_availability_zone" {
  type = string
  default = "us-west-1a"
  description = "availability zone for public subnet"
}

variable "private_availability_zone" {
  type = string
  default = "us-west-1a"
  description = "availability zone for private subnet"
}

variable "db_subnet_name" {
  type = string
  default = "db_subnet_group"
  description = "db subnet name to create"
}

variable "db_availability_zone" {
  type = string
  default = "us-west-1a"
  description = "availability zone for db subnet"
}

##  creation des variables pour le module security group

variable "frontend_sg" {
  type = string
  description = "The name of the frontend security group"
  default = "frontend_sg"
}
variable "front_ingress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    self      = bool
  }))
  default = [ {
    from_port = 5173
    to_port   = 5173
    protocol  = "tcp"
    self      = true
  } ]
  description = "The frontend security group ingress rules"
}

variable "front_egress" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [ {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    
  } ]
  description = "The frontend security group egress rules"
}

variable "backend_sg" {
  type = string
  description = "The name of the backend security group"
  default = "backend_sg"
}
variable "back_ingress" {
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    self      = bool
  }))
  default = [ {
    from_port = 3000
    to_port   = 3000
    protocol  = "tcp"
    self      = true
  } ]
}

variable "back_egress" {
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr_blocks = list(string)
  }))
  default = [ {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } ]
  description = "The backend security group egress rules"
}

variable "bd_ingress" {
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    self      = bool
  }))
  default = [ {
    from_port = 3306
    to_port   = 3306
    protocol  = "tcp"
    self      = true
  } ]
}

variable "bd_egress" {
  type = list(object({
    from_port = number
    to_port   = number
    protocol  = string
    cidr_blocks = list(string)
  }))
  default = [ {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } ]
  description = "The backend security group egress rules"
}
variable "bd_sg_name" {
  type = string
  default = "bs_sg"
  description = "the name of the data base security group"
}

## creation des variables pour le module ami et instance

variable "ami_name_pattern" {
  type        = string
  description = "Pattern de nom de l'AMI à rechercher"
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}

variable "ami_virtualization_type" {
  type        = string
  description = "Type de virtualisation de l'AMI"
  default     = "hvm"
}

variable "ami_owners" {
  type        = list(string)
  description = "Liste des propriétaires d'AMI"
  default     = ["099720109477"]   # Canonical
}


variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_name" {
  type = string
  description = "the name of instances"
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  type        = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
  description = "id of the subnet to create the instance in"
}

variable "security_group_ids" {
  type = list(string)
  default = [ "frontend_sg", "backend_sg" ]
}


## creation des variables pour le module db
variable "db_name" {
  type        = string
  description = "name of the data base"
  default     = "mybd"
}

variable "db_subnet_group_name" {
  type        = string
  default = "MyDB"
  description = "Name of the DB subnet group"
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage (GB)"
  default     = 10
}

variable "db_engine" {
  type        = string
  description = "Database engine"
  default     = "mysql"
}

variable "db_engine_version" {
  type        = string
  description = "Database engine version"
  default     = "8.0"
}

variable "db_instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "db_username" {
  type        = string
  description = "Master username for the database"
  default     = "dbuser"
}

variable "db_password" {
  type        = string
  description = "Master password for the database"
  sensitive   = true
  default     = "foobarbaz"
}

variable "parameter_group_name" {
  type        = string
  description = "Parameter group name"
  default     = "default.mysql8.0"
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Skip final snapshot on deletion"
  default     = true
}
// ...existing code...
variable "subnet_db_id" {
  type = string
  description = "value of subnet ids"
}

variable "db_security_group_ids" {
  type = list(string)
  default = [ "bd_sg" ]
  description = "security groupe of the db"
}


