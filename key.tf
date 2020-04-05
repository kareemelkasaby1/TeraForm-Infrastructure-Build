resource "tls_private_key" "pubkicAndPrivateKeys" {
  algorithm   = "RSA"
  rsa_bits = "2048"
}

resource "aws_secretsmanager_secret" "secretManagerToStoreKeys" {
  name = "secretManagerTo"
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = "${aws_secretsmanager_secret.secretManagerToStoreKeys.id}"
  secret_string = "${tls_private_key.pubkicAndPrivateKeys.private_key_pem}"
}

resource "local_file" "ec2-private-key" {
  content = "${tls_private_key.pubkicAndPrivateKeys.private_key_pem}"
  filename = "./terraform.pem"
} 

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${tls_private_key.pubkicAndPrivateKeys.public_key_openssh}"
}

resource "aws_s3_bucket" "b" {
  bucket = "terraformBucketToStoreKeysToUseLater"
  acl    = "private"

  kareem {
    pem_document = "/var/jenkins_home/workspace/buildInfrastructureerraform/terraform.pem"
  }

  tags = {
    Name        = "TerraFormBucket"
    Environment = "Dev"
  }
}

