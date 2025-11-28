

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "4.1.0"

  content_based_deduplication = true
  fifo_queue                  = true
  visibility_timeout_seconds  = 360
  name                        = "${var.tag_env}-conversion-to-pdf-"
  use_name_prefix             = true

  create = true
}

# saving created sqs arn into ssm
resource "aws_ssm_parameter" "sqs_arn" {
  name        = "/${var.tag_env}/sqs/arn"
  description = "The ARN the created Amazon SQS queue"
  type        = "SecureString"
  value       = module.sqs.queue_arn
}

# saving created sqs name into ssm
resource "aws_ssm_parameter" "sqs_name" {
  name        = "/${var.tag_env}/sqs/name"
  description = "The Name the created Amazon SQS queue"
  type        = "SecureString"
  value       = module.sqs.queue_name
}