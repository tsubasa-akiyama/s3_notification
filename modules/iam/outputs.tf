output "lambda_role_arn" {
  description = "Lambda実行用IAMロールのARN"
  value = aws_iam_role.lambda_role.arn
}

output "lambda_role_name"{
  description = "Lambda実行用IAMロール名"
  value = aws_iam_role.lambda_role.name
}