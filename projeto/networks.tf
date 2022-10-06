resource "aws_vpc" "Terraform-VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Terraform-VPC"
  }
}

resource "aws_subnet" "terraform-sub1" {
  vpc_id            = aws_vpc.Terraform-VPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public-Subnet-1a"
  }
}

resource "aws_subnet" "terraform-sub2" {
  vpc_id            = aws_vpc.Terraform-VPC.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private-Subnet-1a"
  }
}

resource "aws_internet_gateway" "terraform-vpc-igw" {
  vpc_id = aws_vpc.Terraform-VPC.id

  tags = {
    Name = "Terraform-VPC-IGW"
  }
}

resource "aws_internet_gateway_attachment" "vpc-igw-attach-terraform" {
  internet_gateway_id = aws_internet_gateway.terraform-vpc-igw.id
  vpc_id              = aws_vpc.Terraform-VPC.id
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.Terraform-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-vpc-igw.id
  }
  tags = {
    Name = "public-rt"
  }
}

output "vpc-id" {
  value = aws_vpc.Terraform-VPC.id
}

output "vpc-arn" {
  value = aws_vpc.Terraform-VPC.id
}

output "subnet-name1" {
  value = aws_subnet.terraform-sub1.tags_all
}

output "subnet-name2" {
  value = aws_subnet.terraform-sub2.tags_all
}

output "avai-zone1" {
  value = aws_subnet.terraform-sub1.availability_zone
}

output "vai-zone2" {
  value = aws_subnet.terraform-sub2.availability_zone
}

output "sub1_range" {
  value = aws_subnet.terraform-sub1.cidr_block
}

output "sub2_range" {
  value = aws_subnet.terraform-sub2.cidr_block
}

