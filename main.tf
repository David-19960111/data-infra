module "vpc" {
  source = "./modules/vpc"
  
  region = var.region
  vpc_cidr = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

module "s3" {
  source = "./modules/s3"
  
  bucket_name = var.bucket_name
}

module "ec2" {
  source = "./modules/ec2"
  
  ami_id = var.ami_id
  instance_type = var.instance_type
  subnet_id = module.vpc.subnet_id
  vpc_id = module.vpc.vpc_id
  sg_id = module.vpc.sg_id
}