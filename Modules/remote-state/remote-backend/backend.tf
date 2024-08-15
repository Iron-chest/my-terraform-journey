terraform {
  required_version = "~> 1.9.2"  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.52.0"
    }
  }

# S3 Backend for storing terraform state file
  backend "s3" {
    bucket = "devopsforjesus123-s3-bucket"
    key = "terraform/terraform.tfstate"
    dynamodb_table = "terraform-lock"
    region = "us-east-1"

 }
 
}

/*
# AWS S3 bucket
resource "aws_s3_bucket" "devopsforjesus123-s3-bucket" {
  bucket = "devopsforjesus123-s3-bucket"

  tags = {
    Name        = "devopsforjesus123-s3-bucket"
    Environment = "Dev"
  }
}

# No longer needed when creating an s3 Bucket

# AWS S3 bucket acl
resource "aws_s3_bucket_acl" "demo_acl" {
  bucket = aws_s3_bucket.devopsforjesus123-s3-bucket.id
  acl    = "private"
}


# AWS S3 Bucket Versioning
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.devopsforjesus123-s3-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
*/

# Dynamodb table 
resource "aws_dynamodb_table" "tf_lock" {
  name = "terraform-lock"
  hash_key = "LockID"
  read_capacity = 3
  write_capacity = 3

  attribute {
     name = "LockID"
     type = "S"
   }

  tags = {
    Name = "Terraform Lock Table"
   }

   lifecycle {
   prevent_destroy = false
  }

 }


 # Provider Block
provider "aws" {
   region  = "us-east-1"
   profile = "default"
 }