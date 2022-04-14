########################################################
#---sg/outputs.tf---
########################################################

output "sg_id" {
  description = "Prints Security Group ID"
  value       = aws_security_group.my_sg.*.id
}
output "sg_rule_id" {
  description = "Prints Security Group Rule ID"
  value = {
    for k, v in aws_security_group_rule.ingress_rules : k => v.id
  }
}
