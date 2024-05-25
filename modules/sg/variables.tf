variable "env"{
type = string
description = "this is to dwtermine the environment"
default = "dev"
}

variable "ports" {
    type = list(string)
    description = "ports"
    default = ["22", "80", "443"]
}
