terraform {
  backend "s3" {
    bucket         = "anoop-s3-demo-xyz-demo" # bucket name
    key            = "backend/terraform.tfstate" # path with name of file for statefile inside bucket
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock" # or use s3 native by using use_lockfile = true
  }
}