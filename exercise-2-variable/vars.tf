variable "REGION" {
  default = "us-east-1"
}
variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIA" {
  type = map(any)
  default = {
    us-east-1 = "ami-0cff7528ff583bf9a"
    us-east-2 = "ami-02d1e544b84bf7502"
  }
}
