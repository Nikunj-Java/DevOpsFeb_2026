# Sample User

resource "aws_dynamodb_table_item" "user1" {
    table_name = aws_dynamodb_table.users.name
    hash_key   = "Email"
    item = <<ITEM
{
  "Email": {"S": "user1@example.com"},
  "Password": {"S": "password123"},
  "Name": {"S": "Nikunj Soni"},
  "Designation": {"S": "Developer"}
}
ITEM
}

# Sample User

resource "aws_dynamodb_table_item" "user2" {
    table_name = aws_dynamodb_table.users.name
    hash_key   = "Email"
    item = <<ITEM
{
  "Email": {"S": "user2@example.com"},
  "Password": {"S": "Rishi@123"},
  "Name": {"S": "Rishi Kumar Gupta"},
  "Designation": {"S": "Senior Developer"}
}
ITEM
}