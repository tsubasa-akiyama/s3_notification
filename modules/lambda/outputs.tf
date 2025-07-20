output "lambda_function_arn" {
  description = "Lambda関数のARN"
  value       = aws_lambda_function.s3_sns_lambda.arn
}

output "lambda_function_name" {
  description = "Lambda関数名"
  value       = aws_lambda_function.s3_sns_lambda.function_name
}