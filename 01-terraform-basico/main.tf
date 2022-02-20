// Descritores gerais
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

// Descritores do Bucket
// Cria recurso do tipo bucket
resource "aws_s3_bucket" "teste-terraform-bucket" {
  // nome deve ser único no mundo  
  bucket = "teste-terraform-bucket-jacome"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    ManagedBy = "Terraform"
  }
}