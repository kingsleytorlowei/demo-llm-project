data "aws_ssm_parameter" "openai_api_key" {
  name = "/demollmproject/openai_api_key"
}