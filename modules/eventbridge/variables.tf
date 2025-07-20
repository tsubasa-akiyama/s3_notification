variable "env" {
  description = "環境変数"
  type        = string
}

variable "bucket_arn" {
  description = "S3バケットARN"
  type        = string
}

variable "bucket_name" {
  description = "S3バケット名"
  type        = string
}

variable "lambda_function_arn" {
  description = "Lambda関数のARN"
  type        = string
}

variable "lambda_function_name" {
  description = "Lambda関数名"
  type        = string
}