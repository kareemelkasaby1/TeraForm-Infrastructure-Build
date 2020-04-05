resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.firstPublicSubnet.id}"
  route_table_id = "${aws_route_table.pubR.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.secondPublicSubnet.id}"
  route_table_id = "${aws_route_table.pubR.id}"
}



