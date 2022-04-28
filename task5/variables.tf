#############################
#------root/variables.tf-----
#############################

variable "aws_region" {
  description = "The AWS Region to use for."
  type        = string
  default     = "us-east-1"
}
variable "prefix_name" {
  description = "The prefix name to use in configuration."
  type        = string
  default     = ""
}
variable "environment" {
  description = "The environment name to use in configuration."
  type        = string
  default     = "test"
}
variable "instance_type" {
  description = "The EC2 instance type to use."
  type        = string
  default     = "t2.micro"
}
variable "key_pair_name" {
  description = "The public KeyPair name."
  type        = string
  default     = "MyDefaultKeyPairName"
}
variable "tls_key_filename" {
  description = "Private key name"
  type        = string
  default     = "default_tls.pem"
}
variable "root_vol_size" {
  description = "The root block device size in Gb."
  type        = number
  default     = 30
}
variable "root_vol_type" {
  description = "The root block device type."
  type        = string
  default     = "gp3"
}
variable "asg_max_size" {
  description = "The maximum size of the Auto Scaling Group."
  type        = number
  default     = 2
}
variable "asg_min_size" {
  description = "The minimum size of the Auto Scaling Group."
  type        = number
  default     = 1
}
variable "vpc_id" {
  description = "A VPC ID."
  type        = string
  default     = ""
}
variable "ami_owner" {
  description = "AMI owner name"
  type        = string
}
variable "ami_name" {
  description = "AMI Name"
  type        = string
}
variable "cluster_name" {
  description = "Name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
  type        = string
}
variable "default_user_data_template_file" {
  description = "Default user-data file."
  type        = string
  default     = "default_user-data.sh"
}
variable "user_data" {
  description = "Main user-data."
  type        = string
  default     = ""
}
variable "service_name" {
  description = "The ECS service name."
  type        = string
}
variable "family_name" {
  description = "The ECS task definition unique name."
  type        = string
}
variable "additional_tags" {
  description = "Common Tags to be merged with main tags."
  type        = map(string)
  default     = {}
}
variable "launch_conf_name" {
  description = "The Launch Configuration name."
  type        = string
}
variable "asg_name" {
  description = "The Auto-Scaling Group name."
  type        = string
}
variable "launch_type" {
  description = "The ECS service launch type."
  type        = string
}
