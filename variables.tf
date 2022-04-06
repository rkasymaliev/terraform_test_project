#---root/variables.tf---

variable "region" {
  description = "Choose region for deployment"
  type        = string
  default     = "eu-central-1"
}
variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-07352abd76d01fd67"
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
variable "access_key" {
  description = "Enter your AWS Access Key"
  type        = string
  # default     = ""
}
variable "secret_key" {
  description = "Enter your AWS Secret Access Key"
  type        = string
  # default     = ""
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
  default     = "3"
}
