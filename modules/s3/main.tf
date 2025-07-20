#ファイルアップロード用のs3を作成する。
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.env}-${var.common_name}-s3-upload-bucket"
}

#ファイルアップロード用のs3のバージョニングを設定する。
resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

#ファイルアップロード用のs3を暗号化する。
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_encryption" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#ファイルアップロード用のs3の通知機能を設定する。
resource "aws_s3_bucket_notification" "s3_bucket_notification" {
  bucket      = aws_s3_bucket.s3_bucket.id
  eventbridge = true
}