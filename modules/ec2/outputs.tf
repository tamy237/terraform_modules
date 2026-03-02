# adresses IP des instances créées par le module
output "frontend_ip" {
  value = aws_instance.frontend_instance.public_ip
}

output "backend_ip" {
  value = aws_instance.backend_instance.public_ip
}

output "db_ip" {
  value = aws_instance.db_instance.public_ip
}