
variable "db_instance" {
  type = map(object({
    db_name = string
    db_subnet_group_name = string
    db_security_group_ids = list(string)
    allocated_storage = number
    instance_class = string
    engine = string
    engine_version = string
    username = string
    password = string
    parameter_group_name = string
    skip_final_snapshot = bool
    subnet_db_id = string
  }))
}