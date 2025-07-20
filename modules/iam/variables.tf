variable "env" {
  description = "環境変数"
  type        = string
}

variable "bucket_arn" {
  description = "S3バケットのARN"
  type        = string
}

variable "sns_topic_arn" {
  description = "SNSのARN"
  type        = string  
}