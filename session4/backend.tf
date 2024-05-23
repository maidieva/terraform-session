terraform {
    backend "s3" {
        bucket = "terraform-session-backend"
         key = "session3/terraform.tfstate" // path to the backend file (terraform.tfstate)
        region = "us-west-2"
    }
    }