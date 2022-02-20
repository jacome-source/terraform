// Template é um recursos que substitui valores dentro de um arquivo
// Útil no tratamento de strings grandes ou complexas
data "template_file" "json" {

    // Arquivo que terá valores substituidos
    template = file("template.json.tpl")

    // Valores que irão para o arquivo
    // Utiliza interpolação normal para substituição
    vars = {
        age = 32
        eye = "castanho"
        name = "Diego"
        gender = "Masculino"
    }
    
}

// Converte um arquivo para um tipo específico
data "archive_file" "json" {

    // Arquivo do tipo zip
    type = local.file_ext
    // Onde o arquivo zipado será salvo no host local
    // path.module : caminho do diretório
    output_path = "${path.module}/files/${local.object_name}.${local.file_ext}"

    // Pega o conteúdo do template e gera arquivo zipado
    source {
        // Renderiza o conteúdo do arquivo json    
        content = data.template_file.json.rendered
        // Arquivo json
        filename = "${local.object_name}.json"
    }
}