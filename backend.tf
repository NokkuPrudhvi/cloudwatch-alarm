terraform {
  backend "s3" {
    bucket = module.aws_s3_bucket.statebucket
    key    = "dev/virginia/cfalarms"
    region = "us-east-1"
  }
}