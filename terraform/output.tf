output "ec2_global_ips" {
  value = aws_instance.kokishin_ec2.*.public_ip
}