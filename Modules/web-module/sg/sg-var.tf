# Dynamic Blocks for sg
variable "ingress_rule" {
  type = list(number)
  default = [80,443]
}

variable "egress_rule" {
  type = list(number)
  default = [80] # [0, 0] - to allow all traffic from the outbound rules in AWS, while [80, 80] would give limited access into the internet
}