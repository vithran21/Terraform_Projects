# Create an app server
resource "aws_instance" "app" {
  ami                    = "ami-0e0e417dfa2028266"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.app.id]
  key_name               = "keypair1"
  tags = {
    Name = "app server"
  }
}

resource "aws_security_group" "app" {
  name        = "app-server-sg"
  description = "Security group for the app server"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}