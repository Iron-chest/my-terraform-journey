variable "kubernetes_version" {
  default     = 1.29
  description = "kubernetes version"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  default = "us-east-1"
  description = "aws region"
}

variable "key_pair" {
  default = "DevOpsForJesus"
  description = "My key pair to access"
}

variable "instance_types" {
  default = "t3.medium"
  description = "Instance type for the eks node"
}