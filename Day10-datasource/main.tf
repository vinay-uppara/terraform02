data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["default-1"] # insert value here
  }
}
data "aws_security_groups" "selected" {
  filter {
    name   = "tag:Name"
    values = ["vin"] # insert value here
  }
}


resource "aws_instance" "dev" {
    ami = "ami-05b10e08d247fb927"
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.selected.id
    vpc_security_group_ids = [data.aws_security_groups.selected.ids[0]]

}