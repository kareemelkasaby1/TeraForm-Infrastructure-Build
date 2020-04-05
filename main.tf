module "nginx1" {
  source                = "./ec2"
  tag                   = "nginx1"
  subnet_id             = "${aws_subnet.firstPublicSubnet.id}"
  vpc_security_group_id = "${aws_security_group.web.id}"
  key_pair_name         = "${aws_key_pair.deployer.id}"
}

module "nginx2" {
  source                = "./ec2"
  tag                   = "nginx2"
  subnet_id             = "${aws_subnet.secondPublicSubnet.id}"
  vpc_security_group_id = "${aws_security_group.web.id}"
  key_pair_name         = "${aws_key_pair.deployer.id}"
}

module "bastion" {
  source                = "./ec2"
  tag                   = "bastion"
  subnet_id             = "${aws_subnet.secondPublicSubnet.id}"
  vpc_security_group_id = "${aws_security_group.bastionSSH.id}"
  key_pair_name         = "${aws_key_pair.deployer.id}"
  associate_public_ip_address = true
}

module "app1" {
  source                = "./ec2"
  tag                   = "app1"
  subnet_id             = "${aws_subnet.firstPrivateSubnet.id}"
  vpc_security_group_id = "${aws_security_group.appSSH.id}"
  key_pair_name         = "${aws_key_pair.deployer.id}"
}

module "app2" {
  source                = "./ec2"
  tag                   = "app2"
  subnet_id             = "${aws_subnet.secondPrivateSubnet.id}"
  vpc_security_group_id = "${aws_security_group.appSSH.id}"
  key_pair_name         = "${aws_key_pair.deployer.id}"
}