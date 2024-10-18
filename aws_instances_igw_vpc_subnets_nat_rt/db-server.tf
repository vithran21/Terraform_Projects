# Create a DB server
resource "aws_instance" "db" {
  ami                    = "ami-0e0e417dfa2028266"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.db.id]
  key_name               = "keypair1"
  tags = {
    Name = "db server"
  }
}

# Create a security group for the DB server
resource "aws_security_group" "db" {
  name        = "db-server-sg"
  description = "Security group for the DB server"
  vpc_id      = aws_vpc.example.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}