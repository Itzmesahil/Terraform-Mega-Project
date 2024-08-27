resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Security group for  allowing inbound traffic on ports 80, 22 and 8000"
  vpc_id      = aws_vpc.project.id

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows traffic from any IP address
  }

  ingress {
    description = "Allow HTTP traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows traffic from any IP address
  }

  ingress {
    description = "Allow traffic on port 8000"
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows traffic from any IP address
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Allows all outbound traffic
  }

  tags = {
    Name = "web-sg"
  }
}
