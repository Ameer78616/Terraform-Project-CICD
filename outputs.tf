output "s3_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "backend_config" {
  description = "Backend configuration to use in your main Terraform files"
  value = <<EOF
terraform {
  backend "s3" {
    bucket         = "${aws_s3_bucket.terraform_state.bucket}"
    key            = "path/to/your/terraform.tfstate"
    region         = "${var.aws_region}"
    encrypt        = true
  }
}
EOF
}