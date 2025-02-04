output "instance_id" {
  value = aws_instance.argo.id
}

output "public_ip" {
  value = aws_instance.argo.public_ip
}

output "security_group_id" {
  value = aws_security_group.argo.id
}
