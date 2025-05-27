terraform {
  backend "s3" {
    bucket         = "anoop-s3-demo-xyz-demo135" # bucket name
    key            = "backend/terraform.tfstate" # path with name of file for statefile inside bucket
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true

  }
}