terraform {
  backend "s3" {
    bucket = "tfstatebucket-ameer"
    key    = "uat/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
data "aws_vpc" "existing" {
    id = "vpc-0eeded68613d62af7"
}

# Get all subnets in the VPC
data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }
}

# Get public subnets (assuming they have "public" in name or specific tag)
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }
  filter {
    name   = "tag:Type"
    values = ["public"]  # Or use subnet names with "public"
  }
}

# Get private subnets
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }
  filter {
    name   = "tag:Type"
    values = ["private"]
  }
}