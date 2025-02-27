resource "aws_instance" "import" {
  # This configuration will be populated after import
  ami = "ami-05b10e08d247fb927"
  instance_type = "t2.micro"
  key_name = "vin"
  tags = {
    Name = "test"
    
  }
}
