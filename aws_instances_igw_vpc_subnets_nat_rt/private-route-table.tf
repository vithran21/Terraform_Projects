# Create a private route table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.example.id
  tags = {
    Name = "private-route-table"
  }
  lifecycle {
    prevent_destroy = false
  }
}