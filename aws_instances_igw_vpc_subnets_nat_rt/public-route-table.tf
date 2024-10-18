# Create a public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "public-route-table"
  }
  lifecycle {
    prevent_destroy = false
  }
}