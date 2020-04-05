resource "aws_route_table" "pubR" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = {
    Name = "pubR"
  }
}

resource "aws_route_table" "priR" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "priR"
  }
}