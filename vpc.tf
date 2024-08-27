resource "aws_vpc" "project" {
  cidr_block = "10.0.0.0/16"
}

# Define Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.project.id
}

# Define Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.project.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a" # Specify your desired availability zone
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet"
  }
}

# Associate Public Subnet with Internet Gateway

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
