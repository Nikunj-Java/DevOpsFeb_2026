output "instance_id" {
  value = aws_instance.log_monitor.id
}

output "instance_public_ip" {
  value = aws_instance.log_monitor.public_ip
}

output "instance_public_dns" {
  value = aws_instance.log_monitor.public_dns
}

output "log_group_name" {
  value = aws_cloudwatch_log_group.myapp.name
}

output "iam_role_name" {
  value = aws_iam_role.ec2_cloudwatch.name
}
