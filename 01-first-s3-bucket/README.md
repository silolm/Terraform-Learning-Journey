# 01 - First S3 Bucket ☁️

This project is the **foundation** of my Terraform journey: creating an AWS S3 bucket using Infrastructure as Code.  
It demonstrates the basics of provider configuration, resource management, variables, and outputs.  

---

## 🎯 Objectives

- Initialize a Terraform project
- Configure the AWS provider
- Create an S3 bucket
- Use variables and outputs
- Understand `.tfvars` usage for sensitive or environment-specific values

---

## 📂 Project Structure

```bash
01-first-s3-bucket/
├── main.tf              # Core resources (S3 bucket)
├── variables.tf         # Input variables
├── outputs.tf           # Outputs after apply
├── terraform.tfvars     # User-specific variable values (excluded from git)
├── terraform.tfvars.example  # Example template for variables
└── versions.tf          # Terraform + provider version constraints
```

---

## ⚙️ Setup Instructions

### 1. Clone the repository
```bash
git clone https://github.com/silolm/Terraform-Learning-Journey.git
cd Terraform-Learning-Journey/01-first-s3-bucket
```

### 2. Configure your variables
Copy the example file and update values:
```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` with your AWS details (region, bucket name, etc.).

### 3. Initialize Terraform
```bash
terraform init
```

### 4. Review the execution plan
```bash
terraform plan
```

### 5. Apply the configuration
```bash
terraform apply
```

### 6. Destroy resources (optional)
```bash
terraform destroy
```

---

## 📖 Example Code Snippet

**main.tf**
```hcl
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
  tags = {
    Environment = "Dev"
    Project     = "Terraform-Learning-Journey"
  }
}
```

---

## 🧠 Learnings

- How to structure a Terraform project
- Basics of provider setup (AWS in this case)
- Declaring variables and outputs
- Managing environment-specific values with `.tfvars`
- Importance of version pinning for reproducibility

---

## 🔮 Next Steps

From here, the next project will expand into **EC2 instances** and security groups, building on top of this foundation.

---
