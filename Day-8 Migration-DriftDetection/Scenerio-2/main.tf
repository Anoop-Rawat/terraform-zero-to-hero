provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "example" {
    ami           = "ami-053b0d53c279acc90"  
    instance_type = "t2.micro"
    
    tags = {
        Name        = "MyEC2Instance"
        Environment = "Dev"
        
    }

    # lifecycle {
    #     ignore_changes = [tags,instance_type] # if anything changes via console on tag, instance type , it will ignore by tf
    # }
}
