#---root/main.tf---

module "ec2-instance" {
  source = "./ec2-instance"
  Your_First_Name = var.Your_First_Name
  Your_Last_Name = var.Your_Last_Name
  region = var.region
  access_key = var.access_key
  asecret_key = var.asecret_key
  tls_key_filename = var.tls_key_filename
  key_pair_name = var.key_pair_name
  instance_type = var.instance_type
}

terraform {
  backend "s3" {
    bucket = "Your bucket name"
    key = "terraform.tfstate"
    region = "Your bucker region"
  }
}
