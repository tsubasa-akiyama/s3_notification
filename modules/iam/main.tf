#iamモジュール内で使用する変数
locals {
  role_name = "lambda-s3-notification"
}

#lambdaにIAMロールを付与する。
resource "aws_iam_role_policy_attachment" "lambda_role_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

#lambdaのロールを作成する
resource "aws_iam_role" "lambda_role" {
  name = "${var.env}-${local.role_name}-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

#lambdaのポリシーを作成する
resource "aws_iam_policy" "lambda_policy" {
 name = "${var.env}-${local.role_name}-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "AllowCloudWatchLogs",
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*"
      },
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:GetObjectVeresion"
        ]
        Resource = "${var.bucket_arn}/*"
      },
      {
        Sid = "AllowSNSPublish",
        Effect = "Allow",
        Action = ["sns:Publish"],
        Resource = "${var.sns_topic_arn}"
      }
    ]
  })
}