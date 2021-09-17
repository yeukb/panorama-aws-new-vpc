data "aws_availability_zones" "available" {}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "panorama_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.panorama_subnet
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "panorama_subnet"
  }
}


resource "aws_route_table" "panorama_rt" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "panorama_RT"
  }
}


resource "aws_route_table_association" "panorama_rt_association" {
  subnet_id      = aws_subnet.panorama_subnet.id
  route_table_id = aws_route_table.panorama_rt.id
}


resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}


resource "aws_route" "panorama_rt_default_route" {
  route_table_id         = aws_route_table.panorama_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_igw.id
}
