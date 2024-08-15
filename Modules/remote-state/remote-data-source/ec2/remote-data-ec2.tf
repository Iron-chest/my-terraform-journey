terraform {
  required_version = "~> 1.9.2"  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.52.0"
    }
  }
}
  # Provider Block
provider "aws" {
    region  = "us-east-1"
    profile = "default"
  }

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "devopsforjesus123-s3-bucket"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

/*
data "terraform_remote_state" "network" {
  backend = "local"
  config = {
      path    = "../remote-data-source/terraform.tfstate"
  }
}
*/

resource "aws_instance" "my-ec2"{
  ami = data.aws_ami.my_ami_ubuntu.id
  instance_type = "t2.micro"
  subnet_id = data.terraform_remote_state.network.outputs.public_subnets[1]

  tags = {
    "Name" = "My_ec2"
  }
}