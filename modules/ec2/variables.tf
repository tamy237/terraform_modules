
variable "instances" {
  type = map(object({
    instance_name = string
    instance_type = string
    subnet_id     = string
    security_group_ids = list(string)
  }))
}
variable "ami_id" {
  type = string
}