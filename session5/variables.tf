variable "region" {
    type = string
    description = "AWS Region"
    default = "usw2"
}

variable "env" {
    type = string
    description = "Environment"
    default = "dev"
}

variable "project" {
    type = string
    description = "Project name"
    default = "jerry"
}

variable "tier" {
    type = string
    description = "Application tier"
    default = "backend"
}

variable "team" {
    type = string
    description = "Team name"
    default = "cloud"
}

variable "owner" {
    type = string
    description = "Owner of the resource"
    default = "mer"
}

 variable "managed_by" {
    type = string
    description = "Managed by"
    default = "terraform"
}