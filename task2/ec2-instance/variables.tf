########################################################
#---ec2_instance/variables.tf---
########################################################

variable "region" {
  description = "Choose region for deployment"
  type        = string
  default     = "eu-central-1"
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-0dd496bf14f381e59"
}
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
  default     = "ami-0dcc0ebde7b2e00db"
}
variable "Your_First_Name" {
  description = "Enter your first name"
  type        = string
  default     = "first_name"
}
variable "Your_Last_Name" {
  description = "Enter your first name"
  type        = string
  default     = "last_name"
}
variable "tls_key_filename" {
  description = "Private key name"
  type        = string
  default     = "cloudtls.pem"
}
variable "key_pair_name" {
  description = "Name tag of a key pair"
  type        = string
  default     = "my_test_key_pair"
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
variable "number_of_instances" {
  description = "Number of deployable instances"
  type        = string
  default     = "1"
}
variable "ssh_user" {
  description = "EC2 instance user"
  default     = "ec2-user"
}
