output "sns_topic_arn" {
  description = "SNSトピックARN"
  value = aws_sns_topic.s3_notification.arn
}

output "sns_topic_name" {
  description = "SNSトピック名"
  value       = aws_sns_topic.s3_notification.name
}