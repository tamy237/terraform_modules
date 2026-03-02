output "ubuntu_ami_id" {
  description = "ID of the latest Ubuntu AMI matching the pattern"
  value       = data.aws_ami.ubuntu.id
}