########################################################
#---root/outputs.tf---
########################################################

output "public_ip" {
  description = "Prints EC2-Instance Module deployed Public IP"
  value       = { for p in sort(keys(var.instance_params)) : p => module.ec2-instance[p].public_ip }
}
output "null_resource_output" {
  description = "Print null_recource ID"
  value       = null_resource.remote
}
output "sg_rule_id" {
  description = "Prints SG-Module Security Group Rule ID"
  value       = module.sg.*.sg_rule_id
}
output "sg_id" {
  description = "Prints SG-Module Security Group ID"
  value       = module.sg.*.sg_id[0]
}
