terraform {
  backend "s3" {
    bucket = "tfstatebucket-ameer"
    region = "us-east-1"
  }
}
module "vpc" {
    source = "../../modules/vpc"
#    environment = var.environment  
}
  
module "ec2" {
    source = "../../modules/ec2"
}