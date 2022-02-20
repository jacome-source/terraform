// Descritores gerais
// Bloco core, primeiro a ser executado, não pode ser usado variáveis e interpolação nele
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  // backend vazio para pegar informações do arquivo dev.backend.hcl
  // Passado com o comando terrafomr init -backend="true" -backend-config="dev.backend.hcl"
  backend "s3" {  
    // bucket faz referência ao bucket declarado no diretório 01
    // Não é permitido interpolação na tag terraform
    // bucket = "tfstate-659503142173"
    
    // key    = "dev/terraform.tfstate"
    // region = "sa-east-1"
    // profile = "default"
  }
}

# Configure the AWS Provider
provider "aws" {
  // south-america  
  region = var.aws_region
  profile = var.aws_profile
  // Acess Keys podem ser colocadas aqui, mas não é recomenadao
}
