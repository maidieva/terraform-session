variable "env"{
type = string
description = "this is to dwtermine the environment"
default = "dev"
}

variable "ami" {
    type = string
    description = "Amazon MAchine Image"
    default = "ami-01cd4de4363ab6ee8"
}

variable "instance_type"{
    type = string
    description = "Instance Size"
    default = "t2.micro"
}


variable "sg"{
    type = list(string)
    description = "ports"
    default = ["22", "80", "443"]
}
