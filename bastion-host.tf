resource "aws_instance" "eereeda-bastion" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.eereedakey.key_name
  subnet_id              = module.vpc.public_subnets[0]
  count                  = var.instance_count
  vpc_security_group_ids = [aws_security_group.eereeda-bastion-sg.id]

  tags = {
    Name    = "eereeda-bastion"
    PROJECT = "eereeda"
  }

  provisioner "file" {
    content     = templatefile("templates/db-deploy.tmpl", { rds-endpoint = aws_db_instance.eereeda-rds.address, dbuser = var.dbuser, dbpass = var.dbpass })
    destination = "/tmp/eereeda-dbdeploy.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/eereeda-dbdeploy.sh",
      "sudo /tmp/eereeda-dbdeploy.sh"
    ]
  }

  connection {
    user        = var.USERNAME
    private_key = file(var.PRIV_KEY_PATH)
    host        = self.public_ip
  }
  depends_on = [aws_db_instance.eereeda-rds]
}