
output "db_instance" {
    value = { for key, instance in aws_db_instance.db_instance : key => instance.id }

}