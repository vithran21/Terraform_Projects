#AWS ec2 instance (AMI - Amazon Linux 2; Instance type - t2.micro)
resource "aws_instance" "linuxserver" {
  ami             = "ami-0d1622042e957c247"
  instance_type   = "t2.micro"
  key_name        = "keypair1"
  security_groups = [aws_security_group.all_access_sg.name]
  tags = {
    Name = "linuxserver"
  }
}

output "instance_id" {
  value = aws_instance.linuxserver.id
}