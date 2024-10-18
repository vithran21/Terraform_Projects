#Creating a simple aws ec2 instance using terraform script

#Provider details 
provider "aws" {
  region     = "ap-south-1"
  access_key = "your-aws-access-key"
  secret_key = "your-aws-secret-key"
}

#Resource - AWS - ec2 instance details
resource "aws_instance" "mylinuxservers" {
  ami           = "ami-0d1622042e957c247"
  instance_type = "t2.micro"
  key_name      = "keypair1"
  tags = {
    Name = "server1"
  }
}