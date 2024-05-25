resource "aws_sqs_queue" "main" {
  name = replace(local.name, "rtype", "sqs")
  tags = local.common_tags
  }

# # how to reference your local value?
# Syntax : local.local_name
# Example: local.name, local_common_tags

resource "aws_db_instance" "main" {
  allocated_storage    = 10
  identifier = replace(local.name, "rtype", "rds")
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = random_password.db_password.result
  parameter_group_name = "default.mysql8.0"
  tags = local.common_tags
  skip_final_snapshot  = var.env != "prod" ? true : false
  final_snapshot_identifier = var.env != "prod" ? null : "${var.env}-final-snapshot"
}
resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "%"
}
