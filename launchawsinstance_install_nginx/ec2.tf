#AWS ec2 instance (AMI - Amazon Linux 2; Instance type - t2.micro)
resource "aws_instance" "linuxserver" {
  ami             = "ami-0d1622042e957c247"
  instance_type   = "t2.micro"
  key_name        = "keypair1"
  security_groups = [aws_security_group.all_access_sg.name]
  user_data       = file("nginx.sh")
  tags = {
    Name = "linuxserver"
  }
}

output "instance_id" {
  value = aws_instance.linuxserver.id
}

output "public_ip" {
  value = aws_instance.linuxserver.public_ip
}

output "private_ip" {
  value = aws_instance.linuxserver.private_ip
}

output "ec2_public_dns" {
  value = aws_instance.linuxserver.public_dns
  description = "Public IPv4 DNS of the EC2 instance"
}