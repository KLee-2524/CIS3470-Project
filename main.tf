# NETWORKING #
resource "aws_vpc" "kali-vpc" {
  cidr_block           = "172.16.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.vm_type}-vpc"
  }
}

resource "aws_internet_gateway" "kali-gateway" {
  vpc_id = aws_vpc.kali-vpc.id
}

resource "aws_subnet" "kali-subnet" {
  vpc_id                  = aws_vpc.kali-vpc.id
  cidr_block              = "172.16.0.0/24"
  availability_zone       = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vm_type}-subnet"
  }
}

# ROUTING #
resource "aws_route_table" "kali-route-table" {
  vpc_id = aws_vpc.kali-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kali-gateway.id
  }
}

resource "aws_route_table_association" "kali-subnet" {
  subnet_id      = aws_subnet.kali-subnet.id
  route_table_id = aws_route_table.kali-route-table.id
}

# SECURITY GROUP #
resource "aws_security_group" "kali-sg" {
  name   = "${var.vm_type}-sg"
  vpc_id = aws_vpc.kali-vpc.id

  ingress {
    from_port  = 22
    to_port    = 22
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port  = 3389
    to_port    = 3389
    protocol   = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Either from 8 + to -1 or from -1 + to -1
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = "172.16.0.0/24"
  }

  egress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "winser22-vm" {
  ami           = var.winser22_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.kali-subnet.id
  
  vpc_security_group_ids = [aws_security_group.kali-sg.id]

  key_name = "terraform-key-pair"

  tags = {
    Name = "WinSer22-VM"
  }
}

resource "aws_instance" "kali-vm" {
  ami           = var.kali_ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.kali-subnet.id
  
  vpc_security_group_ids = [aws_security_group.kali-sg.id]

  key_name = "terraform-key-pair"

  tags = {
    Name = "${var.vm_type}-VM"
  }
}
