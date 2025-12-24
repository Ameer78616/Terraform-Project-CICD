# Terraform Backend Setup Instructions

## Prerequisites
1. AWS CLI configured with appropriate credentials
2. Terraform installed

## Steps to Create Backend Infrastructure

### 1. Update the bucket name
Edit `variables.tf` and change `state_bucket_name` to a globally unique name:
```hcl
variable "state_bucket_name" {
  default = "your-unique-terraform-state-bucket-name"
}
```

### 2. Initialize and apply
```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the changes
terraform apply
```

### 3. Note the outputs
After successful deployment, copy the backend configuration from the output.

### 4. Use in your main project
Copy the backend configuration to your main Terraform files:

**For UAT environment:**
```hcl
terraform {
  backend "s3" {
    bucket         = "your-bucket-name"
    key            = "uat/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
```

**For Production environment:**
```hcl
terraform {
  backend "s3" {
    bucket         = "your-bucket-name"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
```

## Important Notes
- Run this setup ONCE before creating your main infrastructure
- The S3 bucket name must be globally unique
- Keep the outputs safe - you'll need them for your main Terraform configurations