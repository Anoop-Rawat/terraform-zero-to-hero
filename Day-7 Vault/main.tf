// youtube link https://www.youtube.com/watch?v=sIkRK33AY50&list=PLdpzxOOAlwvI0O4PeKVV1-yJoX2AqIWuf&index=7

provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://172.21.184.9:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "74ca799d-2d83-d3f5-5f1c-64a124027b8c"
      secret_id = " 8951e2aa-9777-653d-81db-4f2f8668ce40"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "MyKVsecret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
