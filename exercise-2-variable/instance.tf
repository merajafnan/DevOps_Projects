resource "aws_instance" "terraform-inst" {
  ami                    = var.AMIA[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "teraform-basic-key"
  vpc_security_group_ids = ["sg-0141abaf6a6038247"]
  tags = {
    Name = "Terraform-Instance"
  }
}