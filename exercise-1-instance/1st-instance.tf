provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "intro" {
  ami                    = "ami-0cff7528ff583bf9a"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "teraform-basic-key"
  vpc_security_group_ids = ["sg-0141abaf6a6038247"]
  tags = {
    Name = "Terraform-Instance"
  }
}
