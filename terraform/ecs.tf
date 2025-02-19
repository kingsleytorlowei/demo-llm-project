resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.namespace}-cluster"
}

resource "aws_ecs_task_definition" "demo-llm" {
  family                   = "${var.namespace}-task"
  network_mode             = "host"
  requires_compatibilities = ["EC2"]
  memory                   = 1026
  cpu                      = 1026
  execution_role_arn       = aws_iam_role.ecs_agent.arn
  task_role_arn            = aws_iam_role.ecs_agent.arn

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "ARM64"
  }
  container_definitions = file("containerDefinition.json")
}

resource "aws_ecs_service" "demo-llm" {
  name            = "${var.namespace}-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.demo-llm.arn
  desired_count   = 1
  launch_type     = "EC2"

  load_balancer {
    target_group_arn = aws_lb_target_group.demo_llm.arn
    container_name   = "${var.namespace}-worker"
    container_port   = 8000
  }
}