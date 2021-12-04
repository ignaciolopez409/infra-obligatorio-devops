###Redes y subredes

###VPC
resource "aws_vpc" "vpc_obligatorio" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Obligatorio-${var.ENV}"
  }
}

### Internet Gateway
resource "aws_internet_gateway" "igw_obligatorio" {
  vpc_id = aws_vpc.vpc_obligatorio.id
  tags = {
    Name = "Obligatorio-${var.ENV}"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}


###Subnets

##Subnet A
resource "aws_subnet" "subnet_a_obligatorio" {
  cidr_block = var.subnet_a_cidr
  vpc_id = aws_vpc.vpc_obligatorio.id
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "Subnet A Obligatorio ${var.ENV}"
  }
}

##Subnet B
resource "aws_subnet" "subnet_b_obligatorio" {
  cidr_block = var.subnet_b_cidr
  vpc_id = aws_vpc.vpc_obligatorio.id
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "Subnet B Obligatorio ${var.ENV}"
  }
}
##Subnet C
resource "aws_subnet" "subnet_c_obligatorio" {
  cidr_block = var.subnet_c_cidr
  vpc_id = aws_vpc.vpc_obligatorio.id
  map_public_ip_on_launch = true
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "Subnet C Obligatorio ${var.ENV}"
  }
}

resource "aws_default_route_table" "route_table_obligatorio" {
  default_route_table_id = aws_vpc.vpc_obligatorio.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_obligatorio.id
  }
  tags = {
    Name = "Default ${var.ENV}"
  }
}

resource "aws_route_table_association" "subnet_a_association" {
  subnet_id = aws_subnet.subnet_a_obligatorio.id
  route_table_id = aws_default_route_table.route_table_obligatorio.id
}

resource "aws_route_table_association" "subnet_b_association" {
  subnet_id = aws_subnet.subnet_b_obligatorio.id
  route_table_id = aws_default_route_table.route_table_obligatorio.id
}

resource "aws_route_table_association" "subnet_c_association" {
  subnet_id = aws_subnet.subnet_c_obligatorio.id
  route_table_id = aws_default_route_table.route_table_obligatorio.id
}

resource "aws_security_group" "kubernetes_obligatorio" {
  name = "kubernetes_obligatorio"
  description = "Security group para subredes kubernetes"
  vpc_id = aws_vpc.vpc_obligatorio.id
  ingress {
    description = "Comunicacion cluster K8s"
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [
      var.subnet_a_cidr,
      var.subnet_b_cidr,
      var.subnet_c_cidr]
  }
  egress {
    description = "Egress rule"
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "K8s Obligatorio ${var.ENV}"
  }
}