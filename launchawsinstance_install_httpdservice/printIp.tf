#To print output of instance Public IP
output "public_ip" {
  value = aws_instance.mylinuxserver.public_ip
}

#To print output of instance Private IP
output "private_ip" {
  value = aws_instance.mylinuxserver.private_ip
}