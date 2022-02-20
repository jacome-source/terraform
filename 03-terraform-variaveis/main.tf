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
  region = var.aws_region
  profile = var.aws_profile
  // Acess Keys podem ser colocadas aqui, mas não é recomenadao
}

// Descritores do Bucket
// Cria recurso do tipo instance ec2
resource "aws_instance" "web" {
  // código da instancia da aws
  // Escolhendo opções gratuitas
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = var.instance_tags
}