variable "env" {
    type = string
    description = ""
}

variable "aws_region" {
    type = string
    default = "sa-east-1"
} 

variable "aws_profile" {
    type = string
    // Removendo o default a variável passa a ser obrigatória
    // Ao rodar terraform plan é cobrada a digitação da variável
    default = "default"
} 

variable "instance_ami" {
    type = string
    default = "ami-0056d4296b1120bc3"

    // Faz validação da tag
    validation {
        condition = length(var.instance_ami) > 4 && substr(var.instance_ami,0,4) == "ami-"
        error_message = "Instance_ami precisa começar com \"ami-\"."
    }
} 
variable "instance_type" {
    type = string
    default = "t2.micro"
} 

variable "instance_tags" {
    type = map(string)
    default = {
        Name = "Terraform"
        Project = "Curso Básico de Terraform"
    }
} 

variable "instance_number" {

    // Tipo objeto, faz mapeamento entre a key e valor
    // A key é passada em linha de comando
    // O formato deve seguir a declaração do objeto e seus alores defaults
    // Utilizado junto com função lookup no locals
    type = object({
        dev = number
        prod = number
    })
  
    default = {
        dev = 1
        prod = 2
    }

    description = "Número de instâncias a serem criadas"

}