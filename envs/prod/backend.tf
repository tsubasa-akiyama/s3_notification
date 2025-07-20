#terraformのバージョン
terraform {
  required_version = ">= 1.10.0" 

 required_providers {
    aws = {
      source  = "hashicorp/aws" #プロバイダーのバージョン
      version = "5.22.0" #awsのバージョン 
    }  
  }

#tfstateファイルを使用するs3を場所を指定する。
#backend "s3" {
#   bucket         = "exaple-s3" #terraformのstateを保存するs3バケット名 使用者が作成した任意のs3を使用する。
#   key            = "s3-notification/envs/terraform.tfstate" #terraformのstateを保存するディレクトリ名、ファイル名
#   region         = "ap-northeast-1"  # 使用するリージョン
#   encrypt        = true #terraformのstateを暗号化する
# }
}

