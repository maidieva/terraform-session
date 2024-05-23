resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2023.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.web.id ]
  user_data = data.template_file.userdata.rendered
  tags = {
    Name = "${var.env}-instance",
    Environment = var.env
  }
}

data "template_file" "userdata"{
  template = file("user_data.sh")
  vars = {
    environment = var.env
  }
}