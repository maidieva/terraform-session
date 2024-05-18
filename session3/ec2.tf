resource "aws_instance" "web" {
  count = 3
  ami           = "ami-01cd4de4363ab6ee8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.web.id ]
  tags = {
    Name = "${var.env}-instance",
    Environment = var.env
  }
}

