

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr


  tags = {
    Name = var.vpc_name
  }
}

## creation des soous réseaux (subnets) publics et privés

resource "aws_subnet" "public_subnet" {
  for_each = var.public_subnets
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name = each.value.name

  }
}

resource "aws_subnet" "private_subnet" {

  for_each = var.private_subnets
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value.cidr 
  availability_zone = each.value.az
  tags = {
    Name = each.value.name  
  
  }
}

## Ajout de la ressource aws_internet_gateway pour l'Internet Gateway

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = var.igw_name
  }
}

## Ajout de la ressource aws_eip pour le NAT Gateway

resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# ##configuration du NAT Gateway pour permettre aux instances dans le subnet privé d'accéder à Internet

resource "aws_nat_gateway" "my_natigw" {
  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public_subnet["public_app"].id

  depends_on = [aws_internet_gateway.my_igw]

  tags = {
    Name = var.natigw_name
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.private_route_table_name
  }
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.my_natigw.id
}

resource "aws_route_table_association" "private_associations" {
  for_each = aws_subnet.private_subnet

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_route_table.id
}

# resource "aws_route_table_association" "private_db_subnet_route_table_association" {
#   subnet_id      = aws_subnet.private_subnet["private_db"].id
#   route_table_id = aws_route_table.private_route_table.id
# }

