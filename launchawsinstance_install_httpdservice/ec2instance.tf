#AWS ec2 instance (AMI - Amazon Linux 2; Instance type - t2.micro)
resource "aws_instance" "mylinuxserver" {
  ami             = "ami-0d1622042e957c247"
  instance_type   = "t2.micro"
  key_name        = "keypair1"
  security_groups = [aws_security_group.all_access_sg.name]
  user_data       = file("httpd_service.sh")
  tags = {
    Name = "server1"
  }
}
