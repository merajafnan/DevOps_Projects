resource "aws_key_pair" "terra-key" {
  key_name   = "terrakey"
  public_key = file("terrakey.pub")
}

resource "aws_instance" "terraform-inst" {
  ami                    = var.AMIA[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.terra-key.key_name
  vpc_security_group_ids = ["sg-0141abaf6a6038247"]
  tags = {
    Name    = "Terraform-Instance"
    Project = "Terraform"
  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
  connection {
    user        = var.USER
    private_key = file("terrakey")
    host        = self.public_ip
  }
}



