variable "namespace" {
  default     = "demo-llm"
  type        = string
  description = "the namespace of the ECS cluster"
}

variable "region" {
  default     = "us-west-2"
  type        = string
  description = "value of the region"
}