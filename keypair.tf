resource "aws_key_pair" "eereedakey" {
  key_name = "eereeda-terraform-key"
  public_key = file(var.PRIV_KEY_PATH)
}