terraform {
  backend "s3" {
    bucket  = "my-terra-tfstate"
    key     = "network/production/terraform.tfstate"
    region  = "ap-south-1"
  }
}
