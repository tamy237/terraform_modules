# adresses IP des instances créées par le module

# output "instances_public_ips" {
#   value = { for key, instance in aws_instance.frontend_instance : key => instance.public_ip }
# }

# output "backend_instances_public_ips" {
#   value = { for key, instance in aws_instance.backend_instance : key => instance.public_ip }
# }

output "instances_public_ips" {
  value = {
    for key, instance in aws_instance.instance :
    key => instance.public_ip
  }

}