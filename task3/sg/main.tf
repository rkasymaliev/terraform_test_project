########################################################
#---sg/main.tf---
########################################################

resource "aws_security_group" "my_sg" {
  #count = length(var.vpc_id) != "" ? 1 : 0
  vpc_id = var.vpc_id != "" ? var.vpc_id : "vpc-07352abd76d01fd67"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Test SG"
  }
}
resource "aws_security_group_rule" "ingress_rules" {
  for_each          = { for rule in var.sg_ingress_rules : rule.desc => rule }
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.my_sg.id
}
