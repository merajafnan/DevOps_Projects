resource "aws_key_pair" "eereedakey" {
  key_name   = "eereeda-terraform-key"
  public_key = file(var.PUB_KEY_PATH)
}