output "instance_public_ip" {
  value = module.ec2.public_ip
}

output "s3_bucket" {
  value = module.s3.bucket_name
}