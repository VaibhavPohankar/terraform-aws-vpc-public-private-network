terraform {
  backend "s3" {
    bucket  = "my-terraform-states"
    key     = "network/production/terraform.tfstate"
    region  = "ap-south-1"
  }
}
