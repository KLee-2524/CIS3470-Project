#data "aws_ami" "app_ami" {
#  most_recent = true
#
#  filter {
#    name   = "name"
#    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
#  }
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#
#  owners = ["979382823631"] # Bitnami
#}

resource "aws_vpc" "cis3470-vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "CIS3470-vpc"
  }
}

resource "aws_subnet" "cis3470-subnet" {
  vpc_id            = aws_vpc.cis3470-vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-west-1a"

  tags = {
    Name = "CIS3470-subnet"
  }
}

resource "aws_instance" "cis3740-win-ser-22" {
  ami           = "ami-06fe666da1b90024e"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.cis3470-subnet.id

  tags = {
    Name = "CIS3470-WinSer22"
  }
}
