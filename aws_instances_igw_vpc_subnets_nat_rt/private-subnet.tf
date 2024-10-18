# Create a private subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.0.128/25"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "private-subnet"
  }
  lifecycle {
    prevent_destroy = false
  }
}