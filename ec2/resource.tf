resource "aws_instance" "this" {
  ami           = "ami-0ce21b51cb31a48b8"
  instance_type = "t2.micro"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  key_name = "${var.key_pair_name}"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_id}"]
  tags = {
    Name = "${var.tag}"
  }
}
