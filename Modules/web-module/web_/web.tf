resource "aws_instance" "web" {
  ami           = data.aws_ami.my_ami_ubuntu.id
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = file("./web_/web.sh")
 #security_groups = [aws_security_group.web-sg.name]
  tags = {
    Name = "web_server"
  }
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.web.id
}

module "sg" {
  source = "../sg"
}

