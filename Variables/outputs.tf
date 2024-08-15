# Terraform Output Values

# EC2 Instance Public IP
output "instance_public_ip" {
  value       = aws_instance.ec2_demo.public_ip
  description = "The public IP address of the EC2 Instance."
}

# EC2 Instance Public DNS
output "instance_public_dns" {
  value       = aws_instance.ec2_demo.public_dns
  description = "The EC2 Instance Public DNS."
}
