########################################################
#---ec2-instance/main.tf---
########################################################

resource "aws_instance" "my_test_webserver" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [var.sg_id]
  user_data              = var.user_data_template_file
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
  tags = merge(var.additional_tags, {
    Name        = "Task4 ${var.instance_name} instance"
    Owner       = "${var.Your_First_Name} ${var.Your_Last_Name}"
    Environment = var.environment
    }
  )
}
