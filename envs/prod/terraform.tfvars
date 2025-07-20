# 環境
env = "prod" #環境名(prod,stg,dev) 同一環境を複数使用する時に、使用する

# SNSモジュール用
email_address = "example@example.com" #通知を受け取るメールアドレス

# 識別子
common_name = "taro.tanaka" #アップロード用のs3に名前をつける時に使用します。s3の名前がグローバルで一意である必要があるため。一旦、個人の名前を使用する。