
variable "region" {
  description = "Choose a region to deploy"
  type = string
  default = "eu-central-1"
}
variable "Your_First_Name" {
  description = "Please insert your first name"
  type = string
  default = "Ruslan"
}

variable "Your_Last_Name" {
  description = "Please insert your last name"
  type = string
  default = "Kasymaliev"
}

variable "access_key" {
  description = "Please insert your AWS Access Key"
  default = ""
}

variable "asecret_key" {
  description = "Please insert your AWS Secret Key"
  default = ""
}

variable "tls_key_filename" {
  description = "Please give a name to .pem file"
  type = string
  default = "cloudtls.pem"
}
variable "key_pair_name" {
  description = "Please give a name to key pair"
  type = string
  default = "my_tls_key"
}
variable "instance_type" {
  description = "Enter instance type"
  type = string
  default = "t2.micro"
}
