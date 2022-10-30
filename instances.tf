resource "aws_instance" "linux" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-private-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
  tags = {
    Name = "linux"
   
  }
}



resource "aws_instance" "windows" {
  ami           = data.aws_ami.windows-ami.image_id
  instance_type = "t2.large"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-rdp.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
  tags = {
    Name = "windows"
   
  }
}