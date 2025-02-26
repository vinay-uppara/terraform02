#Creating VPC
resource "aws_vpc" "prod" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "prod_vpc"
    }
  
}
#creating subnet
resource "aws_subnet" "prod" {
    vpc_id = aws_vpc.prod.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "prod_subnet"
    }
  
}
resource "aws_subnet" "prod_private" {
  vpc_id                  = aws_vpc.prod.id  # Ensure this points to the correct VPC
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  # other configurations...
}


# create internet gateway
resource "aws_internet_gateway" "prod" {
    vpc_id = aws_vpc.prod.id
     tags = {
      Name = "prod_ig"
    }
  
}
#create route table and edit routes
resource "aws_route_table" "name" {
    vpc_id = aws_vpc.prod.id
    
    route {
        gateway_id = aws_internet_gateway.prod.id
        cidr_block = "0.0.0.0/0"
    }
  
}

#subnet associtaion
resource "aws_route_table_association" "name" {
  route_table_id = aws_route_table.name.id
  subnet_id = aws_subnet.prod.id
}



# Create nat gateway for private subnet
# Create route for private subnets and edit routes 
# route table association 

#Create securtiy group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.prod.id

  ingress {
    description = "TLS from ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    description = "TLS from ssh"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

#creation of server
resource "aws_instance" "name" {
    ami = "ami-05b10e08d247fb927"
    instance_type = "t2.micro"
    key_name = "vin"
    subnet_id = aws_subnet.prod.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
      Name = "prod-ec2"
    }
  
}