module "ec2" {
    # ####### module argument ###############
    source = "../../modules/ec2" // required arguiment, specifying location of the child module
    # version = "" // optional argument, where you specify thew version of you child module
####### Input Variables ######
    env = "dev"
    ami = "ami-01cd4de4363ab6ee8"
    instance_type = "t2.micro"
    sg = [ module.sg.security_group_id ]
}

module "sg" {
    source = "../../modules/sg" 

    env = "dev"
    ports = ["22", "80", "443"]
}
