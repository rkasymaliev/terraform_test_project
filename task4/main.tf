########################################################
#---root/main.tf---
########################################################

resource "tls_private_key" "generated_key" {
  count     = length(var.instance_params) > 0 ? 1:0
  algorithm = "RSA"
}
resource "local_file" "cloud_pem" {
  count           = length(var.instance_params) > 0 ? 1:0
  filename        = var.tls_key_filename
  content         = tls_private_key.generated_key[count.index].private_key_pem
  file_permission = "0600"
}
resource "aws_key_pair" "deployer" {
  count      = length(var.instance_params) > 0 ? 1:0
  key_name   = var.key_pair_name
  public_key = tls_private_key.generated_key[count.index].public_key_openssh
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
  ami_id                  = lookup(lookup(var.os_type, each.value.os_type), "ami_id")
  user_id                 = lookup(lookup(var.os_type, each.value.os_type), "user")
  subnet_id               = module.network.subnet_id
  sg_id                   = module.sg.*.sg_id[0]
  environment             = each.value.env
  instance_name           = each.key
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
  count            = length(var.instance_params) > 0 ? 1:0
  source           = "./sg"
  vpc_id           = var.vpc_id != "" ? var.vpc_id : var.default_vpc_id
  sg_ingress_rules = var.sg_ingress_rules
}

resource "null_resource" "remote" {
  for_each = module.ec2-instance
  connection {
    type        = "ssh"
    user        = each.value.user_id
    private_key = tls_private_key.generated_key[0].private_key_pem
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
