variable "env" {
  description = "環境変数"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNSトピックのARN"
  type        = string
}

variable "lambda_role" {
  description = "LambdaロールのARN"
  type        = string
}
