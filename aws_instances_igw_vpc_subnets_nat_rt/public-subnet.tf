# Create a public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.0.0/25"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "public-subnet"
  }
  lifecycle {
    prevent_destroy = false
  }
}