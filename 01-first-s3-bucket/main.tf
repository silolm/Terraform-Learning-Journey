# Configure AWS provider - tells Terraform how to connect to AWS
provider "aws" {
  # AWS region where we'll create resources
  region = var.aws_region # Uses the variable we defined
}

# Generate unique suffix for resource naming
# This prevents name conflicts in AWS (bucket names must be globally unique)
resource "random_id" "suffix" {
  # Length of random bytes (each byte = 2 hex characters)
  byte_length = 4 # Results in 8-character random string
}

# Main S3 bucket resource - this creates the actual S3 bucket
resource "aws_s3_bucket" "first_bucket" {
  # Bucket name construction:
  # - Uses project name from variable
  # - Uses environment from variable  
  # - Adds random suffix for uniqueness
  bucket = "${var.project}-${var.environment}-${random_id.suffix.hex}"

  # Tags for organization, cost tracking, and management
  tags = {
    Name        = "First S3 Bucket" # Display name
    Project     = var.project       # From our variable
    Environment = var.environment   # From our variable
    Owner       = var.owner         # From our variable
    ManagedBy   = "Terraform"       # Indicates IaC management
  }
}

# Optional: Enable versioning based on configuration
# This resource is CONDITIONAL - only created if enable_versioning = true
resource "aws_s3_bucket_versioning" "versioning_example" {
  # Terraform feature: count = 0 means don't create, count = 1 means create
  count = var.s3_config.enable_versioning ? 1 : 0

  # Reference the bucket we created above
  bucket = aws_s3_bucket.first_bucket.id

  # Versioning configuration block
  versioning_configuration {
    status = "Enabled" # Turn on versioning for the bucket
  }
}
