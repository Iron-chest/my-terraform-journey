resource "aws_vpc" "my_vpc" {
  cidr_block = var.demo_vpc
  tags = {
    Name = "my_demo_vpc"
  }
}