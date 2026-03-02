
resource "aws_instance" "frontend_instance" {
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}

resource "aws_instance" "backend_instance" {
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.security_group_ids
    ami           = var.ami_id
    instance_type = var.instance_type
    tags = {
        Name = "backend_instance"
    }
}

resource "aws_instance" "db_instance" {
    subnet_id = var.subnet_id
    vpc_security_group_ids = var.security_group_ids
    ami           = var.ami_id
    instance_type = var.instance_type
    tags = {
        Name = "db_instance"
    }
}

