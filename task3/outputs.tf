#---root/outputs.tf---

output "public_ip" {
  description = "Prints EC2-Instance Module deployed Public IP"
  value       = module.ec2-instance.public_ip
}
output "null_resource_output" {
  description = "Print null_recource ID"
  value       = null_resource.remote.*.id
}
output "tls_key_id" {
  description = "Prints EC2-Instance Module generated tls key ID"
  value       = module.ec2-instance.tls_key_id
}
output "tls_filename" {
  description = "Prints EC2-Instance Module generated tls key ID"
  value       = module.ec2-instance.tls_filename
}
output "aws_key_pair" {
  description = "Prints EC2-Instance Module AWS Key Pair ARN"
  value       = module.ec2-instance.aws_key_pair
}
output "sg_rule_id" {
  description = "Prints SG-Module Security Group Rule ID"
  value       = module.sg.sg_rule_id
}
output "sg_id" {
  description = "Prints SG-Module Security Group ID"
  value       = module.sg.sg_id
}
