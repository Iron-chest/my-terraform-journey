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

