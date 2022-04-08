########################################################
#---sg/outputs.tf---
########################################################

output "sg_id" {
  description = "Prints Security Group ID"
  value       = aws_security_group.my_sg.id
}
