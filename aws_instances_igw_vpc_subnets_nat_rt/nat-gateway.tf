# Create a NAT gateway
resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.example.id
  subnet_id     = aws_subnet.public.id
  tags = {
    Name = "example-nat-gateway"
  }
  lifecycle {
    prevent_destroy = false
  }
}