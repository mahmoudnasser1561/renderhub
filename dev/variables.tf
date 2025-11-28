

variable "aws_region" {
  type        = string
  description = "AWS region to create our resources"
}

variable "tag_env" {
  description = "tag environment for out all resources"
}

variable "datadog_api_key" {
  type        = string
  description = "datadog api key"
}

variable "datadog_application_key" {
  type        = string
  description = "datadog application key"
}

variable "datadog_region" {
  type = string
  description = "datadog region"
}