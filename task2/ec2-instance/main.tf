########################################################
#---ec2-instance/main.tf---
########################################################

resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
}
resource "local_file" "cloud_pem" {
  filename        = var.tls_key_filename
  content         = tls_private_key.generated_key.private_key_pem
  file_permission = "0600"
}
resource "aws_key_pair" "deployer" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.generated_key.public_key_openssh
  tags = {
    Name = "My Key Pair"
  }
}
resource "aws_instance" "my_test_webserver" {
  count                  = var.number_of_instances
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name  = "Task2_instance_${count.index + 1}"
    Owner = "${var.Your_First_Name} ${var.Your_Last_Name}"
  }
}
