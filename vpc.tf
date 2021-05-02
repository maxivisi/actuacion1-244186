resource "aws_vpc" "mv-244186-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "mv-244186-gw" {
  vpc_id = aws_vpc.mv-244186-vpc.id
}

resource "aws_default_route_table" "mv-244186-route" {
  default_route_table_id = aws_vpc.mv-244186-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mv-244186-gw.id
  }

  tags = {
    Name = "Internet"
  }
}

resource "aws_subnet" "mv-244186-subnet" {
  vpc_id     = aws_vpc.mv-244186-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.az-e1a
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet"
  }
}