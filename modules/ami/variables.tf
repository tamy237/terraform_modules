variable "ami_name_pattern" {
  type        = string
  description = "Pattern de nom de l'AMI à rechercher"
  default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}

variable "ami_virtualization_type" {
  type        = string
  description = "Type de virtualisation de l'AMI"
  default     = "hvm"
}

variable "ami_owners" {
  type        = list(string)
  description = "Liste des propriétaires d'AMI"
  default     = ["099720109477"]   # Canonical
}

