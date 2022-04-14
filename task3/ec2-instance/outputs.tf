#---ec2-instance/outputs.tf---

output "public_ip" {
  description = "Prints Public IP of created instances"
  value       = aws_instance.my_test_webserver.*.public_ip
}
output "private_key" {
  description = "Prints Generated Private Key"
  value       = tls_private_key.generated_key.private_key_pem
}
output "tls_key_id" {
  description = "Prints generated tls key ID"
  value       = tls_private_key.generated_key.id
}
output "tls_filename" {
  description = "Prints generated tls key ID"
  value       = local_file.cloud_pem.filename
}
output "aws_key_pair" {
  description = "Prints AWS Key Pair ARN"
  value       = aws_key_pair.deployer.arn
}
