variable "env" {
  description = "環境毎に識別(prod,stg,dev)"
  type        = string
}

variable "email_address" {
  description = "通知を受け取るメールアドレス（オプション）"
  type        = string
  default     = "" #空文字をデフォルトと設定
}

variable "common_name" {
  description = "識別子"
  type        = string
  
}
