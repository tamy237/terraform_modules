
resource "aws_db_instance" "db_instance" {
  for_each = var.db_instance
  db_subnet_group_name = each.value.db_subnet_group_name
  allocated_storage    = each.value.allocated_storage
  db_name              = each.value.db_name
  engine               = each.value.engine
  engine_version       = each.value.engine_version
  instance_class       = each.value.instance_class
  username             = each.value.username
  password             = each.value.password
  parameter_group_name = each.value.parameter_group_name
  skip_final_snapshot  = each.value.skip_final_snapshot
  vpc_security_group_ids = each.value.db_security_group_ids

}
