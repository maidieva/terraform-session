resource "aws_security_group" "main" {
  name        = "main"
  description = "Allow SSH and HTTP "

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // all ports, protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// creating ssh key

resource "aws_key_pair" "main_key" {
  key_name   = "meerimsmac_key"
  public_key = file("~/.ssh/id_rsa.pub")
}


resource "aws_instance" "web" {
    depends_on = [ null_resource.main ] //explicit dependency
  ami           = "ami-01cd4de4363ab6ee8"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.main.id ] //implicit dependancy
  key_name = aws_key_pair.main_key.id //implicit dependency
  provisioner "file" { //provisioner block is always within the mother block
    source = "/Users/meerimaidieva/Desktop/terraform-session/session8/index.html" //the path to the file is? local
    destination = "/tmp/index.html" //where the path is going. remote 
  }
  connection {
    type = "ssh" //type of the connection being established
    user = "ec2-user" //username
    host = self.public_ip //public IP for the ec2 instance, dont need to refence the labels due to it being within the same block
    private_key = file("~/.ssh/id_rsa")
  }
  provisioner "remote-exec" {
    inline = [      
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html" 
      ]
    
    connection {
    type = "ssh" //type of the connection being established
    user = "ec2-user" //username
    host = self.public_ip //public IP for the ec2 instance, dont need to refence the labels due to it being within the same block
    private_key = file("~/.ssh/id_rsa")
  }
}
}

resource "null_resource" "main" {
    provisioner "local-exec" {
        command = "echo 'Testing local exec, file, remote-exec provisioners' > index.html"
    }
  
}