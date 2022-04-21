########################################################
#---ec2_instance/variables.tf---
########################################################

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = ""
}
variable "sg_id" {
  description = "Secury Group ID"
  type        = string
  default     = ""
}
variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = ""
}
variable "Your_First_Name" {
  description = "Enter your first name"
  type        = string
  default     = ""
}
variable "Your_Last_Name" {
  description = "Enter your first name"
  type        = string
  default     = ""
}
variable "key_pair_name" {
  description = "Name tag of a key pair"
  type        = string
  default     = ""
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = ""
}
variable "number_of_instances" {
  description = "Number of deployable instances"
  type        = string
  default     = ""
}
variable "environment" {
  description = "Deployed environment"
  default     = ""
}
variable "user_data_template_file" {
  description = "User-Data template filename"
  type        = string
  default     = ""
}
variable "additional_tags" {
  description = "Additional tags"
  type        = map
  default     = {}
}
variable "volume_size" {
  description = "Root Volume Size"
  type        = number
  default     = 8
}
variable "volume_type" {
  description = "Root Volume Type"
  type        = string
  default     = ""
}
