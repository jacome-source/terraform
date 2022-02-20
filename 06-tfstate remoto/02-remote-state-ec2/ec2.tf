
// Descritores do Bucket
// Cria recurso do tipo instance ec2
resource "aws_instance" "web" {
  // código da instancia da aws
  // Escolhendo opções gratuitas
  ami           = var.instance_ami
  instance_type = var.instance_type

  tags = {
      Name = "Remote State"
  }
}