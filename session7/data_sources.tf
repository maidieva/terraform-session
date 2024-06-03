data "aws_ami" "amazon_linux_2023" {
  most_recent      = true
  owners           = ["amazon"] //if Golden AMI - "self" or AWS account ID

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}