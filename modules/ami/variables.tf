variable "ami_type" {
  type = map(object({
    ami_name = string
    ami_virtualization_type = string
    ami_owners = list(string)
  }))
}
