module "ec2" {
    source = "github.com/maidieva/terraform-session//modules/ec2" 

    env = "dev"
    ami = "ami-01cd4de4363ab6ee8"
    instance_type = "t2.micro"
    sg = [ module.sg.security_group_id ]
}

module "sg" {
    source = "github.com/maidieva/terraform-session//modules/sg" 

    env = "dev"
    ports = ["22", "80", "443"]
}

