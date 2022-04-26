########################################################
#---ec2_instance/variables.tf---
########################################################

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}
variable "sg_id" {
  description = "Secury Group ID"
  type        = string
}
variable "ami_id" {
  description = "AMI ID"
  type        = string
}
variable "Your_First_Name" {
  description = "Enter your first name"
  type        = string
}
variable "Your_Last_Name" {
  description = "Enter your first name"
  type        = string
}
variable "key_pair_name" {
  description = "Name tag of a key pair"
  type        = string
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}
variable "environment" {
  description = "Deployed environment"
  type        = string
}
variable "instance_name" {
  description = "Deployed instance name"
  type        = string
}
variable "user_data_template_file" {
  description = "User-Data template filename"
  type        = string
}
variable "additional_tags" {
  description = "Additional tags"
  type        = map
  default     = {}
}
variable "volume_size" {
  description = "Root Volume Size"
  type        = number
}
variable "volume_type" {
  description = "Root Volume Type"
  type        = string
}
variable "user_id" {
  description = "Username"
  type    = string
}
