// Cria nome de recurso aleatório
// O nome é formador por 5 palavras
// Ex: simple-web-server-snake-random
resource "random_pet" "bucket" {
  length = 5
}

// Descritores do Bucket
// Cria recurso do tipo bucket
resource "aws_s3_bucket" "teste-bucket" {
  // Utilizando interpolação  
  bucket = "${random_pet.bucket.id}-${var.env}"
  // Utilizar Locals
  tags = local.common_tags
}

// Cria objeto dentro do bucket
resource "aws_s3_bucket_object" "this" {

  // Referência ao recurso declarado anterior
  bucket = aws_s3_bucket.teste-bucket.bucket

  // Repositório (dentro do bucket) onde o arquivo será salvo
  // uuid = gera string aleatória
  key = "${uuid()}.${local.file_ext}"

  // Onde o arquivo está localizado no host local
  // Definido na tag data.archive_file.json em data.tf
  source = data.archive_file.json.output_path

  // Identifica se o objeto foi alterado caso o script seja executado de novo
  etag = filemd5(data.archive_file.json.output_path)

  content_type = "application/zip"

  tags = local.common_tags
}