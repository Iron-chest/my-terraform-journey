variable "my_region" {
  description = "This is the AWS Region"
  type = string
  default = "us-east-1"
}
/*
variable "my_ami" {
  description = "This is the AWS AMI for ubuntu 22.04"
  type = string
  default = "ami-0a0e5d9c7acc336f1"
}*/


variable "instance_type" {
  description = "This is the Instance type that would be used"
  type = string
  default = "t2.micro"
}

variable "key_name" {
  description = "This is the Key name be used for authentication"
  type = string
  default = "DevOpsForJesus"
}

variable "demo_vpc" {
  description = "This is the VPC where all resources are created"
  type = string
  default = "10.0.0.0/16"
}

/*
# AWS EC2 Instance type list
variable "instance_type_list" {
  description = "EC2 Instance type list"
  type = list(string)
  default = [ "t2.micro", "t2.medium", "t3.small" ]
}

# AWS EC2 Instance type map
variable "instance_type_map" {
  description = "EC2 Instance type map"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "uat" = "t2.medium"
    "prod" = "t2.large"
  }
}
#Ingress = 80, 443, 8080, 22
#Egress = 3306, 25, 53, 6379
*/
