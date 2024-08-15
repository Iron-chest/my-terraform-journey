resource "aws_instance" "ec2_demo" {
  ami           = data.aws_ami.my_ami_ubuntu.id
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = file("${path.module}/apache-userdata.sh")
  security_groups = [aws_security_group.web-sg.name]
/* 
  instance_type = var.instance_type_list[1]
  instance_type = var.instance_type_map["uat"]
  count = 3

 tags = {
  Name = "prod-${count.index}"
 }
*/

  tags = {
    Name = "Prod_IaC"
  }


}


#Docker file implementation (reduction) for moodle after
#it has worked first
#Registring the SIM in kuda


