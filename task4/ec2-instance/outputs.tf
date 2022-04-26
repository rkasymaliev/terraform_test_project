########################################################
#---ec2-instance/outputs.tf---
########################################################

output "public_ip" {
  description = "Prints Public IP of created instances"
  value       = aws_instance.my_test_webserver.*.public_ip
}
output "user_id" {
  description = "Transmits username"
  value       = var.user_id
}
