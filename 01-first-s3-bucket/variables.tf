# Project basic configuration
variable "project" {
  # Documentation for this variable
  description = "Project name for resource naming and tagging"
  # Data type - text string
  type = string
  # Default value if not specified
  default = "terraform-learning"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"

  # Validation rule to prevent invalid values
  validation {
    # Check if value is in allowed list
    condition = contains(["development", "staging", "production"], var.environment)
    # Error message if validation fails
    error_message = "Environment must be: development, staging, or production."
  }
}

variable "owner" {
  description = "Resource owner for tagging"
  type        = string
  default     = "terraform-user"
}

variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

# S3 specific configuration
variable "s3_config" {
  description = "S3 bucket configuration options"
  # Complex type: object with specific attributes
  type = object({
    enable_versioning = bool # true/false for versioning
    force_destroy     = bool # true/false for bucket deletion
  })
  # Default values for the object
  default = {
    enable_versioning = false # Don't keep file versions by default
    force_destroy     = true  # Allow bucket deletion even with files
  }
}
