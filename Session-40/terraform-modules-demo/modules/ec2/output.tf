output "instance_id" {
  value = aws_instance.server.id
}
output "instance_public_ip" {
  value = aws_instance.server.public_ip
}