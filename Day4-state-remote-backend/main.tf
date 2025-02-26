resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo-db"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}






resource "aws_instance" "name" {
    ami = "ami-05b10e08d247fb927"
    instance_type = "t2.micro"
    key_name = "vin"
  
}