########################################################
#---network/main.tf---
########################################################

data "aws_subnet" "subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
  tags = {
    "Name" = "*${var.subnet_template}*"
  }
}
