terraform {
  backend "s3" {
    bucket = "terraform-state-caique"
    key    = "home/ubuntu/terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
