provider "aws" {
  region                  = "us-west-1"
  shared_credentials_file = "/~/.aws/creds"
  profile                 = "awsCredForTerrafom"
}


terraform {
  backend "s3" {
    bucket = "	yarb2st0rha"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}