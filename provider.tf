provider "aws" {
  region                  = "us-west-1"
  shared_credentials_file = "/~/.aws/creds"
  profile                 = "awsCredForTerrafom"
}

terraform {
  backend "s3" {
    bucket = "${aws_s3_bucket.b.bucket}"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}