output "vpc_id" {
 value = aws_vpc.my_vpc.id
}

# output "public_subnet_id" {
#   description = "the id of the public subnet"
#   value       = aws_subnet.public_subnet.id
# }
output "public_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.public_subnet :
    key => subnet.id
  }
}

output "private_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.private_subnet :
    key => subnet.id
  }
}

output "igw_id" {
  description = "the id of the internet gateway"
  value       = aws_internet_gateway.my_igw.id
}

output "natigw_id" {
  description = "the id of the nat internet gateway"
  value       = aws_nat_gateway.my_natigw.id
}

output "allocation_id" {
  description = "the allocation id of the nat eip"
  value = aws_eip.nat_eip.id
}

output "private_route_table_id" {
  description = "recuperation de l'id de la route privee"
  value = aws_route_table.private_route_table
}

output "private_subnet_route_table_association_id" {
  description = "recuperation de l'id de la route table association du sous reseau privé1"
  value = aws_route_table_association.private_subnet_route_table_association.id
}

output "private_db_subnet_route_table_association_id" {
  description = "recuperation de l'id routage de ce sous reseau prive_db"
  value = aws_route_table_association.private_db_subnet_route_table_association.id
}