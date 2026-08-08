# ============================================================
# 1. Security Group
# ============================================================

resource "aws_security_group" "web" {

  name        = "cloudwatch-demo-sg"
  description = "Security group for CloudWatch demo"

  # SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "CloudWatch-Demo-SG"
  }
}


# ============================================================
# 2. EC2 Instance
# ============================================================

resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.web.id
  ]

  # Detailed monitoring
  monitoring = true

  # Install stress-ng automatically
  user_data = <<-EOF
              #!/bin/bash

              apt-get update -y

              apt-get install -y stress-ng

              echo "CloudWatch Demo Ready" > /tmp/demo.txt
              EOF

  tags = {
    Name = "CloudWatch-Demo-Server"
  }
}


# ============================================================
# 3. SNS Topic
# ============================================================

resource "aws_sns_topic" "cpu_alarm" {

  name = "ec2-high-cpu-alert"
}


# ============================================================
# 4. Email Subscription
# ============================================================

resource "aws_sns_topic_subscription" "email" {

  topic_arn = aws_sns_topic.cpu_alarm.arn

  protocol = "email"

  endpoint = var.email
}


# ============================================================
# 5. CloudWatch CPU Alarm
# ============================================================

resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name = "EC2-High-CPU-Alarm"

  alarm_description = "Alarm when EC2 CPU exceeds 70%"

  comparison_operator = "GreaterThanThreshold"

  threshold = 70

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  statistic = "Average"

  period = 60

  dimensions = {
    InstanceId = aws_instance.web.id
  }

  alarm_actions = [
    aws_sns_topic.cpu_alarm.arn
  ]

  ok_actions = [
    aws_sns_topic.cpu_alarm.arn
  ]

  treat_missing_data = "notBreaching"
}