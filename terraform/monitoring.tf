resource "aws_cloudwatch_log_group" "demo_llm_logs" {
  name              = "demo-llm/api"
  retention_in_days = 7
}