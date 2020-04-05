resource "tls_private_key" "pubkicAndPrivateKeys" {
  algorithm   = "RSA"
  rsa_bits = "2048"
}

resource "aws_secretsmanager_secret" "secretManagerToStoreKeys" {
  name = "secretTo"
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

  tags = {
    Name        = "TerraFormBucket"
    Environment = "Dev"
  }
}


// Upload file without encryption
resource "aws_s3_bucket_object" "bucketObj" {
  bucket = "${aws_s3_bucket.b.bucket}"
  key    = "terraform-1.txt"
  source = "./terraform.pem"
}


terraform {
  backend "s3" {
    bucket = "${aws_s3_bucket.b.bucket}"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}