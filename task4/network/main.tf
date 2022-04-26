########################################################
#---network/main.tf---
########################################################

data "aws_subnet" "subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  filter {
    name   = "availabilityZone"
    values = ["eu-central-1c"]
  }
  tags = {
    "Name" = "*${var.subnet_template}*"
  }
}
