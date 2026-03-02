output "vpc_id" {
  description = "value of de vpc id"
  value = aws_vpc.myvpc.id
}

output "public_subnet_id" {
  description = "the id of the public subnet"
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  description = "the id of the private subnet"
  value = aws_subnet.private_subnet.id
}

output "db_subnet_id" {
  description = "the id of the db subnet group (uses private subnet)"
  value       = aws_db_subnet_group.db_subnet_group.id
}