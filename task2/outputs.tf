#---root/outputs.tf---

output "Instance_ID" {
  description = "Prints deployed Instance ID"
  value       = module.ec2-instance.instance_id
}
output "public_ip" {
  description = "Prints deployed Instance Public IP"
  value       = module.ec2-instance.public_ip
}
output "private_ip" {
  description = "Prints deployed Instance Private IP"
  value       = module.ec2-instance.private_ip
}
