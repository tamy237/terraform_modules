variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default = "ubuntuami"
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
  default = "subnet-12345678"
}

variable "security_group_ids" {
  type = list(string)
}
