terraform {
  backend "s3" {
    bucket = "tf-gb-terraform-state"
    key    = "dev/us-east-1/cfalarms/terraform.state"
    region = "us-east-1"

    profile = "opsdevqe"
  }
}