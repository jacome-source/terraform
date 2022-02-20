locals {

// Lookup retorna o valor do instance number de acordo com o env
instance_number = lookup(var.instance_number, var.env)

file_ext = "zip"
object_name = "arquivo-de-template"

common_tags = {
    Owner = "Jacome"
    ManagedBy = "Terraform"
  }

}