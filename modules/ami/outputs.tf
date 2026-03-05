output "ubuntu_ami_id" {
  value = {
    for name, ami in data.aws_ami.ubuntu:
    name => ami.id 
  }
}