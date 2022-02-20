// Cria recurso do tipo instance ec2
resource "aws_instance" "server" {
  // código da instancia da aws
  count = local.instance_number <= 0 ? 0 : local.instance_number

  // Escolhendo opções gratuitas
  ami           = var.instance_ami
  instance_type = var.instance_type

  // Função para fazer merge de 2 tags
  tags = merge (
    local.common_tags,
    {
      Env = var.env
      Name = format("instance %d",count.index+1)
    }
  )
}