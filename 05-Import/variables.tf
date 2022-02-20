variable "envinroment" {
  type        = string
  description = ""
  default     = "dev"
}

variable "aws_region" {
  type    = string
  default = "sa-east-1"
}

variable "aws_profile" {
  type = string
  // Removendo o default a variável passa a ser obrigatória
  // Ao rodar terraform plan é cobrada a digitação da variável
  default = "default"
}
