resource "aws_dynamodb_table" "my_test_table" {
  name = "test_table"
  billing_mode = "PROVISIONED"
  read_capacity = 20
  write_capacity = 20
  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }
}