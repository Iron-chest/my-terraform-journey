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
  region  = var.aws_region
}
