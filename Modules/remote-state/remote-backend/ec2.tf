resource "aws_instance" "ec2_backend" {
  instance_type = var.my_instance_type
  ami = data.aws_ami.my_ami_ubuntu.id
  tags = {
    "Name" = "ec2_backend"
  }

}