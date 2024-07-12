
# ---------------------------
# EC2
# ---------------------------
# Amazon Linux 2 の最新版AMIを取得
data "aws_ssm_parameter" "amzn2_latest_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

# EC2作成
resource "aws_instance" "kokishin_ec2"{
  ami                         = data.aws_ssm_parameter.amzn2_latest_ami.value
  instance_type               = "t2.micro"
  availability_zone           = var.az_a
  vpc_security_group_ids      = [aws_security_group.kokishin_ec2_sg.id]
  subnet_id                   = aws_subnet.kokishin_public_1a_sn.id
  associate_public_ip_address = "true"
}