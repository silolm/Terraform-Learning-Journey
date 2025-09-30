# Output values to display after deployment
output "bucket_name" {
  description = "Name of the created S3 bucket"
  # Reference the bucket attribute from our S3 resource
  value = aws_s3_bucket.first_bucket.bucket
}

output "bucket_arn" {
  description = "ARN (Amazon Resource Name) of the created S3 bucket"
  value       = aws_s3_bucket.first_bucket.arn
}

output "bucket_region" {
  description = "AWS region where bucket was created"
  value       = aws_s3_bucket.first_bucket.region
}

output "console_url" {
  description = "URL to access bucket in AWS Management Console"
  # String interpolation: inserts bucket name into URL
  value = "https://s3.console.aws.amazon.com/s3/buckets/${aws_s3_bucket.first_bucket.bucket}"
}

output "deployment_summary" {
  description = "Complete deployment information"
  # Output a structured object with multiple values
  value = {
    project     = var.project                       # From our variables
    environment = var.environment                   # From our variables
    bucket_name = aws_s3_bucket.first_bucket.bucket # From the resource
    bucket_arn  = aws_s3_bucket.first_bucket.arn    # From the resource
    region      = var.aws_region                    # From our variables
    # Built-in function: formats current timestamp
    timestamp = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
  }
}
