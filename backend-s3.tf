terraform {
  backend "s3" {
    bucket = "terra-state-eereeda"
    key = "terraform/backend"
    region = "us-east-1"
  }
}