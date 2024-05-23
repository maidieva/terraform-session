terraform {
    required_version = "~>1.8.0" // version of terraform
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.49.0" // AWS provider versions
        }
    }
}

// ~> - lazy constraint
