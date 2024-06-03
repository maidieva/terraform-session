// metadata

variable "env" {
    type = string
    description = "Environment"
    default = "dev"
}

variable "project" {
    type = string
    description = "Project name"
    default = "nemo"
}

variable "app" {
    type = string
    description = "Application"
    default = "dori"
}

variable "team" {
    type = string
    description = "Team name"
    default = "devops"
}

// security group

variable "ec2_ports" {
    type = list(object({
        port = number
        protocol = string

    }
    ))
    default = [ {
      port = 80
      protocol = "tcp"
    },
    {
        port = 22
      protocol = "tcp"  
    } ]
}

variable "alb_ports" {
    type = list(object({
        port = number
        protocol = string

    }
    ))
    default = [ {
      port = 80
      protocol = "tcp"
    },
    {
        port = 443
      protocol = "tcp"  
    } ]
}
   

// launch template

variable "instance_type" {
    type = string
    description = "instance type"
    default = "t2.micro"  
}

variable "zone_id" {
    type = string
    description = "route 53"
    default = "Z0441039BX4IBU36UZUX"  
}