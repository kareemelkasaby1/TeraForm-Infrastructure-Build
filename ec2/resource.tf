resource "aws_instance" "this" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  key_name = "${var.key_pair_name}"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_id}"]
  tags = {
    Name = "${var.tag}"
  }
}
