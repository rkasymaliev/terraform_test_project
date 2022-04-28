#############################
#--------root/main.tf--------
#############################

locals {
  cluster_name       = "${var.prefix_name}-${var.environment}-${var.cluster_name}"
  service_name       = "${var.prefix_name}-${var.environment}-${var.service_name}"
  family_name        = "${var.prefix_name}-${var.environment}-${var.family_name}"
  launch_config_name = "${var.prefix_name}-${var.environment}-${var.launch_conf_name}"
  asg_name           = "${var.prefix_name}-${var.environment}-${var.asg_name}"
}
data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
data "aws_ami" "amazon_linux_ecs" {
  most_recent = true
  owners      = [var.ami_owner]
  filter {
    name   = "name"
    values = [var.ami_name]
  }
  filter {
    name   = "owner-alias"
    values = [var.ami_owner]
  }
}
data "template_file" "user_data" {
  template = file("scripts/${var.default_user_data_template_file}")

  vars = {
    ecs_cluster_name = local.cluster_name
  }
}
resource "tls_private_key" "generated_key" {
  algorithm = "RSA"
}
resource "local_file" "cloud_pem" {
  filename        = var.tls_key_filename
  content         = tls_private_key.generated_key.private_key_pem
  file_permission = "0600"
}
resource "aws_key_pair" "deployer" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.generated_key.public_key_openssh
  tags = {
    Name = "My Key Pair"
  }
}
module "asg" {
  source                  = "./modules/asg"
  prefix_name             = var.prefix_name
  environment             = var.environment
  launch_config_name      = local.launch_config_name
  asg_name                = local.asg_name
  asg_max_size            = var.asg_max_size
  asg_min_size            = var.asg_min_size
  subnets                 = data.aws_subnets.subnets.ids
  instance_profile        = module.ecs.iam_instance_profile_name
  instance_type           = var.instance_type
  key_pair_name           = var.key_pair_name
  root_vol_size           = var.root_vol_size
  root_vol_type           = var.root_vol_type
  image_id                = data.aws_ami.amazon_linux_ecs.image_id
  user_data_template_file = data.template_file.user_data.rendered
  additional_tags         = var.additional_tags
}
module "ecs" {
  source              = "./modules/ecs"
  cluster_name        = local.cluster_name
  service_name        = local.service_name
  launch_type         = var.launch_type
  family_name         = local.family_name
  additional_tags     = var.additional_tags
  prefix_name         = var.prefix_name
  environment         = var.environment
}
