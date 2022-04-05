#---root/outputs.tf---

output "SSH_connection_command" {
  description = "Prints ssh connection command to deployed Instance"
  value       = "ssh -i ${module.ec2-instance.key_filename} ec2-user@${module.ec2-instance.public_ip}"
}
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
