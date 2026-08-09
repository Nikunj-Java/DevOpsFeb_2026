# ============================================================
# DATA SOURCES: AMI ID
# ============================================================
# Latest Ubuntu 24.04 LTS AMI
data "aws_ssm_parameter" "ubuntu_ami" {
  name = "/aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id"
}

# Default VPC
data "aws_vpc" "default" {
  default = true
}

# ============================================================
# S3 BUCKET
# Optional storage for the demo
# ============================================================

resource "aws_s3_bucket" "jenkins_logs" {
   bucket_prefix = "jenkins-monitoring-"

  tags = {
    Name        = "Jenkins Monitoring Logs"
    Environment = "Training"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "jenkins_logs" {
  bucket = aws_s3_bucket.jenkins_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# ============================================================
# IAM ROLE FOR EC2 (Optional: if already done from AWS)
# ============================================================
resource "aws_iam_role" "jenkins_role" {

  name = "jenkins-cloudwatch-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "Jenkins CloudWatch Role"
  }
}

# ============================================================
# CLOUDWATCH AGENT POLICY
# ============================================================
resource "aws_iam_role_policy_attachment" "cloudwatch_agent" {

  role = aws_iam_role.jenkins_role.name

  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# ============================================================
# EC2 INSTANCE PROFILE
# ============================================================

resource "aws_iam_instance_profile" "jenkins_profile" {
  name = "jenkins-cloudwatch-profile"
  role = aws_iam_role.jenkins_role.name
}

# ============================================================
# SECURITY GROUP
# ============================================================

resource "aws_security_group" "jenkins_sg" {

  name = "jenkins-monitoring-sg"

  description = "Security group for Jenkins monitoring demo"

  vpc_id = data.aws_vpc.default.id


  # ----------------------------------------------------------
  # SSH
  # ----------------------------------------------------------

  ingress {

    description = "SSH"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }


  # ----------------------------------------------------------
  # Jenkins
  # ----------------------------------------------------------

  ingress {

    description = "Jenkins"

    from_port = 8080

    to_port = 8080

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }


  # ----------------------------------------------------------
  # HTTP
  # ----------------------------------------------------------

  ingress {

    description = "HTTP"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }


  # ----------------------------------------------------------
  # Outbound
  # ----------------------------------------------------------

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }


  tags = {

    Name = "Jenkins-Monitoring-SG"

  }
}


# ============================================================
# CLOUDWATCH LOG GROUP
# ============================================================
resource "aws_cloudwatch_log_group" "jenkins_logs" {

  name              = "/jenkins/logs"

  retention_in_days = 7

  tags = {
    Application        = "Jenkins"
    Environment = "Training"
  }
}


# ============================================================
# EC2 INSTANCE
# ============================================================
resource "aws_instance" "jenkins_server" {

  ami           = data.aws_ssm_parameter.ubuntu_ami.value

  instance_type = var.instance_type

  key_name      = var.key_name

   

  vpc_security_group_ids = [
    aws_security_group.jenkins_sg.id
  ]

  iam_instance_profile = aws_iam_instance_profile.jenkins_profile.name
  associate_public_ip_address = true

  user_data = <<-EOF
#!/bin/bash

set -e

# Update Ubuntu
apt-get update -y

# Install Java 21 and required packages
apt-get install -y \
  fontconfig \
  openjdk-21-jre \
  curl \
  wget

# Verify Java
java -version

# Create keyring directory
mkdir -p /etc/apt/keyrings

# Install current Jenkins repository signing key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key \
  | tee /etc/apt/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update repositories
apt-get update -y

# Install Jenkins
apt-get install -y jenkins

# Start Jenkins
systemctl enable jenkins
systemctl start jenkins

# Show status
systemctl status jenkins --no-pager
              sleep 20
              # Install CloudWatch Agent
              sudo apt-get install -y amazon-cloudwatch-agent
              # Create CloudWatch Agent configuration file
                cat <<EOT > /opt/aws/amazon-cloudwatch-agent/bin/config.json
                {
                    "agent": {
                    "metrics_collection_interval": 60,
                    "run_as_user": "root"
                    },
                    "logs": {
                    "logs_collected": {
                        "files": {
                            "collect_list": [
                                {
                                    "file_path": "/var/log/jenkins/jenkins.log",
                                    "log_group_name": "/jenkins/logs",
                                    "log_stream_name": "{instance_id}"
                                }
                            ]
                        }
                    }
                    }
                }
                EOT
              # Start CloudWatch Agent
              sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s
              # Create TEST Jenkins LOG
                sudo touch /var/log/jenkins/jenkins.log
                sudo chmod 644 /var/log/jenkins/jenkins.log
              # Create a test log entry
                cat > /usr/local/bin/create-jenkins-error.sh <<'SCRIPT'

                #!/bin/bash

                echo "$(date) ERROR Jenkins build failed - Database connection failed" >> /var/log/jenkins/jenkins.log

                SCRIPT


                chmod +x /usr/local/bin/create-jenkins-error.sh
            
                # ========================================================
                # FINISH
                # ========================================================

                echo "======================================"
                echo "Jenkins installation completed"
                echo "CloudWatch Agent configured"
                echo "======================================"
            EOF

  tags = {
    Name        = "Jenkins-Monitoring-Server"
    Application = "Jenkins"
    Environment = "Training"
  }
  depends_on = [
    aws_iam_role_policy_attachment.cloudwatch_agent,
    aws_iam_instance_profile.jenkins_profile,
    aws_security_group.jenkins_sg,
    aws_cloudwatch_log_group.jenkins_logs
  ]

}

# ============================================================
# CLOUDWATCH METRIC FILTER
# ============================================================

resource "aws_cloudwatch_log_metric_filter" "jenkins_errors" {

  name = "JenkinsErrorFilter"

  log_group_name = aws_cloudwatch_log_group.jenkins_logs.name

  pattern = "ERROR"


  metric_transformation {

    name = "JenkinsErrorCount"

    namespace = "JenkinsApp"

    value = "1"

    default_value = 0

  }

}

# ============================================================
# SNS TOPIC
# ============================================================

resource "aws_sns_topic" "jenkins_alarm" {

  name = "jenkins-error-alert"

}


# ============================================================
# SNS EMAIL SUBSCRIPTION
# ============================================================

resource "aws_sns_topic_subscription" "jenkins_email" {

  topic_arn = aws_sns_topic.jenkins_alarm.arn

  protocol = "email"

  endpoint = var.email

}


# ============================================================
# CLOUDWATCH ALARM
# ============================================================

resource "aws_cloudwatch_metric_alarm" "jenkins_error_alarm" {

  alarm_name = "Jenkins-Error-Alarm"

  alarm_description = "Triggers when Jenkins produces more than 5 ERROR log entries in one minute"


  # ----------------------------------------------------------
  # Metric
  # ----------------------------------------------------------

  namespace = "JenkinsApp"

  metric_name = "JenkinsErrorCount"


  # ----------------------------------------------------------
  # Condition
  # ----------------------------------------------------------

  comparison_operator = "GreaterThanThreshold"

  threshold = 5


  # ----------------------------------------------------------
  # Evaluation
  # ----------------------------------------------------------

  evaluation_periods = 1

  period = 60

  statistic = "Sum"


  # ----------------------------------------------------------
  # Notification
  # ----------------------------------------------------------

  alarm_actions = [

    aws_sns_topic.jenkins_alarm.arn

  ]


  ok_actions = [

    aws_sns_topic.jenkins_alarm.arn

  ]


  treat_missing_data = "notBreaching"


  depends_on = [

    aws_cloudwatch_log_metric_filter.jenkins_errors

  ]

}