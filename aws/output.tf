output "instance_1_ip_address" {
    value = aws_instance.instance-terraform_1.public_ip
}

output "instance_2_ip_address" {
    value = aws_instance.instance-terraform_2.public_ip
}