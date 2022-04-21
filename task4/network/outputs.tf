########################################################
#---network/outputs.tf---
########################################################

output "subnet_id" {
  description = "Prints Subnet ID"
  value       = data.aws_subnet.subnet.id
}
