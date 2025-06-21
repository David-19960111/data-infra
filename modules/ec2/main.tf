resource "aws_instance" "data_instance" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [ var.sg_id ]

  tags = {
    Name = "data-ec2"
  }

}
