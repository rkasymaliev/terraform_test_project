########################################################
#---sg/variables.tf---
########################################################

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "some_id"
}
variable "sg_ingress_rules" {
  description = "List of ports for allow rules"
  type        = list(map(any))
  default     = []
}
