########################################################
#---root/variables.tf---
########################################################

variable "region" {
  description = "Choose region for deployment"
  type        = string
  default     = "eu-central-1"
}
variable "default_vpc_id" {
  description = "Default VPC ID"
  type        = string
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
variable "default_user" {
  description = "Default user"
  type        = string
  default     = "ubuntu"
}
variable "default_ami" {
  description = "Default ami"
  type        = string
  default     = "ami-0d527b8c289b4af7f"
}
variable "sg_ingress_rules" {
  description = "List of ports for allow rules"
  type        = list(map(any))
  default     = []
}
variable "instance_params" {
  description = "EC2 instance deployment parameters"
  type        = map(any)
  default     = {}
}
variable "tls_key_filename" {
  description = "Private key name"
  type        = string
}
variable "key_pair_name" {
  description = "Name tag of a key pair"
  type        = string
  default     = "task4_key_pair"
}
variable "os_type" {
  description = "The EC2 instance user and ami_id to be used"
  type        = map
  default     = {}
}
variable "additional_tags" {
  description = "Additional tags"
  type        = map
  default     = {}
}
variable "user_data_template_file" {
  description = "User-Data template file."
  type        = string
  default     = "task4.sh"
}
variable "subnet_template" {
  description = "Template for aws_subnet filter"
  type        = string
}
