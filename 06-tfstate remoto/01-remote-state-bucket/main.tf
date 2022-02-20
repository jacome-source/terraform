terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  // south-america  
  region = "sa-east-1"
  profile = "default"
  // Acess Keys podem ser colocadas aqui, mas não é recomenadao
}

// Tag data puxa informações
// Pegando informação da conta
data "aws_caller_identity" "current" {}

// Bucket que irá armazenar o tfstate remoto
resource "aws_s3_bucket" "remote-state" {
  // nome deve ser único no mundo  
  bucket = "tfstate-${data.aws_caller_identity.current.account_id}"

  versioning {
      enabled = true
  }

  tags = {
    Description        = "Guarda arquivo tfstate remoto"
    Environment = "Dev"
    ManagedBy = "Terraform"
    Owner = "Jacome"
  }
}