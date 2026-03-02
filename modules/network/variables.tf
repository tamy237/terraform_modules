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

