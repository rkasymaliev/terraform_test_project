#---root/outputs.tf---

output "SSH_connection_command" {
  description = "Prints ssh connection command"
  value       = "ssh -i ${var.tls_key_filename} ec2-user@${aws_instance.my_test_webserver.public_ip}"
}
