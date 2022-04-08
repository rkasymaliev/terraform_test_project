#---root/variables.tf---

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
variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0dcc0ebde7b2e00db"
}
variable "Your_First_Name" {
  description = "Enter your first name"
  type        = string
  default     = "Ruslan"
}
variable "Your_Last_Name" {
  description = "Enter your first name"
  type        = string
  default     = "Kasymaliev"
}
variable "access_key" {
  description = "Enter your AWS Access Key"
  type        = string
  default     = "some_access_key"
}
variable "secret_key" {
  description = "Enter your AWS Secret Access Key"
  type        = string
  default     = "some_secret_key"
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
variable "ssh_user" {
  description = "EC2 instance user"
  type        = string
  default     = "ec2-user"
}
