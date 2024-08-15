resource "aws_instance" "ec2" {
  ami = data.aws_ami.my_ami_ubuntu.id
  instance_type = var.instance_type
  tags = {
    Name = "db_server"
  }
}

