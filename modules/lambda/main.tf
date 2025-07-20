locals {
  handler = "lambda_function.lambda_handler"
  runtime = "python3.11"
  lambda_zip_path = "${path.module}/lambda_function_payload.zip"
}

resource "aws_lambda_function" "s3_sns_lambda" {
  function_name = "${var.env}-s3-sns-lambda"
  role          = var.lambda_role
  handler       = local.handler
  runtime       = local.runtime

  filename         = local.lambda_zip_path
  source_code_hash = filebase64sha256(local.lambda_zip_path)

  environment {
    variables = {
      SNS_TOPIC_ARN = var.sns_topic_arn
    }
  }
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.s3_sns_lambda.function_name}"
  retention_in_days = 14
}