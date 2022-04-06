#---ec2-instance/main.tf---

data "template_file" "init" {
  template = "${file("get-tag.tpl")}"

  vars = {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region     = "${var.region}"
    output     = "json"
  }
}
#data "aws_availability_zones" "working" {}
data "aws_ami" "latest_Amazon_Linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }
}
data "aws_caller_identity" "current_caller" {}
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
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
}
resource "aws_instance" "my_test_webserver" {
  count         = var.number_of_instances
  ami           = data.aws_ami.latest_Amazon_Linux.id
  instance_type = var.instance_type
  #availability_zone      = data.aws_availability_zones.working.names[0]
  subnet_id              = data.aws_subnets.default_subnet.ids[0]
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  user_data              = data.template_file.init.rendered
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.generated_key.private_key_pem
    host        = self.public_ip
  }
  provisioner "file" {
    source      = "text.txt"
    destination = "~/text.txt"
  }
  provisioner "remote-exec" {
    inline = [
      "cat text.txt",
    ]
  }
  tags = {
    Date_creation   = local.current_time
    OS_type         = data.aws_ami.latest_Amazon_Linux.platform_details
    Your_First_Name = var.Your_First_Name
    Your_Last_Name  = var.Your_Last_Name
    AWS_Account_ID  = data.aws_caller_identity.current_caller.account_id
  }
}
data "aws_vpc" "default_vpc" {
  id = var.vpc_id
}
data "aws_subnets" "default_subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
resource "aws_security_group" "my_sg" {
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["${chomp(data.http.myip.body)}/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

locals {
  current_time = timestamp()
}
