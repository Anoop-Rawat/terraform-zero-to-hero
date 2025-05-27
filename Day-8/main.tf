provider "aws" {
  region = "us-east-1"
}


import {
    id = "i-02b165cf9fa96352c"
    to = aws_instance.example   
}
