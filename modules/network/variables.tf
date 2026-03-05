

variable "vpc_cidr" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "public_subnets" {
  type = map(object({
    name = string
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  type = map(object({
    name = string
    cidr = string
    az   = string
  }))
} 

variable "igw_name" {
  type = string
  default = "my_igw"
  description = "the name of the internet gateway"
}

variable "natigw_name" {
  type = string
  default = "my_natigw"
  description = "the name of the nat internet gateway"
}

variable "allocation_id" {
  type = string
  description = "the ip of the elastic ip"
}

variable "subnet_id" {
  type = string
  description = "the subnet were we will attach the nat gateway"
}

variable "private_route_table_name" {
type = string
}
