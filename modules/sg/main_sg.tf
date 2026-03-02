
resource "aws_security_group" "frontend_sg" {
  name   = var.frontend_sg
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.front_ingress[0].from_port
    to_port     = var.front_ingress[0].to_port
    protocol    = var.front_ingress[0].protocol
    cidr_blocks = lookup(var.front_ingress[0], "cidr_blocks", null)
    self        = lookup(var.front_ingress[0], "self", null)
  }

  egress {
    from_port   = var.front_egress[0].from_port
    to_port     = var.front_egress[0].to_port
    protocol    = var.front_egress[0].protocol
    cidr_blocks = var.front_egress[0].cidr_blocks
  }
}

resource "aws_security_group" "backend_sg" {
  name   = var.backend_sg
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.back_ingress[0].from_port
    to_port     = var.back_ingress[0].to_port
    protocol    = var.back_ingress[0].protocol
    cidr_blocks = lookup(var.back_ingress[0], "cidr_blocks", null)
    self        = lookup(var.back_ingress[0], "self", null)
  }

  egress {
    from_port   = var.back_egress[0].from_port
    to_port     = var.back_egress[0].to_port
    protocol    = var.back_egress[0].protocol
    cidr_blocks = var.back_egress[0].cidr_blocks
  }
}

resource "aws_security_group" "bd_sg" {
  name   = var.bd_sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.bd_ingress[0].from_port
    to_port     = var.bd_ingress[0].to_port
    protocol    = var.bd_ingress[0].protocol
    cidr_blocks = lookup(var.bd_ingress[0], "cidr_blocks", null)
    self        = lookup(var.bd_ingress[0], "self", null)
  }

  egress {
    from_port   = var.bd_egress[0].from_port
    to_port     = var.bd_egress[0].to_port
    protocol    = var.bd_egress[0].protocol
    cidr_blocks = var.bd_egress[0].cidr_blocks
  }
}
