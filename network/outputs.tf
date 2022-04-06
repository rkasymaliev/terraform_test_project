#---network/outputs.tf---

output "default_vpc" {
  description = "Prints default vpc id"
  value = data.aws_vpc.default_vpc.id
}
output "subnet" {
  description = "Prints subnet id"
  value = data.aws_subnets.subnet_az_1.ids[0]
}
output "sg" {
  description = "Prints created Security Group id"
  value = aws_security_group.my_sg.id
}
