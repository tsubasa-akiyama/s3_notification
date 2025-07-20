# s3モジュール
module "s3" {
  source = "../../modules/s3"
  env = var.env
  common_name = var.common_name
}
# iamモジュール
module "iam" {
  source = "../../modules/iam"
  env    = var.env
  bucket_arn  = module.s3.bucket_arn
  sns_topic_arn = module.sns.sns_topic_arn
}

# snsモジュール
module "sns" {
  source = "../../modules/sns"
  env    = var.env
  email_address = var.email_address
}

# eventbridgeモジュール
module "eventbridge" {
  source = "../../modules/eventbridge"
  env    = var.env
  bucket_name = module.s3.bucket_name
  bucket_arn  = module.s3.bucket_arn
  lambda_function_arn = module.lambda.lambda_function_arn
  lambda_function_name = module.lambda.lambda_function_name
}

# lambdaモジュール
module "lambda" {
  source = "../../modules/lambda"
  env    =var.env
  sns_topic_arn = module.sns.sns_topic_arn
  lambda_role = module.iam.lambda_role_arn
}