variable "db_name" {
  type        = string
  description = "name of the data base"
  default     = "mybd"
}

variable "db_subnet_group_name" {
  type        = string
  description = "Name of the DB subnet group"
}

variable "allocated_storage" {
  type        = number
  description = "Allocated storage (GB)"
  default     = 10
}

variable "engine" {
  type        = string
  description = "Database engine"
  default     = "mysql"
}

variable "engine_version" {
  type        = string
  description = "Database engine version"
  default     = "8.0"
}

variable "instance_class" {
  type        = string
  description = "RDS instance class"
  default     = "db.t3.micro"
}

variable "username" {
  type        = string
  description = "Master username for the database"
  default     = "dbuser"
}

variable "password" {
  type        = string
  description = "Master password for the database"
  sensitive   = true
  default     = "foobarbaz"
}

variable "parameter_group_name" {
  type        = string
  description = "Parameter group name"
  default     = "default.mysql8.0"
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Skip final snapshot on deletion"
  default     = true
}
// ...existing code...
variable "subnet_db_id" {
  type = string
  description = "value of subnet ids"
}

variable "db_security_group_ids" {
  type = list(string)
  description = "security groupe of the db"
}