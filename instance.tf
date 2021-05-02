resource "aws_instance" "mv-244186-ec2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id = aws_subnet.mv-244186-subnet.id
  vpc_security_group_ids = [aws_security_group.mv-244186-sg.id]
  tags = {
    Name      = "mv-244186-ec2"
    terraform = "True"
  }
}