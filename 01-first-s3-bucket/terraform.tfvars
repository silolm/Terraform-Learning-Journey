# =============================================================================
# PERSONAL CONFIGURATION - DO NOT COMMIT TO GITHUB
# =============================================================================

# 📋 BASIC PROJECT CONFIGURATION
project     = "first-terraform-project" # Your project identifier
environment = "development"             # Current environment
owner       = "connor"                  # Your name/identifier
aws_region  = "us-east-1"               # AWS region to use

# 🏷️ RESOURCE TAGS - metadata for AWS resources
tags = {
  Department = "devops"    # Organizational department
  CostCenter = "learning"  # For cost allocation
  Version    = "1.0"       # Project version
  Creator    = "connor"    # Who created it
  OS         = "Debian-13" # Operating system used
}

# 💾 S3 SPECIFIC CONFIGURATION
s3_config = {
  enable_versioning = false # Don't keep file versions (saves space)
  force_destroy     = true  # Allow Terraform to delete bucket with files
}

# 🔧 TERRAFORM BEHAVIOR
terraform_settings = {
  auto_approve = false # Always show plan before applying
  parallelism  = 10    # Number of concurrent operations
}

# ⚠️ SECURITY NOTE:
# Never add AWS credentials here
# Use AWS CLI configuration or environment variables instead
