# Create an EIP for the NAT gateway
resource "aws_eip" "example" {
  domain = "vpc"
  tags = {
    Name = "example-eip"
  }
  lifecycle {
    prevent_destroy = false
  }
}