resource "aws_ecr_repository" "demo_project" {
  name         = "demo-llm-project"
  force_delete = true
}