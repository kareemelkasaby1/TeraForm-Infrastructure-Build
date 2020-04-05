resource "aws_subnet" "firstPublicSubnet" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-west-2a"
  tags = {
    Name = "firstPublicSubnet"
  }
}

resource "aws_subnet" "secondPublicSubnet" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-west-2b"
  tags = {
    Name = "secondPublicSubnet"
  }
}