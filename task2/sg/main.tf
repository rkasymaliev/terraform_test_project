########################################################
#---sg/main.tf---
########################################################

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
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
