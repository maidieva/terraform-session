resource "aws_instance" "web" {
  ami           = "ami-01cd4de4363ab6ee8"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-session-instance"
  }
}

# // There are 2 main blocks in terraform
# // 1. Resourse block = Create and manage resources (AWS services or infrastructure)
#       - resourse nlovj expeects 2 labels
# // 2. Data source block = 

# Syntax:
# resource = block
# "aws_instance" - first label (resource type), predefined by Terraform
# "web" - second label (logical name or logical ID), defined by the author of the code
# ami = argument (consists of key/value pair), configuration of the resource
    # key is predefined by Terrafom, values are defined by author of the code

# Working directory
    # Root module
    # Place where you run Terraform commands
    # Folder where you have Terraform Configuration Files
