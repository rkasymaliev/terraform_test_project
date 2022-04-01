#---root/outputs.tf---

output "SSH_connection_command" {
  value = "ssh -i ${module.ec2-instance.key_filename} ec2-user@${module.ec2-instance.public_ip}"
}
output "Instance_ID" {
  value = module.ec2-instance.instance_id
}
output "public_ip" {
  value = module.ec2-instance.public_ip
}
output "private_ip" {
  value = module.ec2-instance.private_ip
}
