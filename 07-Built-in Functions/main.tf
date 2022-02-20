// Descritores gerais
// Bloco core, primeiro a ser executado, não pode ser usado variáveis e interpolação nele
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
  region = var.aws_region
  profile = var.aws_profile
  // Acess Keys podem ser colocadas aqui, mas não é recomenadao
}
