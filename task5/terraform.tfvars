# AWS Region to deploy
aws_region   = "eu-central-1"

# AMi owner
ami_owner = "amazon"

# AMI Name
ami_name = "amzn-ami-*-amazon-ecs-optimized"

# Instance type
instance_type = "t2.micro"

# Environment name variable
environment  = "dev"

# Prefix for tags definition
prefix_name  = "task5"

# Key Pair Name
key_pair_name = "my_test_key_pair"

# Private key name
tls_key_filename = "cloudtls.pem"

# VPC ID
vpc_id = "vpc-0dd496bf14f381e59"

# ECS cluster name
cluster_name = "task5EcsCluster"

# ECS service name
service_name = "centos"

# ECS Task Definition Family Name
family_name  = "ecsService"

# Launch configuration name
launch_conf_name = "lconf"

# ECS service launch type
launch_type = "EC2"

# Auto-scaling group name
asg_name = "asg"

# Additional tags
additional_tags = {
  Organization   = "WKL"
  Platform       = "ECS"
  Owner          = "Ruslan Kasymaliev"
  Manager        = "Dmitriy Kravets"
}
