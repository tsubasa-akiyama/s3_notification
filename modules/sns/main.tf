#snsのトピックを作成する
resource "aws_sns_topic" "s3_notification" {
  name = "${var.env}-s3-notification"
}

#snsのトピックにメールアドレスを購読する
resource "aws_sns_topic_subscription" "email_subscription" {
  count = var.email_address != "" ? 1 : 0

  topic_arn = aws_sns_topic.s3_notification.arn
  protocol  = "email"
  endpoint  = var.email_address
}
