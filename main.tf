#---root/main.tf---

module "ec2-instance" {
  source = "./ec2-instance"
}

terraform {
  backend "s3" {
    bucket = "terraform-remote-state-ruslan-kasymaliev"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}
