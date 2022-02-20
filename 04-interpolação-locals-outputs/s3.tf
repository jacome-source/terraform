// Descritores do Bucket
// Cria recurso do tipo bucket
resource "aws_s3_bucket" "teste-terraform-bucket" {
  // Utilizando interpolação  
  bucket = "${random_pet.bucket.id}-${var.envinroment}"
  acl    = "private"

  // Utilizar Locals
  tags = local.common_tags
}

// Cria objeto dentro do bucket
resource "aws_s3_bucket_object" "this" {

  // Referência ao recurso declarado anterior
  bucket = aws_s3_bucket.teste-terraform-bucket.bucket

  // Repositório (dentro do bucket) onde o arquivo será salvo
  key = "config/${local.file_name}"

  // Onde o arquivo está localizado no host local
  // Mesmo diretório do arquivo terraform
  source = local.file_name

  // Identifica se o objeto foi alterado caso o script seja executado de novo
  etag = filemd5(local.file_name)
}