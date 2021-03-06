########################################################
#---root/main.tf---
########################################################

module "ec2-instance" {
  source              = "./ec2-instance"
  Your_First_Name     = var.Your_First_Name
  Your_Last_Name      = var.Your_Last_Name
  region              = var.region
  tls_key_filename    = var.tls_key_filename
  key_pair_name       = var.key_pair_name
  instance_type       = var.instance_type
  ami_id              = var.ami_id
  number_of_instances = var.number_of_instances
  ssh_user            = var.ssh_user
  subnet_id           = module.network.subnet_id
  sg_id               = module.sg.sg_id
}
module "network" {
  source = "./network"
  vpc_id = var.vpc_id
}
module "sg" {
  source = "./sg"
  vpc_id = var.vpc_id
}
terraform {
  backend "s3" {
    bucket = "terraform-remote-state-ruslan-kasymaliev"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
