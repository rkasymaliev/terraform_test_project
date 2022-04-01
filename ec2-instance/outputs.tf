#---ec2-instance/outputs.tf---

output "public_ip" {
  value = aws_instance.my_test_webserver.public_ip
}
output "private_ip" {
  value = aws_instance.my_test_webserver.private_ip
}
output "instance_id" {
  value = aws_instance.my_test_webserver.id
}
output "key_filename" {
  value = var.tls_key_filename
}
