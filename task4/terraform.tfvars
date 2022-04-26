# Name tag of a key pair
key_pair_name = "my_test_key_pair"

# Private key name
tls_key_filename = "cloudtls.pem"

#Default VPC ID
default_vpc_id = "vpc-0dd496bf14f381e59"

#Desired vpc
vpc_id = "vpc-07352abd76d01fd67"

#Region where to deploy
region = "eu-central-1"

#aws_subnet filter template
subnet_template = "public"

#OS type ami_id and user
os_type = {
  amazon = {
    user   = "ec2-user",
    ami_id = "ami-0dcc0ebde7b2e00db"
  },
  ubuntu = {
    user   = "ubuntu",
    ami_id = "ami-0d527b8c289b4af7f"
  }
}
# EC2-Instance parameters
instance_params = {
  dev1 = {
    os_type             = "ubuntu"
    instance_type       = "t2.micro",
    volume_size         = 8,
    volume_type         = "gp3",
    Your_First_Name     = "Ruslan-dev",
    Your_Last_Name      = "Kasymaliev-dev"
    env                 = "dev"
  },
  dev2 = {
    os_type             = "ubuntu"
    instance_type       = "t2.micro",
    volume_size         = 8,
    volume_type         = "gp3",
    Your_First_Name     = "Ruslan-dev",
    Your_Last_Name      = "Kasymaliev-dev"
    env                 = "dev"
  },
  prod1 = {
    os_type             = "amazon"
    instance_type       = "t2.micro",
    volume_size         = 10,
    volume_type         = "gp3",
    Your_First_Name     = "Ruslan",
    Your_Last_Name      = "Kasymaliev"
    env                 = "prod"
  },
  prod2 = {
    os_type             = "amazon"
    instance_type       = "t2.micro",
    volume_size         = 10,
    volume_type         = "gp3",
    Your_First_Name     = "Ruslan",
    Your_Last_Name      = "Kasymaliev"
    env                 = "prod"
  },
  prod3 = {
    os_type             = "amazon"
    instance_type       = "t2.micro",
    volume_size         = 10,
    volume_type         = "gp3",
    Your_First_Name     = "Ruslan",
    Your_Last_Name      = "Kasymaliev"
    env                 = "prod"
  }
}
# SG rule ports - list(map)
sg_ingress_rules = [
  {
    from  = 21,
    to    = 21,
    proto = "tcp",
    cidr  = "192.168.1.0/24",
    desc  = "ftp"
  },
  {
    from  = 22,
    to    = 22,
    proto = "tcp",
    cidr  = "158.181.250.3/32",
    desc  = "ssh"
  },
  {
    from  = 23,
    to    = 23,
    proto = "tcp",
    cidr  = "192.168.1.0/24",
    desc  = "telnet"
  },
  {
    from  = 80,
    to    = 80,
    proto = "tcp",
    cidr  = "0.0.0.0/0",
    desc  = "http"
  }
]

#Additional tags
additional_tags = {
  Organization = "WKL"
  Manager      = "Dmitriy Kravets"
}
