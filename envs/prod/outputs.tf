output "bucket_name" {
  description = "作成されたS3バケット名"
  value       = module.s3.bucket_name
}

output "bucket_arn" {
  description = "S3バケットのARN"
  value       = module.s3.bucket_arn
}
