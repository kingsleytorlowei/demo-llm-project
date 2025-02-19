resource "aws_instance" "ec2_instance" {
  associate_public_ip_address = true
  ami                         = "ami-0ce02c6a717420418"
  subnet_id                   = aws_subnet.pub_subnet.*.id[0]
  instance_type               = "t4g.small"
  iam_instance_profile        = aws_iam_instance_profile.ecs_agent.name
  vpc_security_group_ids      = [aws_security_group.ecs_sg.id, aws_security_group.bastion_sg.id]
  key_name                    = "${var.namespace}-keypair"
  ebs_optimized               = "false"
  source_dest_check           = "true"
  user_data                   = file("${path.module}/user_data.sh")

  root_block_device {
    volume_size           = 30
    volume_type           = "standard"
    delete_on_termination = true
  }
  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "${var.namespace}-ec2-instance"
  }

  lifecycle {
    ignore_changes = [ami, user_data, subnet_id, key_name, ebs_optimized, instance_type]
  }

}