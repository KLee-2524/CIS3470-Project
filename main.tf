# TODO: PARAMETERIZE THE PUBLIC KEY, AMI, 
# us-west-1 Kali Linux AMI: ami-0f36db53af1422a10
# us-west-1 Windows Server 2022 AMI: ami-06fe666da1b90024e

# NETWORKING #
resource "aws_vpc" "cis3470-vpc" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "CIS3470-vpc"
  }
}

resource "aws_internet_gateway" "cis3470-gateway" {
  vpc_id = aws_vpc.cis3470-vpc.id
}

resource "aws_subnet" "cis3470-subnet" {
  vpc_id                  = aws_vpc.cis3470-vpc.id
  cidr_block              = "172.16.0.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "CIS3470-subnet"
  }
}

# ROUTING #
resource "aws_route_table" "cis3470-route-table" {
  vpc_id = aws_vpc.cis3470-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cis3470-gateway.id
  }
}

resource "aws_route_table_association" "cis3470-subnet" {
  subnet_id      = aws_subnet.cis3470-subnet.id
  route_table_id = aws_route_table.cis3470-route-table.id
}

# SECURITY GROUP #
resource "aws_security_group" "cis3470-sg" {
  name   = "CIS3470-sg"
  vpc_id = aws_vpc.cis3470-vpc.id

  ingress {
    from_port  = 3389
    to_port    = 3389
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "cis3740-win-ser-22" {
  ami           = var.winser22_ami.default
  instance_type = var.instance_type.default
  subnet_id     = aws_subnet.cis3470-subnet.id
  
  vpc_security_group_ids = [aws_security_group.cis3470-sg.id]

  key_name = "terraform-key-pair"

  tags = {
    Name = "CIS3470-WinSer22"
  }
}
