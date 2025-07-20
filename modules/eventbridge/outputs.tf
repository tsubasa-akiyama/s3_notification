output "eventbridge_rule_arn" {
  description = "EventBridgeルールのARN"
  value       = aws_cloudwatch_event_rule.s3_upload_rule.arn
}

output "eventbridge_rule_name" {
  description = "EventBridgeルール名"
  value       = aws_cloudwatch_event_rule.s3_upload_rule.name
}