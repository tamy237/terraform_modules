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

# id of the VPC where security groups will be created
variable "vpc_id" {
  type        = string
  description = "VPC ID to attach security groups to"
}
