output "security-group-id"{
    description = "ID of the security group"
    value = aws_security_group.sg1.id
}

output "server1-private-ip" {
    description = "Server1 Private IP"
    value = aws_instance.server1.private_ip
}

output "server1-publicIP" {
  value = aws_instance.server1.public_ip
}

output "instances_id"{
    value = aws_instance.server1.id
}