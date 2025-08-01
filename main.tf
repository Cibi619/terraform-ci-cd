
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "destroy619"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-08a6efd148b1f7504"
  instance_type = "t2.micro"
  count         = var.core_count

  tags = {
    Name = "ExampleInstance"
  }
}
