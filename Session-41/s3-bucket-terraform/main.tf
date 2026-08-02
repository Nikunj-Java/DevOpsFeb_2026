# Provider configuration for AWS
provider "aws"{
    region = "us-east-1"
}
# Create an S3 bucket with 
resource "aws_s3_bucket" "versioned_bucket" {
    bucket = "my-aws-s3-bucket-02082026"
}

# ownership controls for the S3 bucket
# This ensures that objects uploaded to the bucket are owned by the bucket owner.
resource "aws_s3_bucket_ownership_controls" "bucket_ownership" {
    bucket = aws_s3_bucket.versioned_bucket.id

    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}  
# ACL -Means Access Control List. 
# It defines the access permissions for the S3 bucket. 
# In this case, we are setting the ACL to "public-read", which means that anyone can read the objects in the bucket.
resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucket_ownership
  ]

  bucket = aws_s3_bucket.versioned_bucket.id
  acl    = "public-read"
}
# this is for website configuration for the S3 bucket.
resource "aws_s3_bucket_website_configuration" "website_config" {
    bucket = aws_s3_bucket.versioned_bucket.id

    index_document {
        suffix = "index.html"
    }

    error_document {
        key = "error.html"
    }
}
# Public Access block configuration for the S3 bucket.
resource "aws_s3_bucket_public_access_block" "bucket_block" {
  bucket = aws_s3_bucket.versioned_bucket.id

  block_public_policy     = false
  block_public_acls       = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

