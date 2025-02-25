provider "aws" {
  region = "us-east-1"
}


provider "aws" {
    region = "ap-south-1"
    alias = "provider2"
  
}
resource "aws_s3_bucket" "provider-1" {
    bucket = "fghjrtyucvhcv"
    provider = aws.provider2
     
  
}

resource "aws_instance" "name" {
    ami = "ami-085ad6ae776d8f09c"
    instance_type = "t2.micro"
    provider = aws.provider2
   
   
  
}



  