provider "aws" {
    region = "us-east-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
    ami           = "ami-053b0d53c279acc90"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
    
    tags = {
        Name        = "MyEC2Instance"
        Environment = "Dev"
    }

    lifecycle {
        ignore_changes = [tags,instance_type] # if anything changes via console on tag, instance type , it will ignore by tf
    }
}