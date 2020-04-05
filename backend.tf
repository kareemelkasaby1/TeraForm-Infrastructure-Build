terraform {
  backend "s3" {
    bucket = "yarb2st0rha"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}