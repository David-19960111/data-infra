variable "region" {
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
    default = "data-pipeline-bucket-demo-1234"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "ami_id" {
    default = "ami-09e6f87a47903347c"
}

variable "aws_access_key" {
  sensitive = true
}

variable "aws_secret_key" {
  sensitive = true
}