# ec2.tf

resource "aws_instance" "frontend" {
  ami                    = "ami-0c55b159cbfafe1f0"  # ✅ Correct Amazon Linux 2 AMI for us-east-2
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.frontend_sg.id]
  associate_public_ip_address = true
  key_name               = "new"  # ✅ Your EC2 Key Pair name (no .pem)

  user_data = file("${path.module}/scripts/frontend-userdata.sh")

  tags = {
    Name = "Frontend-Server"
  }
}

resource "aws_instance" "backend" {
  ami                    = "ami-0c55b159cbfafe1f0"  # ✅ Correct Amazon Linux 2 AMI for us-east-2
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_2.id
  vpc_security_group_ids = [aws_security_group.backend_sg.id]
  associate_public_ip_address = true
  key_name               = "new"  # ✅ Your EC2 Key Pair name (no .pem)

  user_data = file("${path.module}/scripts/backend-userdata.sh")

  tags = {
    Name = "Backend-Server"
  }
}
