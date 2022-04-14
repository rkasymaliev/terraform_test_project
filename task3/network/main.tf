########################################################
#---network/main.tf---
########################################################

data "aws_subnets" "default_subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id != "" ? var.vpc_id : "vpc-07352abd76d01fd67"]
  }
}
data "aws_subnet" "my_subnet" {
  id = data.aws_subnets.default_subnet.ids[0]
}
