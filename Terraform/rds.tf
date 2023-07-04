resource "aws_db_subnet_group" "public-db-subnet" {
  name       = "public_subnets"
  subnet_ids = [aws_subnet.New-public-subnet-1[0].id, aws_subnet.New-public-subnet-1[1].id]

  tags = {
    Name = "PublicDbSubnet"
  }
}


resource "aws_db_instance" "myinstance" {

  engine               = "mysql"
  identifier           = "my-rds"
  allocated_storage    =  20
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "admin"
  password             = var.db_password
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot  = true
  publicly_accessible =  false
  db_subnet_group_name = "${aws_db_subnet_group.public-db-subnet.name}"  // Based on the subnet's vpc rds will be launched in that particular vpc
  storage_type = "gp3"

  tags = {
    Name = "POC"
  }
}