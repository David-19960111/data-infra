output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.public.id 
}

output "sg_id" {
  value = aws_security_group.sg.id 
}