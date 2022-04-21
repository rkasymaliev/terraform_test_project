########################################################
#---root/variables.tf---
########################################################

variable "region" {
  description = "Choose region for deployment"
  type        = string
  default     = ""
}
variable "default_vpc_id" {
  description = "Default VPC ID"
  type        = string
  default     = ""
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = ""
}
# variable "subnet_id" {
#   description = "Subnet ID"
#   type        = string
#   default     = ""
# }
# variable "sg_id" {
#   description = "Secury Group ID"
#   type        = list(string)
#   default     = []
# }
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
  default     = ""
}
variable "key_pair_name" {
  description = "Name tag of a key pair"
  type        = string
  default     = ""
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
  default     = ""
}
