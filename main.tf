# ===============================================
# Resources
# ===============================================
# 1. EC2
resource "aws_instance" "jenkins" {
  ami                  = "ami-0c3fd0f5d33134a76"
  instance_type        = "t3.micro"
  subnet_id            = aws_subnet.public_0.id
  user_data            = file("./user_data.sh")
  vpc_security_group_ids = [
    module.ec2-sg.security_group_id,
    module.ec2-ssh-sg.security_group_id
  ]
  key_name = aws_key_pair.main.key_name

  tags = {
    Name = "jenkins"
  }
}

# resource "aws_instance" "dev" {
#   ami                  = "ami-0c3fd0f5d33134a76"
#   instance_type        = "t3.micro"
#   subnet_id            = aws_subnet.public_1.id
#   # security_groups
#   tags = {
#     Name = "dev"
#   }
# }

# resource "aws_instance" "prod" {
#   ami                  = "ami-0c3fd0f5d33134a76"
#   instance_type        = "t3.micro"
#   subnet_id            = aws_subnet.public_2.id
#   # security_groups
#   tags = {
#     Name = "prod"
#   }
# }

# EC2用セキュリティグループ
module "ec2-sg" {
  source = "./security_group"
  name = "ec2-sg"
  vpc_id = aws_vpc.main.id
  port = 80
  cidr_blocks = ["0.0.0.0/0"]
}

module "ec2-ssh-sg" {
  source = "./security_group"
  name = "ec2-ssh-sg"
  vpc_id = aws_vpc.main.id
  port = 22
  cidr_blocks = ["0.0.0.0/0"]
}
