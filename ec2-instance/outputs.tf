#---ec2-instance/outputs.tf---

# output "SSH_connection_command" {
#   description = "Prints ssh connection command to deployed Instance"
#   value       = "ssh -i ${var.tls_key_filename} ec2-user@${aws_instance.my_test_webserver.*.public_ip}"
# }
output "public_ip" {
  description = "Prints Public IP of created instances"
  value       = aws_instance.my_test_webserver.*.public_ip
}
output "private_ip" {
  description = "Prints Private IP of created instances"
  value       = aws_instance.my_test_webserver.*.private_ip
}
output "instance_id" {
  description = "Prints instance id of created instances"
  value       = aws_instance.my_test_webserver.*.id
}
output "key_filename" {
  description = "Prints generated private key filename"
  value       = var.tls_key_filename
}
