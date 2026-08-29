# This is the main Terraform configuration file for setting up AWS CloudFront distribution and related resources.
terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "~>6.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

# Create an S3 bucket 
resource "aws_s3_bucket" "website" {
  bucket = "nikunj-cloudfront-website-29082026"
  tags = {
    Name        = "website"
    Environment = "Dev"
  }
}

# Create an S3 bucket public access block to prevent public access
resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
# Create an S3 bucket policy to allow public read access to the bucket
resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  depends_on = [aws_s3_bucket_public_access_block.website]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = "*"
        Action = "s3:GetObject"
        Resource = "${aws_s3_bucket.website.arn}/*"
      }
    ]
  })
}

# Enable static website hosting on the S3 bucket
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# upload index.html and error.html to the S3 bucket
resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.website.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
  etag = filemd5("index.html")
}

resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.website.id
  key    = "error.html"
  source = "error.html"
  content_type = "text/html"
  etag = filemd5("error.html")
}

# Create CloudFront distribution for the S3 bucket
resource "aws_cloudfront_distribution" "website" {

  enabled = true

  origin {

    domain_name = aws_s3_bucket_website_configuration.website.website_endpoint

    origin_id = "S3-${aws_s3_bucket.website.id}"

    custom_origin_config {

      http_port  = 80
      https_port = 443

      origin_protocol_policy = "http-only"

      origin_ssl_protocols = [
        "TLSv1.2"
      ]
    }
  }


  default_cache_behavior {

    allowed_methods = [
      "GET",
      "HEAD"
    ]

    cached_methods = [
      "GET",
      "HEAD"
    ]

    target_origin_id = "S3-${aws_s3_bucket.website.id}"

    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {

      query_string = false

      cookies {
        forward = "none"
      }
    }
  }


  default_root_object = "index.html"


  restrictions {

    geo_restriction {

      restriction_type = "none"
    }
  }


  viewer_certificate {

    cloudfront_default_certificate = true
  }
}