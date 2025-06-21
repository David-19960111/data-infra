resource "aws_s3_bucket" "data_bucket" {
  bucket = var.bucket_name

  tags = {
    Name = "data-bucket"
    Environment = "dev"
  }
}