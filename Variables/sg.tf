resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow HTTP inbound traffic and all outbound traffic"

dynamic "ingress" {
  iterator = port
  for_each = var.ingress_rule
  content {
    from_port = port.value
    to_port = port.value
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

dynamic "egress" {
  iterator = port
  for_each = var.egress_rule
  content {
    from_port = port.value
    to_port = port.value
    protocol =  "TCP" #"-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

  tags = {
    Name = "web-sg"
  }
}

# Dynamic Blocks for sg
variable "ingress_rule" {
  type = list(number)
  default = [80,443,22]
}

variable "egress_rule" {
  type = list(number)
  default = [80] # [0, 0] - to allow all traffic from the outbound rules in AWS, while [80, 80] would give limited access into the internet
}

/*
[0, 0] - to allow all traffic from the outbound rules in AWS
Issue :
How to open all traffic to allow connection with the internet for installing packages

Questions:
1. How do I Allow limited access from my EC2 Instance to the internet instead of using All-traffic
*/








/*
resource "aws_vpc_security_group_ingress_rule" "web-inbound-sg" {
  security_group_id = aws_security_group.tf-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "web-outbound-sg" {
  security_group_id = aws_security_group.tf-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
*/

 
