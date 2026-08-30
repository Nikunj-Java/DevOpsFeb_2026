output "bucket_name" {

  description = "Name of the S3 bucket"

  value = aws_s3_bucket.flask_app_bucket.bucket

}


output "bucket_arn" {

  description = "ARN of the S3 bucket"

  value = aws_s3_bucket.flask_app_bucket.arn

}


output "bucket_region" {

  description = "Region of the S3 bucket"

  value = var.aws_region

}