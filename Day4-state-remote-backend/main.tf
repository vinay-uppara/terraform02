resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  # Enable point-in-time recovery, optional but recommended for safety
  point_in_time_recovery {
    enabled = true
  }
}



resource "aws_s3_bucket" "dev" {
  bucket = "ashfaqvin"
  
}



resource "aws_instance" "name" {
    ami = "ami-05b10e08d247fb927"
    instance_type = "t2.micro"
    key_name = "vin"
  
}