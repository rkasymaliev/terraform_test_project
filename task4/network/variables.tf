########################################################
#---network/variables.tf---
########################################################

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "some_id"
}
variable "subnet_template" {
  description = "Template for aws_subnet filter"
  type        = string
  default     = ""
}
