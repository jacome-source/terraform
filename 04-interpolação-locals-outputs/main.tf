// Descritores gerais
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  // south-america  
  region  = "sa-east-1"
  profile = "default"
  // Acess Keys podem ser colocadas aqui, mas não é recomenadao
}

