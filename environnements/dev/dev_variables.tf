variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "public_subnets" {
  type = any
  description = "Map of public subnet configurations"
}

variable "private_subnets" {
  type = any
  description = "Map of private subnet configurations"
}

variable "private_db" {
  type = string
  description = "Map of the private database subnet configuration"
}

variable "allocation_id" {
  type = string
}

variable "private_route_table_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "ami_type" {
  type = any
}

variable "instances" {
  type = any
  description = "Map of EC2 instance configurations"
}

variable "security_groups" {
  type = any
  description = "Map of security group configurations"
}

variable "db_instance" {
  type = any
  description = "Configuration for RDS database instance"
}

variable "alb_appli" {
  type = any
  description = "Map of Application Load Balancer configurations"
}

variable "albname" {
  type = string
}
variable "vpc_id" {
  type = string
}
# variable "target_instances" {
#   type = any
#   description = "List of target instance IDs for the load balancer"
# }

