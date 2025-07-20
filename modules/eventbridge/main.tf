resource "aws_cloudwatch_event_rule" "s3_upload_rule" {
  name        = "${var.env}-s3-upload-rule"
  description = "S3アップロードイベントをキャプチャ"

  event_pattern = jsonencode({
    source        = ["aws.s3"]
    detail-type   = ["Object Created"]
    detail = {
      bucket = {
        name = [var.bucket_name]
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.s3_upload_rule.name
  target_id = "TriggerLambdaFunction"
  arn       = var.lambda_function_arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.s3_upload_rule.arn
}