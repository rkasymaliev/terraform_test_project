########################################################
#---network/main.tf---
########################################################

data "aws_subnets" "default_subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
