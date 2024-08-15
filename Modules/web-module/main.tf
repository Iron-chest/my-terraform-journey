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

# db module
module "db_" {
  source = "./db_"
}

# web module
module "web_" {
  source = "./web_"
}

# db Private Ip
output "private_ip" {
  value = module.db_.private_ip
}

# web Public Ip
output "public_ip" {
  value = module.web_.public_ip
}
