output "db_instance_id" {
    description = "id de la base de donnees"
  value = aws_db_instance.bd_instance.id
}