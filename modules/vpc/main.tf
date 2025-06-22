resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "data-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = true 
  availability_zone = "${var.region}a"
  tags = {
    Name = "data-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "data-igw"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id 

  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "data-rt"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id = aws_subnet.public.id 
  route_table_id = aws_route_table.rt.id 
}

resource "aws_security_group" "sg" {
  name = "data-sg"
  vpc_id = aws_vpc.main.id 

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    Name = "data-sg"
  }
}