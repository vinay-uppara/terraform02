resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admin123"
 db_subnet_group_name    = aws_db_subnet_group.sub-grp.id
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

resource "aws_db_subnet_group" "sub-grp" {
  name       = "mycutsubnet"
  subnet_ids = ["subnet-00d6f7f329a906aff", "subnet-06a89fbe2445a17b5"]

  tags = {
    Name = "My DB subnet group"
  }
}