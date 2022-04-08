#---ec2-instance/outputs.tf---

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
