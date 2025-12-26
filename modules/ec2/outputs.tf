output "instance_id" {
  value = aws_instance.TerraformCICD-project.id
}

output "public_ip" {
  value = aws_instance.TerraformCICD-project.public_ip
}

output "security_group_id" {
  value = aws_instance.TerraformCICD-project.vpc_security_group_ids
}
