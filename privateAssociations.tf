resource "aws_route_table_association" "d" {
  subnet_id      = "${aws_subnet.firstPrivateSubnet.id}"
  route_table_id = "${aws_route_table.priR.id}"
}

resource "aws_route_table_association" "e" {
  subnet_id      = "${aws_subnet.secondPrivateSubnet.id}"
  route_table_id = "${aws_route_table.priR.id}"
}