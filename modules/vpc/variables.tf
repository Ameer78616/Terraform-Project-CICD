# Variables Practice - Modify these values
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default = {
    Project     = "terraform"
  }
}
# Variables Practice - Modify these value
variable "vpc_name" {
  description = "vpcname"
  type        = string
  default     = "Project-vpc"
}
