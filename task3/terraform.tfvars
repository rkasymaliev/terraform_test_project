# Name tag of a key pair
key_pair_name = "my_test_key_pair"

# Private key name
tls_key_filename = "cloudtls.pem"

#Enter VPC ID
vpc_id = "vpc-0dd496bf14f381e59"

#Enter AMI ID
ami_id = "ami-0dcc0ebde7b2e00db"

#Enter your first name
Your_First_Name = "Ruslan"

#Enter your last name
Your_Last_Name = "Kasymaliev"

#Region where to deploy
region = "eu-central-1"

#Type of EC2 instance
instance_type = "t2.micro"

# Number of deplyable instances
number_of_instances = "1"

# SG rule ports - list(map)
sg_ingress_rules = [
  { from = 21, to = 21, proto = "tcp", cidr = "192.168.1.0/24", desc = "ftp" },
  { from = 22, to = 22, proto = "tcp", cidr = "158.181.250.3/32", desc = "ssh" },
  { from = 23, to = 23, proto = "tcp", cidr = "192.168.1.0/24", desc = "telnet" },
  { from = 80, to = 80, proto = "tcp", cidr = "0.0.0.0/0", desc = "http" }
]
