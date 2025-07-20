variable "env" {
  description = "環境変数"
  type        = string
}

variable "email_address" {
  description = "通知を受け取るメールアドレス（オプション）"
  type        = string
  default     = "" #空文字をデフォルトと設定
}
