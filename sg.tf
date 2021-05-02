resource "aws_security_group" "mv-244186-sg" {
  name        = "permite-ssh"
  description = "SSH"
  vpc_id = aws_vpc.mv-244186-vpc.id
  
  ingress {
    description      = "SSH-VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "permite-ssh"
  }
}