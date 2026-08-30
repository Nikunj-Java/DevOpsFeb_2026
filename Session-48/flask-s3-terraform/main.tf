## terraform Configuration for deploying a Flask application to AWS S3
terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

  }
}

provider "aws" {
  region = var.aws_region
}

# Create EC2 instance to host the Flask application
# Install Python, Flask, and other dependencies on the EC2 instance
# add User data in --> app.py
# Run the Application on the EC2 instance
# open the Ports  80, 5000


# s3 bucket to host the Flask application
resource "aws_s3_bucket" "flask_app_bucket"{
  bucket = "amzn-s3-bucket-30082026"
  tags = {
    Name        = "FlaskAppBucket"
    Environment = "Development"
    project     = "FlaskApp"
  }
}

# s3 bucket policy s3:PutObject for the Flask application bucket
# s3 bucket plicy s3:GetObject for the Flask application bucket
resource "aws_s3_bucket_policy" "flask_app_bucket_policy" {

  bucket = aws_s3_bucket.flask_app_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "AllowFlaskGetPut"
        Effect = "Allow"

        Principal = {
          AWS = "arn:aws:iam::748810634002:user/Nikunj"
        }

        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ]

        Resource = "${aws_s3_bucket.flask_app_bucket.arn}/*"
      }
    ]
  })
}