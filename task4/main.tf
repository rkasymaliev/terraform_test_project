########################################################
#---root/main.tf---
########################################################

locals {
  ami_id   = lookup(var.os_type.amazon, "ami_id")
  username = lookup(var.os_type.amazon, "user")
}
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
module "ec2-instance" {
  source                  = "./ec2-instance"
  for_each                = var.instance_params
  Your_First_Name         = each.value.Your_First_Name
  Your_Last_Name          = each.value.Your_Last_Name
  key_pair_name           = var.key_pair_name
  instance_type           = each.value.instance_type
  ami_id                  = local.ami_id
  number_of_instances     = each.value.number_of_instances
  subnet_id               = module.network.subnet_id
  sg_id                   = module.sg.sg_id
  environment             = each.key
  user_data_template_file = file("scripts/${var.user_data_template_file}")
  additional_tags         = var.additional_tags
  volume_size             = each.value.volume_size
  volume_type             = each.value.volume_type
}
module "network" {
  source          = "./network"
  vpc_id          = var.vpc_id != "" ? var.vpc_id : var.default_vpc_id
  subnet_template = var.subnet_template
}
module "sg" {
  source           = "./sg"
  vpc_id           = var.vpc_id != "" ? var.vpc_id : var.default_vpc_id
  sg_ingress_rules = var.sg_ingress_rules
}
resource "null_resource" "remote" {
  for_each = module.ec2-instance
  connection {
    type        = "ssh"
    user        = local.username
    private_key = tls_private_key.generated_key.private_key_pem
    host        = each.value.public_ip[0]
  }
  provisioner "remote-exec" {
    inline = [
      "while [ ! -f /tmp/result.txt ]",
      "do",
      "sleep 5",
      "done",
      "cat /tmp/result.txt",
    ]
  }
}
terraform {
  backend "s3" {
    bucket = "terraform-remote-state-ruslan-kasymaliev"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
