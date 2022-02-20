// Será exibido ao fim do apply
output "bucket_name" {
    value = aws_s3_bucket.teste-terraform-bucket.bucket
}

output "bucket_arn" {
    value = aws_s3_bucket.teste-terraform-bucket.arn
}

output "bucket_domain_name" {
    value = aws_s3_bucket.teste-terraform-bucket.bucket_domain_name
}

output "file_path" {
    value = "${aws_s3_bucket.teste-terraform-bucket.bucket}/${aws_s3_bucket_object.this.key}"
}