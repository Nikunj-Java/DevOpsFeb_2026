provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "employee" {
  name           = "employee-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "EmpId"

  attribute {
    name = "EmpId"
    type = "S"
  }
}
