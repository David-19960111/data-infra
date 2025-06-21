variable "region" {
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
    default = "data-pipeline-bucket-demo-1234"
}

variable "instance_type" {
    default = "t3.micro"
}

variable "ami_id" {
    default = ""
}
