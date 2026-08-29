output "s3_bucket_name" {
    value = aws_s3_bucket.website.bucket
}
output "s3_website_endpoint"{
    value = aws_s3_bucket.website.website_endpoint
}
output "cloudfront_domain_name" {
    value = aws_cloudfront_distribution.website.domain_name
}
