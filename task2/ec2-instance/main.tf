#---ec2-instance/main.tf---

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
data "aws_subnets" "default_subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
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
resource "aws_instance" "my_test_webserver" {
  count                  = var.number_of_instances
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = data.aws_subnets.default_subnet.ids[0]
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name  = "Task2_instance_${count.index + 1}"
    Owner = "${var.Your_First_Name} ${var.Your_Last_Name}"
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
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow SSH from My IP"
  }
}
