// Cria nome de recurso aleatório
// O nome é formador por 5 palavras
// Ex: simple-web-server-snake-random
resource "random_pet" "bucket" {
  length = 5
}