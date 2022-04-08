########################################################
#---network/outputs.tf---
########################################################

output "subnet_id" {
  description = "Prints Subnet ID"
  value       = data.aws_subnets.default_subnet.ids[0]
}
