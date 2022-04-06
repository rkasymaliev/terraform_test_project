#---network/main.tf---

data "aws_vpc" "default_vpc" {
  default = true
}
resource "aws_security_group" "my_sg" {
  vpc_id = data.aws_vpc.default_vpc.id

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
data "aws_subnets" "subnet_az_1" {}

