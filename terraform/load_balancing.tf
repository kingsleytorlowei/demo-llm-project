resource "aws_lb" "demo_llm_lb" {
  name               = "${var.namespace}-lb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = aws_subnet.pub_subnet[*].id

  tags = {
    Name = "demo-llm-lb"
  }
}

resource "aws_lb_target_group" "demo_llm" {
  name     = "${var.namespace}-tg"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id

  health_check {
    path                = "/api/v1/health"
    enabled             = true
    matcher             = "200-499"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 300
  }
}