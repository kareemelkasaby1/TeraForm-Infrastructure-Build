resource "aws_subnet" "firstPrivateSubnet" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2c"
  tags = {
    Name = "firstPrivateSubnet"
  }
}

resource "aws_subnet" "secondPrivateSubnet" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-west-2c"
  tags = {
    Name = "secondPrivateSubnet"
  }
}