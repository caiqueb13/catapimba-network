terraform {
  backend "s3" {
    bucket = "terraform-state-caique"
    key    = "terraform-network-catapimba.tfstate"
    region = "us-east-1"
  }
}
