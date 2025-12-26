variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
    description = "AMI"
    type        = string
    default     = "ami-0b5eea76982371e91"
  }
 variable "aws_vpc" {
  description = "vpcname"
  type        = string
  default     = "Project-vpc"
}

variable "publicsubnet1a" {
  description = "subnetname"
  type = string
  default = "Project-subnet-public1-us-east-1a"
}

variable "instance_name" {
  description = "Name for the EC2 instance"
  type        = string
  default     = "terraform-instance"
}