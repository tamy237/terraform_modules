data "aws_ami" "ubuntu" {
  for_each = var.ami_type
  most_recent = true
  filter {
    name   = "name"
    values = [ each.value.ami_name ]
}
  filter {
    name   = "virtualization-type"
    values = [ each.value.ami_virtualization_type ]
  }
  owners = each.value.ami_owners
} 
