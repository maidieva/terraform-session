variable "env" {
    type = string
    description = "this variable is for environment"
    default = "dev"

}

variable "ports" {
    type = list(number)
    description = "A list of port numbers"
    default = [ 22, 3306, 443 ]

}
