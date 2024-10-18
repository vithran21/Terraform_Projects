# Create a route for the private route table to the NAT gateway
resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.example.id
  lifecycle {
    prevent_destroy = false
  }
}