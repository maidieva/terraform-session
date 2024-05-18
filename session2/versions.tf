terraform {
    required_version = ">=1.8.0, <1.9" //terraform version
    required_providers { // provider version
        aws = {
            source = "hashicorp/aws"
            version = "~>5.49.0"
        }
    }
}

// 1.5.7 = symentic versioning
// 1 - major (upgrade) = main changes
// 5 - minor (update) = feautures/enhancements
// 7 - patch (patching) = fix vulnerabilities


// to ensure you are flexible with upcoming patches, provide a range and not a specific version
# 1.8.3 --> 1.5.x = (>=1,5, <1.6)
# 5.49.0 --> 5.49.x = (>=5.49, <5.50)
# Lazy constraints ~>

