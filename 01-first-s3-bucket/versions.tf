# Terraform version and providers configuration
terraform {
  # Minimum Terraform version required (1.0 or higher)
  required_version = ">= 1.0"

  # Define which providers we need and their versions
  required_providers {
    # AWS provider configuration
    aws = {
      # Official AWS provider from HashiCorp
      source = "hashicorp/aws"
      # Use version 5.x (5.0, 5.1, 5.2, etc.) - flexible patch versions
      version = "~> 5.0"
    }
    # Random provider for generating unique values
    random = {
      # Official Random provider from HashiCorp
      source = "hashicorp/random"
      # Use version 3.x
      version = "~> 3.0"
    }
  }
}
