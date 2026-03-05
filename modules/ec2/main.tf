
# data "aws_ami" "selected" {
#   most_recent = true
#   filter {
#     name   = "name"
#     values = [ var.ami_type.ami_name ]
#   }
#   filter {
#     name   = "virtualization-type"
#     values = [ var.ami_type.ami_virtualization_type ]
#   }
#   owners = var.ami_type.ami_owners
# }

resource "aws_instance" "instance" {
    for_each = var.instances
  subnet_id = each.value.subnet_id
  vpc_security_group_ids = each.value.security_group_ids
  ami           = var.ami_id
  instance_type = each.value.instance_type
  tags = {
    Name = each.value.instance_name
  }
}
