terraform {
  required_version = "~> 1.9.2"  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.52.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# EC2 Module
module "ec2_module" {
  source = "./ec2"
  ec2_name = "Demo_EC2"
}

# Output Module 
output "name" {
  value = module.ec2_module.instance_id
}

