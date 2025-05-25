# create s3 bucket and dynamodb table seperate by your main terraform project or you can manually do this
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "anoop-s3-demo-xyz-demo" 
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}