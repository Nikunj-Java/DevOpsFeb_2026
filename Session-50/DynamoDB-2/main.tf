# PROVIDER CONFIGURATION
provider "aws" {
  region = "us-east-1"
}

# DYNAMODB TABLE CONFIGURATION
resource "aws_dynamodb_table" "users" {
    name           = "users"
    billing_mode   = "PAY_PER_REQUEST"

    # partition key
    hash_key       = "Email"

    attribute {
      name = "Email"
      type = "S" #S= String

    }
    tags = {
      Project = "User Management"
      Owner= "Nikunj"
    }
}

# OUTPUT CONFIGURATION
output "table_name" {
  value = aws_dynamodb_table.users.name
}