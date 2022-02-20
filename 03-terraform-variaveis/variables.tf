variable "envinroment" {
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