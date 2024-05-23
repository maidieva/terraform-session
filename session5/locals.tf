# // Naming convention: naming standard
# 1. Provider name: aws, azure, google
# 2. Region: use1, usw2, usw1
# 3. Environment: dev, qa, stage, prod
# 4. Project Name: batman, tom, jerry
# 5. Application Tier: frontend, backend, db
# 6: Resource Type: ec2, s3, alb

# Example: provider_name-region-env-project_name-application_tier-resource_type

# EC2: aws-usw2-dev-tom-frontend-ec2

# Tagging standard:
# 1. Environment: dev, qa, stage, prod
# 2. Project Name: batman, tom, jerry
# 3. Application Tier: frontend, backend, db
# 4. Team: cloud, devops, development
# 5. Owner: mer
# 6. Managed_by: cloudformation, terraform, python, manual

locals {
  name = "aws-${var.region}-${var.env}-${var.project}-${var.tier}-sqs"
  
  common_tags = {
    Environment = var.env
    Project = var.project
    Tier = var.tier
    Team = var.team
    Owner = var.owner
    Managed_by = var.managed_by
}
}
