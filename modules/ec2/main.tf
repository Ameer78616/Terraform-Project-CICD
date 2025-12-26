# Security Group for EC2
resource "aws_security_group" "tf-security_group" {
  name_prefix = "tf-sg"
  vpc_id      = var.aws_vpc

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "TerraformCICD-project" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.publicsubnet1a
  vpc_security_group_ids = [aws_security_group.tf-security_group.id]
  associate_public_ip_address = true
}
