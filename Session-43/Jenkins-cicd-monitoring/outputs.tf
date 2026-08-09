output "jenkins_instance_id" {
    description = "Jenkins EC2 Instancve ID"
    value = aws_instance.jenkins_server.id
}
output "jenkins_public_ip" {

  description = "Jenkins EC2 Public IP"

  value = aws_instance.jenkins_server.public_ip
}
output "jenkins_url" {

  description = "Jenkins URL"

  value = "http://${aws_instance.jenkins_server.public_ip}:8080"
}

output "jenkins_alarm_name" {

  description = "CloudWatch Alarm"

  value = aws_cloudwatch_metric_alarm.jenkins_error_alarm.alarm_name
}

output "sns_topic" {

  description = "SNS Topic ARN"

  value = aws_sns_topic.jenkins_alarm.arn
}

output "s3_bucket" {

  description = "S3 Bucket"

  value = aws_s3_bucket.jenkins_logs.bucket
}