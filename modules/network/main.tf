resource "aws_vpc" "myvpc" { 
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.public_subnet_cidr[0]
  availability_zone = var.public_availability_zone
  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.myvpc.id 
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.private_availability_zone
  tags = {
    Name = var.private_subnet_name
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_name
  subnet_ids = [aws_subnet.private_subnet.id]
  tags = {
    Name = var.db_subnet_name
  }
}

